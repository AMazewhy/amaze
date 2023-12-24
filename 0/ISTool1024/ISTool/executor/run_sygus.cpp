//
// Created by pro on 2022/2/15.
//

#include "istool/selector/split/splitor.h"
#include "istool/invoker/invoker.h"
#include "istool/sygus/sygus.h"
#include "istool/sygus/parser/parser.h"
#include "istool/ext/z3/z3_example_space.h"
#include "istool/sygus/theory/z3/bv/bv_z3.h"
#include "istool/ext/composed_semantics/composed_z3_semantics.h"
#include "istool/ext/composed_semantics/composed_rule.h"
#include <istool/ext/composed_semantics/composed_semantics.h>
#include "istool/basic/config.h"
#include <ctime>
#include <fstream>
#include <queue>
#include <iostream>

#include <signal.h>
#include <unistd.h>

#include <future>
#include <chrono>

#ifdef PROFILER
#include <gperftools/profiler.h>
#endif


// 定义全局变量表示是否超时
volatile sig_atomic_t timeout = 0;
// 定义信号处理函数
void alarm_handler(int signum)
{
    timeout = 1;
}


//整体的框架 可能需要一些硬编码
//给定DSL，给定字符串表示的一个目标程序，得到它排第几个 done
//给定DSL，给定字符串表示的一个目标程序，得到为了产生它需要使用的规则次数 done
//1.parse字符串 2.得到最小匹配 尤其关注那些composedrule的使用 
//str.++(str.substr(Param0,0,1),str.substr(Param0,str.indexof(Param0," ",0),str.len(Param0)))
//给定DSL，给定可使用的规则次数，得到可以产生的程序数目 done

struct hash_pair{
    template <class T1,class T2>
    size_t operator()(const std::pair<T1,T2>& p) const
    {
        auto hash1 = std::hash<T1>{}(p.first);
        auto hash2 = std::hash<T2>{}(p.second);
        return hash1^hash2;
    }
};

class StringNode{
public: 
    std::string name;
    std::vector<StringNode*> sub_nodes;
    StringNode(const std::string& _name);
    ~StringNode();
};

StringNode::StringNode(const std::string& _name): name(_name){}

StringNode::~StringNode(){
    //for (auto* n:sub_nodes){
    //    delete n;
    //}
}

//str.substr(Param0,0,1),str.substr(Param0,str.indexof(Param0," ",0),str.len(Param0))
//找到不在括号里的第一个

StringNode* constructroot(const std::string& stringp);
int match(NonTerminal* n,StringNode* root,std::unordered_map<std::string,int>& roottocntcache,std::atomic_bool & run);
long double exactcnt(NonTerminal *nonterminal, int cnt, std::unordered_map< std::pair<NonTerminal*,int> , long double,hash_pair>& cache, std::unordered_map<std::string,std::unordered_map< std::pair<int,int>,long double,hash_pair>>& combineprogramcache);



// 设置超时时间并执行函数
template<typename Func>
int execute_with_timeout(Func func, int timeout_secs,NonTerminal* n,StringNode* root,std::unordered_map<std::string,int>& roottocntcache)
{
    // 注册信号处理函数
    signal(SIGALRM, alarm_handler);
    // 设置定时器
    alarm(timeout_secs);
    // 执行函数并等待结果
    int result = func(n,root,roottocntcache);
    // 取消定时器
    alarm(0);
    if (!timeout)
        return result;
    else
        return 1000;
    //return result && !timeout;
}

int getdepth(StringNode* root,std::unordered_map<std::string,int> &depthcache){
    int cnt = 1;
    for (StringNode* nn:root->sub_nodes){
        cnt = cnt + getdepth(nn,depthcache);
    }
    if (depthcache[root->name] < cnt){
        depthcache[root->name] = cnt;
    }
    return cnt;
}

std::string roottostring(StringNode* root){//只需要保证唯一 所以直接广度的节点名称list也可以
    std::string output = "";
    std::queue<StringNode*> bfs;
    bfs.push(root);
    while (!bfs.empty()){
        StringNode* tmp = bfs.front();
        bfs.pop();
        output += ' ';
        output += tmp->name;
        for (auto sub_node: tmp->sub_nodes){
            bfs.push(sub_node);
        }
    }
    return output;
}


// def __repr__(self, level=0):
//         ret = "\t"*level+repr(self.value)+"\n"
//         for child in self.children:
//             ret += child.__repr__(level+1)
//         return ret

std::string roottotreestring(StringNode* root,int level = 0){
    std::string ret = "";
    for (int i = 0; i < level; i++){
        ret = ret + "\t";
    }
    ret = ret + root->name + "\n";
    for (auto sub_node: root->sub_nodes){
        ret = ret + roottotreestring(sub_node,level+1);
    }
    return ret;
}

std::vector<StringNode *> helpconstruct(const std::string& stringp){
    //std::cout<<"subnodes:"<<stringp<<std::endl;
    std::vector<StringNode*> sub_nodes;
    auto cnt = 0;
    auto cnt1 = 0;
    auto cnt2 = 0;
    auto idx = 0;
    for (int i = 0; i < stringp.length();i++){
        if (stringp[i] == '(' && i!=0 && (stringp[i-1]!='"' || stringp[i+1]!='"')){
            cnt++;
        }
        else if (i==stringp.length()-1 || stringp[i] == ')' and (stringp[i-1]!='"' || stringp[i+1]!='"'))
        {
            cnt--;
        }
        else if (stringp[i] == '\''){
            cnt1 = 1 - cnt1;
        }
        else if (stringp[i] =='\"'){
            cnt2 = 1 - cnt2;
        }
        else if (stringp[i] == ',')
        {
            if (cnt != 0 || cnt1!=0 || cnt2!=0){
                continue;
            }
            std::string s = stringp.substr(idx,i-idx);
            idx = i + 1;
            StringNode *newnode = constructroot(s);
            sub_nodes.push_back(newnode);
        }    
    }
    std::string s = stringp.substr(idx,-1);
    StringNode *newnode = constructroot(s);
    sub_nodes.push_back(newnode);
    return sub_nodes;
}

StringNode* constructroot(const std::string& stringp){//str.substr(0,3) str.substr(3,-1)
    auto idx = 0;
    for (int i = 0; i<stringp.length(); i++){
        if (stringp[i] == '(' && i!=0 && stringp[i-1]!='"'){
            auto name = stringp.substr(0,i);
            StringNode* root = new StringNode(name);
            //std::cout<<name<<std::endl;
            root->sub_nodes = helpconstruct(stringp.substr(i+1,stringp.length()-i-2));//去掉最后一个括号
            std::cout<<stringp.substr(i+1,stringp.length()-i-2)<<std::endl;
            return root;
        }
    }
    //单个程序无括号 
    StringNode* root = new StringNode(stringp);
    root->sub_nodes = std::vector<StringNode*>();
    // std::cout<<stringp<<std::endl;
    // std::cout<<roottostring(root)<<std::endl;
    // exit(0);
    return root;
}

void search(StringNode * n){
    std::cout<<n->name<<std::endl;
    for (StringNode* nn:n->sub_nodes){
        //std::cout<<nn->name<<std::endl;
        search(nn);
    }
}

//从symbol_list[0]开始计算

void unfoldCompressedSemantics(Grammar* grammar) {
    for (auto* symbol: grammar->symbol_list) {
        for (auto*& rule: symbol->rule_list) {
            auto* dr = dynamic_cast<ConcreteRule*>(rule);
            if (!dr) continue;
            auto* cs = dynamic_cast<ComposedSemantics*>(dr->semantics.get());
            if (!cs) continue;
            auto* pre_rule = rule;
            rule = new ComposedRule(cs->body, rule->param_list);
            delete pre_rule;
        }
    }
}



std::unordered_map< std::pair<int,int> , std::vector<std::vector<int>>,hash_pair> combine_k_n;
//std::string bvbase_name = "shr1shr4shr16shl1if0";

//和为n，k个非负整数的组合方案
//修改为和为n，k个正整数的组合方案
auto combines(int k, int n, std::unordered_map< std::pair<int,int> , std::vector<std::vector<int>>,hash_pair> &combine_k_n){
    std::pair<int,int> p1 = std::make_pair(k,n);
    if (combine_k_n.find(p1) != combine_k_n.end()) return combine_k_n[p1];
    std::vector<std::vector<int>> res;
    if (n<0)
        return res;
    if (n==0) {
        std::vector<int> resin(k,0);
        res.push_back(resin);
        return res;
    }
    if (k==1) {
        std::vector<int> resin(1,n);
        res.push_back(resin);
        return res;
    }
    for (auto i = 0; i<=n ; i++) {
        auto left_res = combines(k-1,n-i,combine_k_n);
        for (auto p:left_res){
            p.insert(p.begin(),i);
            res.push_back(p);
        }
    }
    combine_k_n[p1] = res;
    return res;
}


// long double calcombine(NonTerminal *nonterminal,int n, int k, std::unordered_map< std::pair<int,int>,long double,hash_pair>& combineprogramcache, std::unordered_map< std::pair<NonTerminal*,int> , long double,hash_pair>& cache){//bv 只有一个nonterminal;string是有多个nonterminal的
//     if (k < n) return (long double)0;
//     if (n == 1) return exactcnt(nonterminal,k,cache,combineprogramcache);
//     long double res = 0;
//     std::pair<int,int>p1 = std::make_pair(n,k);
//     if (combineprogramcache.find(p1) != combineprogramcache.end()) return combineprogramcache[p1];

//     if (k == n) {
//         long double ansonce = exactcnt(nonterminal,1,cache,combineprogramcache);
//         res = 1;
//         for (auto i = 0;i < k;i++){
//             res = res * ansonce;
//         }
//         combineprogramcache[p1] = res;
//         return res;
//     }

//     //long double res = 0;
//     for (int t = 0; t < k; t++){
//         res = res + calcombine(nonterminal,n-1,t,combineprogramcache,cache)*exactcnt(nonterminal,k-t,cache,combineprogramcache);
//     }
//     combineprogramcache[p1] = res;
//     return res;
// }

long double calcombine(std::vector<NonTerminal*> param_list,std::string name,int n, int k, std::unordered_map<std::string,std::unordered_map< std::pair<int,int>,long double,hash_pair>>& combineprogramcache, std::unordered_map< std::pair<NonTerminal*,int> , long double,hash_pair>& cache){//bv 只有一个nonterminal;string是有多个nonterminal的
    if (k < n) return (long double)0;
    if (n == 1) return exactcnt(param_list[0],k,cache,combineprogramcache);
    long double res = 0;
    std::pair<int,int>p1 = std::make_pair(n,k);
    if (combineprogramcache.find(name) != combineprogramcache.end()){
        if (combineprogramcache[name].find(p1) != combineprogramcache[name].end()) return combineprogramcache[name][p1];
    }
    

    if (k == n) {
        res = 1;
        for (auto i = 0;i < k;i++){
            long double ansonce = exactcnt(param_list[i],1,cache,combineprogramcache);
            res = res * ansonce;
        }
        combineprogramcache[name][p1] = res;
        return res;
    }

    //long double res = 0;
    for (int t = 0; t < k; t++){
        res = res + calcombine(param_list,name,n-1,t,combineprogramcache,cache)*exactcnt(param_list[n-1],k-t,cache,combineprogramcache);
    }
    combineprogramcache[name][p1] = res;
    return res;
}

//long long 不够 long double 可以
long double exactcnt(NonTerminal *nonterminal, int cnt, std::unordered_map< std::pair<NonTerminal*,int> , long double,hash_pair>& cache, std::unordered_map<std::string,std::unordered_map< std::pair<int,int>,long double,hash_pair>>& combineprogramcache) {
    std::pair<NonTerminal*,int>p1 = std::make_pair(nonterminal,cnt);
    if (cache.find(p1) != cache.end()) return cache[p1];

    if (cnt == 0){
        std::cout<<"cnterror"<<std::endl;
        return (long double)0;
    }
    if (cnt == 1){
        long double paramorconst = 0;//常数或参数的数目就是
        for (auto rule =nonterminal->rule_list.rbegin(); rule != nonterminal->rule_list.rend(); rule++) {
            auto* ps = grammar::getParamSemantics(*rule);
            if (ps) {
                paramorconst++;
                continue;
            }
            auto* cs = grammar::getConstSemantics(*rule);
            if (cs) {
                paramorconst++;
                continue;
            }
        }
        cache[p1] = paramorconst;
    }
    else{
        long double generated_program_cnt = 0;
        for (auto rule = nonterminal->rule_list.rbegin(); rule != nonterminal->rule_list.rend(); rule++) {
            auto* ps = grammar::getParamSemantics(*rule);
            if (ps) {
                continue;
            }
            auto* cs = grammar::getConstSemantics(*rule);
            if (cs) {
                continue;
            }
            auto len = (*rule)->param_list.size();//当前规则有多少个参数
            assert(len>=1);
            //和为cnt-1，len个非负整数的组合方案
            // auto plans = combines(len,cnt-1-len,combine_k_n);//此处保证了每一个至少为1
            // for (auto v:plans){
            //     assert(v.size()==len);
            //     long double oneplangened = 1;
            //     for (size_t i = 0;i<v.size();i++){
            //         int d = v[i]+1;//添加了1
            //         oneplangened = oneplangened*exactcnt((*rule)->param_list[i],d,cache,combineprogramcache);
            //     }              
            //     generated_program_cnt = generated_program_cnt + oneplangened;
            // }

            auto* dr = dynamic_cast<ConcreteRule*>(*rule);
            std::string name;
            if (dr) {
                auto* cs = dynamic_cast<ComposedSemantics*>(dr->semantics.get());
                name = dr->semantics.get()->name;//func5 or basicrulename  !!!有两个ite
                if (name == "ite"){
                    //std::cout<<nonterminal->type->getName()<<std::endl;
                    if (nonterminal->type->getName() == "String")
                        name = "ite1";
                    else
                        name = "ite2";
                }
            }
            auto tmp = calcombine((*rule)->param_list,name,len,cnt-1,combineprogramcache,cache);
            //std::cout<<"-------------------------"<<name<<":"<<tmp<<std::endl;
            generated_program_cnt = generated_program_cnt + tmp;

        }
        cache[p1] = generated_program_cnt;
    }
    return cache[p1];
}

//matchPProgram 嵌套之后怎么处理
auto matchPProgram(PProgram p, StringNode* root,std::unordered_map<int,NonTerminal*>& cachemap,std::unordered_map<int,std::string>& parammap,std::unordered_map<std::string,int>& roottocntcache,std::atomic_bool & run){//要传引用！
    if (!run)
    {
        throw std::runtime_error("timeout");
    }
    auto pn = p->semantics.get()->name;
    //std::cout << pn << std::endl;
    if (pn.substr(0,5) == "Param"){
        auto cnt = std::atoi(pn.substr(5,1).c_str());
        auto res = 0;
        if (parammap.find(cnt) == parammap.end()){
            res = match(cachemap[cnt],root,roottocntcache,run);//需要保证Paramx只被搜索一次 后续再遇到Paramx应当 1.如果是组合函数里的，则直接不再枚举，验证与之前得到的完全相同；2.如果是子结构单纯复用，类似于要加的cache直接获取匹配次数
            parammap[cnt] = roottostring(root);
        }
        else{
            if (parammap[cnt] == roottostring(root)){
                res = 0;
            }
            else{
                res = 1000;//不匹配 两个部分的子程序不相同
                //std::cout << parammap[cnt] << std::endl;
                //std::cout << roottostring(root) << std::endl;
            }
        }
        return res;
    }
    if ((p->semantics.get()->name != root->name)){
        return 1000;
    }
    else{
        if (p->sub_list.size() != root->sub_nodes.size())
            return 1000;
        auto res = 0;
        for (auto i = 0; i<p->sub_list.size();i++){
            auto tmp = matchPProgram(p->sub_list[i],root->sub_nodes[i],cachemap,parammap,roottocntcache,run);
            res = res + tmp;
        }
        return res;
    }
    std::cout<<"matchPPerror"<<std::endl;
    return 0;//?
}

auto matchrule(Rule* r,StringNode* root,std::unordered_map<std::string,int>& roottocntcache,std::atomic_bool & run){//rule有多种
    if (!run)
    {
        throw std::runtime_error("timeout");
    }
    auto* ps = grammar::getParamSemantics(r);
    if (ps){
        if (root->name.substr(0,5) == "Param")//暂时处理，应对不同文件的不同样例
            return 1;
        if (root->name == "x")//bv所有param为1
            return 1;
        if (ps->getName() == root->name){
            std::cout<<ps->getName()<<std::endl;
            exit(-1);
            return 1; //成功匹配,20231112检查 string用不到这个判定
        }
    }
    auto* cs = grammar::getConstSemantics(r);
    if (cs){
        if (root->name.substr(0,1) == "#")//bv所有const形如#x0000
            return 1;
        if (root->name.substr(0,1) == "\"" or root->name.substr(0,1)=="\'")//字符常量
            return 1;
        auto s = root->name;
        if (s.substr(0,1)=="-" and s.size()>1)//负数
            return 1;
        if (s.substr(0,1)>="0" and s.substr(0,1)<="9")//正数
            return 1;
        if (cs->getName() == root->name){
            std::cout<<cs->getName()<<std::endl;
            exit(-1);
            return 1;//成功匹配,20231112检查 string用不到这个判定
        }
    }
    auto* dr = dynamic_cast<ConcreteRule*>(r);
    if (dr){
        std::unordered_map<int,NonTerminal*> cachemap;  
        std::unordered_map<int,std::string> parammap; //确保每一个paramX对应于同一段子程序
        for (auto i = 0;i< dr->param_list.size();i++){//doublerep Param0 Param1 ... Param5
            cachemap[i] = dr->param_list[i];   //理论上应该都是对应于不同的paramX
        }
        auto flag = true;
        // auto idx = bvbase_name.find(dr->semantics.get()->name);
        // if (idx == std::string::npos)
        //     ;
        // else
        //     flag = false;
        auto* cs = dynamic_cast<ComposedSemantics*>(dr->semantics.get());
        if (cs && flag){//flag表示排除bv中作为基础存在的一些操作符 //0824已经将操作符展开
            auto body = cs->body;//多层嵌套的rule如何验证
            auto res = matchPProgram(body,root,cachemap,parammap,roottocntcache,run) + 1;//+1？
            return res;
        }
        else{
            //正常rule
            if (dr->semantics.get()->name != root->name){
                return 1000;
            }
            if (dr->param_list.size() != root->sub_nodes.size())
                return 1000;
            else{
                auto res = 1;
                for (auto i = 0;i<dr->param_list.size();i++){
                    res = res + match(dr->param_list[i],root->sub_nodes[i],roottocntcache,run);
                }
                return res;
            }
        }
    }
    std::cout<<"matchrule error"<<std::endl;
    return 0;
}

//int nnnnn=0;
//不同的字符串可能对应不同的start和常量 对应生成不同的文件是否合适（吉老师之前提过修改常量修改start symbol的操作）
//匹配非终结符和root 要保证n和root类型相同
int match(NonTerminal* n,StringNode* root,std::unordered_map<std::string,int>& roottocntcache,std::atomic_bool & run){
    if (!run)
    {
        throw std::runtime_error("timeout");
    }
    auto rootstring = roottostring(root);
    if (roottocntcache.find(rootstring)!= roottocntcache.end()){
        // nnnnn=nnnnn+1;
        // std::cout<<nnnnn<<std::endl;
        return roottocntcache[rootstring];
    }
    auto minmatch = 1000;
    for (auto* r:n->rule_list){
        auto res = matchrule(r,root,roottocntcache,run);
        if (res < minmatch)
            minmatch = res;
    }
    //if (minmatch < 1000)
    roottocntcache[rootstring] = minmatch;
        //std::cout<<roottotreestring(root,0)<<std::endl;
        //std::cout<<minmatch<<std::endl;
    return minmatch;
}

//硬编码以下根据编号决定 startsymbol

auto bvstrans(std::string ss){//tested
    if (ss.find("(") == ss.npos)
        return ss;
    std::string news = "";
    //auto l1 = ss.length()-1;//直接复制得到的结果会多余一个括号 修改后应该不会多一个括号？
    auto l1 = ss.length();
    auto i = 0;
    auto j = 0;
    auto firstafterleft = false;
    while (j<l1)
    {
        if (ss[j] == '('){
            firstafterleft = true;
            j = j + 1;
            i = j;
            continue;
        }
        if (ss[j] == ' '){
            if (firstafterleft){
                std::string tmp = ss.substr(i,j-i);
                news = news + tmp + '(';
                firstafterleft = false;
                j = j + 1;
                i = j;
            }
            else{
                std::string tmp = ss.substr(i,j-i);
                news = news + tmp + ',';
                j = j + 1;
                i = j;
            }
        }
        else if (ss[j] == ')'){
            std::string tmp = ss.substr(i,j-i);
            news = news + tmp + ')';
            j = j + 1;
            i = j;
        }
        else{
            j = j + 1;
        }
    }
    return news;

}

int main(int argc, char** argv) {
    /*
    std::vector<std::string> v1 = {"str.++","str.replace","str.at","int.to.str","ite","str.substr","+","-","str.len","str.to.int","str.indexof","str.prefixof","str.suffixof","str.contains"};
    std::unordered_map<std::string,int> depthcache;
    for (auto s:v1){
        depthcache[s] = 0;
    }
    std::string train_file_name;
    std::string benchmark;
    std::string cnt0;
    std::string s0 = "/home/citceae/DSL/trainset/";
    benchmark = argv[1];
    for (auto i = 1;i<=40;i++){
        train_file_name = s0 + std::to_string(i) + ".out";
        std::ifstream readFile;
        readFile.open(train_file_name);
        std::vector<std::string> file_in;
        if (readFile){
            std::cout<<"success"<<std::endl;
            std::string temp;
            while(getline(readFile,temp))
                file_in.push_back(temp);
        }
        else
            std::cout<<"fail"<<std::endl;
        readFile.close();
        for (const auto &i:file_in){
            auto root = constructroot(i);
            auto tmpdepth = getdepth(root,depthcache);
        }
    }
    for (auto i:depthcache){
        std::cout<<i.first<<":"<<i.second<<std::endl;
    }
    return 0;
    */
    // std::string ss = "(if0 (bvand x #x0000000000000001) (shr1 (bvadd x #x0000000000000001)) (shl1 x))";
    // std::string bvs = bvstrans(ss);
    // std::cout<<bvs<<std::endl;
    // return 0;


    long double output = 0;
    std::string path = "/home/ztye/experiments/obestring/0/DSL/";
    std::string gene;
    
    std::string benchmark_name;
    std::string benchmark_id;

    std::string metainfo = path + "metafile/metainfo.txt";//存训练集文件序号和symbol_list[0]的类型

    if (argc == 3){
        gene = argv[1];
        benchmark_id = argv[2];
        benchmark_name = path + "TrainGenes/" + gene + "/" + benchmark_id + "_.sl";

        auto *spec = parser::getSyGuSSpecFromFile(benchmark_name);
        auto& info = spec->info_list[0];
        NonTerminal* n = info->grammar->symbol_list[0];
        // std::cout<<n->type->getName()<<std::endl;
        // std::cout<<"size:"<<info->grammar->symbol_list.size()<<std::endl;
        // std::cout<<info->grammar->symbol_list[0]->type->getName()<<std::endl;
        // std::cout<<info->grammar->symbol_list[1]->type->getName()<<std::endl;
        

        std::ofstream fout;
        fout.open(metainfo,std::ofstream::app);
        fout<<benchmark_id<<' '<<n->type->getName()<<std::endl;
        fout.close();


        return 0;
    }
    else if (argc == 4){
        //for test
        gene = argv[1];
        benchmark_id = argv[2];
        benchmark_name = path + "TrainGenes/" + gene + "/" + benchmark_id + "_.sl";

        auto *spec = parser::getSyGuSSpecFromFile(benchmark_name);
        auto& info = spec->info_list[0];

        std::unordered_map< std::pair<NonTerminal*,int> , long double,hash_pair> cache;

        std::unordered_map<std::string,std::unordered_map< std::pair<int,int>,long double,hash_pair>> combineprogramcache;

        std::string train_file = path + "trainset/" + benchmark_id + ".out";//string
        std::ifstream readFile;
        readFile.open(train_file);
        std::vector<std::string> file_in;
        if (readFile){
            std::string temp;
            while(getline(readFile,temp))
                file_in.push_back(temp);
        }
        else
            std::cout<<"readfail"<<std::endl;
        readFile.close();

        if (0 == file_in.size()){
            std::ofstream fout;
            fout.open(path+"result/" + benchmark_id + ".txt",std::ofstream::out);
            fout<<0<<std::endl;
            fout.close();
            return 0; //无对应out文件
        }

        std::unordered_map<std::string,int> roottocntcache;
        for (const auto &ss:file_in){
            auto transs = ss;
            auto root = constructroot(transs);//bv需要bvstrans
            std::cout<<roottostring(root)<<std::endl;

            std::atomic_bool run;
            run = true;
            std::future<int> result = std::async(std::launch::async, match, info->grammar->symbol_list[0],root,std::ref(roottocntcache),std::ref(run));
            int newres=1000;
            if (result.wait_for(std::chrono::seconds(10)) == std::future_status::timeout) {
                run = false;
            }

            try
            {
                newres = result.get();
            }
            catch (const std::runtime_error & ex)
            {
                // Handle timeout here
                newres = 1000;
                //std::cout << "Got timeout...";
            }


            //std::cout <<"ans =" << newres << std::endl;
            if (newres >= 1000){
                //std::cout <<"continue"  << std::endl;
                continue;
            }
            else{
                std::cout <<"ans =" << newres << std::endl;
                // return 0;
                long double res = 0;
                long double oldone = 0;
                long double newone = 0;
                long double newratio = 0;
                long double oldratio = 0;
                //std::unordered_map<int, long double> reslist;
                //std::vector<long double> reslist;
                for (auto i = 1;i<=newres;i++){
                    newone = exactcnt(info->grammar->symbol_list[0],i,cache,combineprogramcache);
                    newratio = oldone/newone;
                    std::cout<<newone<<std::endl;
                    //std::cout<<i-1<<'/'<<i<<':'<<newratio<<std::endl;
                    //std::cout<<"delta ratio="<<oldratio-newratio<<std::endl;
                    oldratio = newratio;
                    oldone = newone;
                    res = res + newone;
                    
                }
                if (output == 0){
                    output = res;
                }
                else{
                    if (output > res)
                        output = res;
                }
            }
        }

        //std::cout<<"1--------------------------------"<<std::endl;
        std::ofstream fout;
        fout.open(path+"result/" + benchmark_id + ".txt",std::ofstream::out);
        fout<<output<<std::endl;
        fout.close();
        return 0;
    }
    else{
        assert(argc == 2);
    }
    
    gene = argv[1];
    //benchmark_id = argv[2];
    //benchmark_name = path + "TrainGenes/" + gene + "/" + benchmark_id + "_.sl";

    // benchmark_name = path + "src_bv/test_.sl";

    benchmark_name = path + "metafile/metaString.sl";
    auto *spec0 = parser::getSyGuSSpecFromFile(benchmark_name);
    auto info0 = spec0->info_list[0];
    benchmark_name = path + "metafile/metaInt.sl";
    auto *spec1 = parser::getSyGuSSpecFromFile(benchmark_name);
    auto info1 = spec1->info_list[0];
    benchmark_name = path + "metafile/metaBool.sl";
    auto *spec2 = parser::getSyGuSSpecFromFile(benchmark_name);
    auto info2 = spec2->info_list[0];
    auto *spec = spec0;


    // return 0;

    //根据metainfo给出解 metainfo 格式为：文件编号 类型
    //cache能否共享？cache是对每个终结符给的 所以可以共享
    std::unordered_map<std::string,std::string> metacache;
    std::vector<std::string> file_ids;
    std::ifstream readInfo;
    readInfo.open(metainfo);
    std::vector<std::string> info_in;
    if (readInfo){
        std::string temp;
        while(getline(readInfo,temp))
            info_in.push_back(temp);
    }
    else
        std::cout<<"readinfofail"<<std::endl;
    readInfo.close();

    for (auto m:info_in){
        int pos = m.find(" ");
        std::string id = m.substr(0,pos);
        std::string id_type = m.substr(pos+1,m.size());
        metacache[id] = id_type;
        file_ids.push_back(id);
        // std::cout<<id<<std::endl;
        // std::cout<<type<<std::endl;
    }
    // for (auto id:file_ids){
    //     std::cout<<id<<std::endl;
    // }


    std::unordered_map< std::pair<NonTerminal*,int> , long double,hash_pair> cache;
    std::unordered_map<std::string,std::unordered_map< std::pair<int,int>,long double,hash_pair>> combineprogramcache;
    std::vector<std::string> file_in;
    std::unordered_map<std::string,int> roottocntcache;

    for (auto id:file_ids){
        //std::cout<<id<<std::endl;
        cache.clear();
        combineprogramcache.clear();
        file_in.clear();
        roottocntcache.clear();
        output = 0;
        //std::string s0 = "/home/ztye/experiments/obestring/0/DSL/trainset/";//准备好的训练集地址
        //std::string train_file = path + "src_bv/trainset/" + benchmark_id + ".out";//bv
        std::string train_file = path + "trainset/" + id + ".out";//string
        std::ifstream readFile;
        readFile.open(train_file);
        
        if (readFile){
            std::string temp;
            while(getline(readFile,temp))
                file_in.push_back(temp);
        }
        else
            std::cout<<"readfail"<<std::endl;
        readFile.close();

        

        //for (auto s:file_in)
        //    std::cout<<s<<std::endl;

        if (0 == file_in.size()){//但是后续可能会给出解 为了feature齐次需要也有一位输出
            std::ofstream fout;
            fout.open(path+"result.txt",std::ofstream::app);
            fout<<0<<' '<<0<<std::endl;//1121修改为最小匹配次数+位次
            fout.close();
            //std::cout<<1<<std::endl;
            continue; //无对应out文件
        }
        
        // file_in.clear();
        // std::string testcase = "str.substr(Param0,1,str.len(Param0))";
        // file_in.push_back(testcase);
        // std::string testcase2 = "str.substr(Param0,1,str.len(\"/\"))";
        // file_in.push_back(testcase2);
        
        //std::cout<<"123"<<std::endl;

        auto info=info0;
        //int symbol_id = 0;
        if (metacache[id] == "String")
            info = info0;
        else if (metacache[id] == "Int")
            info = info1;
        else if (metacache[id] == "Bool")
            info = info2;
        else
            assert(false);//BV不需要metacache,类型全都只有一个
        // std::cout<<id<<":"<<info->grammar->symbol_list[0]->type->getName()<<std::endl;


        // std::cout<<"id:"<<symbol_id<<std::endl;
        // std::cout<<"size:"<<info->grammar->symbol_list.size()<<std::endl;
        // std::cout<<info->grammar->symbol_list[0]->type->getName()<<std::endl;
        // std::cout<<info->grammar->symbol_list[1]->type->getName()<<std::endl;
        // std::cout<<"----------------"<<std::endl;

        int newres;
        int minops = 1000;
        for (const auto &ss:file_in){
            //auto transs = bvstrans(ss);//bv need it
            auto transs = ss;
            //std::cout<<transs<<std::endl;
            auto root = constructroot(transs);//bv需要bvstrans
            // std::cout<<roottotreestring(root,0)<<std::endl;
            //std::cout<< roottostring(root)<<std::endl;
            // return 0;
            //continue; //瓶颈在匹配的环节上

            //timeout = 0;
            //auto newres = execute_with_timeout(match,10,info->grammar->symbol_list[0],root,roottocntcache);//遇到复杂的会很慢  设置超时

            std::atomic_bool run;
            run = true;
            

            std::future<int> result = std::async(std::launch::async, match, info->grammar->symbol_list[0],root,std::ref(roottocntcache),std::ref(run));
            newres=1000;
            if (result.wait_for(std::chrono::seconds(10)) == std::future_status::timeout) {
                run = false;
            }
        
            //auto newres = match(info->grammar->symbol_list[0],root,roottocntcache);

            try
            {
                newres = result.get();
            }
            catch (const std::runtime_error & ex)
            {
                // Handle timeout here
                newres = 1000;
                std::cout << "Got timeout...";
                return 0;//应该不会触发timeout了
            }


            //std::cout <<"ans =" << newres << std::endl;
            if (newres >= 1000){
                //std::cout <<"continue"  << std::endl;
                continue;
            }
            else{
                // std::cout <<"ans = " << newres << std::endl;
                // std::cout<<roottocntcache.size()<<std::endl;
                // for(std::unordered_map<std::string,int>::iterator it=roottocntcache.begin();it!=roottocntcache.end();++it)
                //     std::cout<<it->first<<"  :"<<it->second<<std::endl;
                // return 0;
                long double res = 0;
                long double oldone = 0;
                long double newone = 0;
                long double newratio = 0;
                long double oldratio = 0;
                //std::unordered_map<int, long double> reslist;
                //std::vector<long double> reslist;
                for (auto i = 1;i<=newres;i++){
                    newone = exactcnt(info->grammar->symbol_list[0],i,cache,combineprogramcache);
                    newratio = oldone/newone;
                    //std::cout<<i-1<<'/'<<i<<':'<<newratio<<std::endl;
                    //std::cout<<"delta ratio="<<oldratio-newratio<<std::endl;
                    oldratio = newratio;
                    oldone = newone;
                    res = res + newone;
                    //std::cout << res << std::endl;
                    //std::pair<int,long double>p1 = std::make_pair(i,res);
                    //reslist[i] = res;
                    //reslist.push_back(res);
                    // if (i == 50){
                    //     std::cout<<reslist[0]*reslist[0]*reslist[47]<<std::endl;
                    //     std::cout<<reslist[9]*reslist[19]*reslist[19]<<std::endl;
                    //     return 0;
                    // }
                    
                }
                if (output == 0){
                    output = res;
                    minops = newres;
                }
                else{
                    if (output > res){
                        output = res;
                        minops = newres;
                    }
                }
            }
        }

        //std::cout<<"1--------------------------------"<<std::endl;
        std::ofstream fout;
        fout.open(path+"result.txt",std::ofstream::app);
        fout<<minops<<' '<<output<<std::endl;
        fout.close();
    }
    //std::cout<<output<<std::endl;

    /*
    for (int i = 0;i<cases.size();i++){
        std::string train_file = s0+std::to_string(cases[i])+".out";
        std::ifstream readFile;
        readFile.open(train_file);
        std::vector<std::string> file_in;
        if (readFile){
            //std::cout<<"success"<<std::endl;
            std::string temp;
            while(getline(readFile,temp))
                file_in.push_back(temp);
        }
        else
            std::cout<<"fail"<<std::endl;
        readFile.close();
        for (const auto &ss:file_in){
            auto root = constructroot(ss);
            //search(root);
            auto idx = 0;
            if (cases[i] == 13 or cases[i] == 24 or cases[i] == 28)
                idx = 2;
            if (cases[i] == 15)
                idx = 1;
            auto newres = match(info->grammar->symbol_list[idx],root);
            if (newres == 1000){
                continue;
            }
            else{
                long double res = 0;
                for (auto i = 1;i<=newres;i++){
                    res = res + exactcnt(info->grammar->symbol_list[idx],i,cache);
                }
                if (output[i] == 0){
                    output[i] = res;
                }
                else{
                    if (output[i] > res)
                        output[i] = res;
                }
            }
        }
    }
    std::ofstream fout;
    fout.open("/home/citceae/DSL/result.txt");
    for (auto i:output){
        fout<<i<<std::endl;
    }
    */



    return 0;
    
    
    /*

    //auto p = combines(3,4,combine_k_n);
    //for (auto i:p){
    //    for (auto j:i)
    //        std::cout<<j<<" ";
    //    std::cout<<std::endl;
    //}
    //std::string s = "str.substr(Param0,+(1,str.indexof(Param0,\"-\",-(Param1,2))),str.indexof(Param0,\"-\",2))";
    std::string s = "str.substr(Param0,-(Param1,2),3)";
    //std::string s = "str.replace(str.replace(Param0,\" \",\"\"),\" \",\"\")";
    auto root = constructroot(s);  
    search(root); 
    //std::cout<<"________________________________"<<std::endl;
    //int depth = getdepth(root,depthcache);
    //std::cout<<depth<<std::endl;
    //return 0;


    std::string benchmark_name;
    int cnt;
    benchmark_name = argv[1];
    cnt = std::atoi(argv[2]);


    auto *spec = parser::getSyGuSSpecFromFile(benchmark_name);
    auto& info = spec->info_list[0];
    //info->grammar->print();//是不是自带把start转到symbol_list[0]了来着 如果是的话
    //上述创建过程已经将symbol_list[0]设置为Start 且对于限制深度已经做了裁剪
    std::cout<<"done"<<std::endl;
    

    std::unordered_map< std::pair<NonTerminal*,int> , long double,hash_pair> cache;
    long double res = 0;
    for (auto i = 1;i<=cnt;i++){
        res = res + exactcnt(info->grammar->symbol_list[0],i,cache);
    }
    std::cout<<res<<std::endl;
    //unfoldCompressedSemantics(info->grammar);
    //info->grammar->print();
    std::cout<<"------------------------"<<std::endl;
    //std::cout<<info->grammar->symbol_list[0]->rule_list[5]->toString();
    /*
    auto r = info->grammar->symbol_list[0]->rule_list[5];
    auto* cr = dynamic_cast<ConcreteRule*>(r);
    if (cr) {
        auto a = cr->semantics.get();
        auto b = a->name;
        std::cout<<b<<std::endl;//能获得组合rule和一般rule的名字 但是展开组合rule的话就不可以 下方方式可以获得组合规则
        for (auto p:cr->param_list){
            std::cout<<p->name<<std::endl;
        }

    }
    else{
        std::cout<<"none"<<std::endl;
    }
    auto* dr = dynamic_cast<ConcreteRule*>(r);
    if (dr) {
        auto* cs = dynamic_cast<ComposedSemantics*>(dr->semantics.get());
        if (cs) {
            auto body = cs->body;
            auto bs = body->semantics.get();
            auto bn = bs->name;
            std::cout<<bn<<std::endl;
            auto bb = body->sub_list;
            for (auto p:bb){
                std::cout<<p->semantics.get()->name<<std::endl;
            }
        }
    }
    auto newres = match(info->grammar->symbol_list[0],root);
    std::cout<<newres<<std::endl;

    
    



    return 0;
    */
    std::cout<<"--------------------------------------"<<std::endl;


    assert(argc == 4 || argc == 1 || argc == 2 || argc == 3);
    std::string output_name, solver_name;
    if (argc == 4) {
        benchmark_name = argv[1];
        output_name = argv[2];
        solver_name = argv[3];
    } else if(argc == 2){
        std::string file_name = argv[1];
        solver_name = "eusolver";
        //std::vector<double> record;
        int solved = 0;
        double time_sum = 0;
        for (int i = 1;i <= 21; ++i){
            std::string in_name = std::to_string(i)+".sl";
            std::string out_name = std::to_string(i)+".out";
            benchmark_name = file_name + in_name;
            output_name = file_name + out_name;

            auto *spec = parser::getSyGuSSpecFromFile(benchmark_name);
            auto* v = sygus::getVerifier(spec);
            spec->env->random_engine.seed(time(0));

            auto solver_token = invoker::string2TheoryToken(solver_name);
            auto* guard = new TimeGuard(200);

            InvokeConfig config;
            if (solver_name == "cbs" && sygus::getSyGuSTheory(spec->env.get()) == TheoryToken::BV) {
                theory::loadZ3BV(spec->env.get());
                ext::z3::registerComposedManager(ext::z3::getExtension(spec->env.get()));
            }
            if (solver_name == "cbs") config.set("encoder", std::string("Tree"));
            if (solver_name == "obe") {
                config.set("isWeighted", true);
                for (auto& info: spec->info_list) {
                    info->grammar = ext::grammar::rewriteComposedRule(info->grammar);
                }
            }
            try {
                auto result = invoker::getExampleNum(spec, v, solver_token, guard, config);
                std::cout << i << std::endl;
                std::cout << result.first << " " << result.second.toString() << std::endl;
                std::cout << guard->getPeriod() << std::endl;
                solved = solved +1 ;
                time_sum = time_sum + guard->getPeriod();
                FILE* f = fopen(output_name.c_str(), "w");
                fprintf(f, "%d %s\n", result.first, result.second.toString().c_str());
                fprintf(f, "%.10lf\n", guard->getPeriod());
            } catch (...) {
                FILE* f = fopen(output_name.c_str(), "w");
                fprintf(f, "time>200\n");
            }
        }
        std::string result_name = file_name + "resulte1.txt";
        FILE* f = fopen(result_name.c_str(), "w");
        fprintf(f, "%d %.10lf\n", solved, time_sum/solved);
        return 0;
    } else if(argc == 3){
        solver_name = "obe";

        std::string benchmark_file = argv[1];
        std::string base_file = argv[2];
        int solved = 0;
        double time_sum = 0;
        for (int i = 1;i <= 3; ++i){
            std::string in_name = std::to_string(i)+".sl";
            std::string out_name = std::to_string(i)+".out";
            benchmark_name = benchmark_file + in_name;
            output_name = base_file + out_name;
            std::string base_name = base_file + "base.sl";

            auto *spec = parser::getSyGuSSpecFromFile(benchmark_name);
            auto *spec_base = parser::getSyGuSSpecFromFile(base_name);
            auto &info = spec->info_list[0];
            auto &info_base = spec_base->info_list[0];
            //info_base->grammar->start = info->grammar->start;

            //if (i==3){
            //    LOG(INFO) << "grammar "; info->grammar->print();
            //    LOG(INFO) << "grammar "; info_base->grammar->print(); 
            //}
            //LOG(INFO) << "grammar "; info->grammar->print();
            //LOG(INFO) << "grammar "; info_base->grammar->print();
            for (auto* symbol_base: info_base->grammar->symbol_list) {
                for (auto* symbol: info->grammar->symbol_list) {
                    if (symbol_base->name != symbol->name)
                        continue;
                    for (auto rule =symbol->rule_list.rbegin(); rule != symbol->rule_list.rend(); rule++) {
                        auto* ps = grammar::getParamSemantics(*rule);
                        if (ps) {
                            //std::cout<<"1:"<<std::endl;
                            symbol_base->rule_list.insert(symbol_base->rule_list.begin(),*rule);
                        }
                        auto* cs = grammar::getConstSemantics(*rule);
                        if (cs) {
                            //auto feature = cs->w.toString();
                            //if (feature == "0"){
                            //    continue;
                            //}
                            //std::cout<<"2:"<<feature<<std::endl;
                            symbol_base->rule_list.insert(symbol_base->rule_list.begin(),*rule);
                        }
                    }
                }
            }
            //LOG(INFO) << "grammar "; info_base->grammar->print();
            bool flag = false;
            std::vector<Rule *>::iterator rule;
            for (auto* symbol_base: info_base->grammar->symbol_list) {
                for (rule = symbol_base->rule_list.begin(); rule != symbol_base->rule_list.end(); rule++) {
                    auto* cs = grammar::getConstSemantics(*rule);
                    if (cs) {
                        auto feature = cs->w.toString();
                        if (feature == "1145141919"){
                            //std::cout<<"find"<<std::endl;
                            (symbol_base->rule_list).erase(rule);
                            //std::cout<<"done"<<std::endl;
                            flag = true;
                            break;
                        }
                    }
                }
                if (flag)
                    break;
            }
            //LOG(INFO) << "grammar "; info_base->grammar->print();
            info->grammar = info_base->grammar;
            int pos = -1;
            for (int i = 0; i < info->grammar->symbol_list.size(); ++i) {
                if (info->grammar->symbol_list[i]->name == info->grammar->start->name) {
                    pos = i;
                }
            }
            if (pos == -1) {
                LOG(FATAL) << "Start symbol (" << info->grammar->start->name << ") not found";
            }
            std::swap(info->grammar->symbol_list[0], info->grammar->symbol_list[pos]);
            //LOG(INFO) << "grammar "; info->grammar->print();

            auto* v = sygus::getVerifier(spec);
            spec->env->random_engine.seed(time(0));

            auto solver_token = invoker::string2TheoryToken(solver_name);
            auto* guard = new TimeGuard(200);

            InvokeConfig config;
            if (solver_name == "cbs" && sygus::getSyGuSTheory(spec->env.get()) == TheoryToken::BV) {
                theory::loadZ3BV(spec->env.get());
                ext::z3::registerComposedManager(ext::z3::getExtension(spec->env.get()));
            }
            if (solver_name == "cbs") config.set("encoder", std::string("Tree"));
            if (solver_name == "obe") {
                config.set("isWeighted", true);
                for (auto& info: spec->info_list) {
                    info->grammar = ext::grammar::rewriteComposedRule(info->grammar);
                }
            }

            try {
                auto result = invoker::getExampleNum(spec, v, solver_token, guard, config);
                std::cout << i << std::endl;
                std::cout << result.first << " " << result.second.toString() << std::endl;
                std::cout << guard->getPeriod() << std::endl;
                solved = solved +1 ;
                time_sum = time_sum + guard->getPeriod();
                FILE* f = fopen(output_name.c_str(), "w");
                fprintf(f, "%d %s\n", result.first, result.second.toString().c_str());
                fprintf(f, "%.10lf\n", guard->getPeriod());
            } catch (...) {
                FILE* f = fopen(output_name.c_str(), "w");
                fprintf(f, "time>200\n");
            }

        }
        //std::string result_name = base_file + "result3.txt";
        //FILE* f = fopen(result_name.c_str(), "w");
        //fprintf(f, "%d %.10lf\n", solved, time_sum/solved);
        return 0;
    }
    else {
        solver_name = "obe";
        //benchmark_name = "/tmp/tmp.wHOuYKwdWN/tests/bv/PRE_icfp_gen_14.10.sl";
        //benchmark_name = "/tmp/tmp.wHOuYKwdWN/tests/mpg_guard2_non_half.sl";
        benchmark_name = config::KSourcePath + "/tests/x.sl";
        output_name = "/tmp/629453237.out";
    }

#ifdef PROFILER
    ProfilerStart((config::KSourcePath + "init.prof").c_str());
#endif

    //auto *spec = parser::getSyGuSSpecFromFile(benchmark_name);
    auto* v = sygus::getVerifier(spec);
    spec->env->random_engine.seed(time(0));

    auto solver_token = invoker::string2TheoryToken(solver_name);
    auto* guard = new TimeGuard(200);

    InvokeConfig config;
    if (solver_name == "cbs" && sygus::getSyGuSTheory(spec->env.get()) == TheoryToken::BV) {
        theory::loadZ3BV(spec->env.get());
        ext::z3::registerComposedManager(ext::z3::getExtension(spec->env.get()));
    }
    if (solver_name == "cbs") config.set("encoder", std::string("Tree"));
    if (solver_name == "obe") {
        config.set("isWeighted", true);
        for (auto& info: spec->info_list) {
            info->grammar = ext::grammar::rewriteComposedRule(info->grammar);
        }
    }

    auto result = invoker::getExampleNum(spec, v, solver_token, guard, config);
    std::cout << result.first << " " << result.second.toString() << std::endl;
    std::cout << guard->getPeriod() << std::endl;
    FILE* f = fopen(output_name.c_str(), "w");
    fprintf(f, "%d %s\n", result.first, result.second.toString().c_str());
    fprintf(f, "%.10lf\n", guard->getPeriod());
}
