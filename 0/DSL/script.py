'''
traingen：根据编号求解每个对应文件的100个解
获取所有json文件脚本
记录string benchmark前后名称映射的脚本
根据指定json文件序号获取对应header、tailer和string常数、int常数的函数 gethtsi
根据基因、目标文件编号、和对应的header等信息在path处生成基因对应的.sl文件 createfile
'''
import os
import json
import random 
import csv
import subprocess
import sys
import time
import math
import copy
from transfer import transtobase

def tmpcopy(source,dest):
    s = []
    with open(source,'r') as f:
        for line in f.readlines():
            s.append(line.strip())
    flag = False
    with open(dest,'w') as f:
        for line in s:
            if not flag:
                if line.count(' ') >= 3 and '-' in line:
                    flag = True
                    print(line,file=f)
            else:
                if 'F' in line:
                    break
                print(line,file = f)

def newtraingen(trainset,srcpath = '/home/ztye/experiments/obestring/0/DSL/'):
    outputpath = srcpath + "fulloutput/"
    trainsetpath = srcpath + "trainset/"
    # print(trainsetpath)
    # print(os.path.exists(trainsetpath))
    if os.path.exists(trainsetpath):
        cmdline = 'rm -rf ' + trainsetpath
        os.system(cmdline)
        cmdline = 'mkdir ' + trainsetpath
        os.system(cmdline)
    else:
        cmdline = 'mkdir ' + trainsetpath
        os.system(cmdline)

    cmdline = 'python3 /home/ztye/experiments/obestring/0/ISTool/ISTool/runner/python/main.py {}'.format('fulloutput')
    os.system(cmdline)

    for i in trainset:
        print("start " + str(i) + ":")
        outputname = outputpath + str(i) + ".out"

        #收集到trainset中，此处应为第一次
        trainsetname = trainsetpath + str(i) + ".out"
        s = []
        with open(outputname, 'r') as f:
            for line in f.readlines():
                s.append(line.strip())
        if len(s) == 4:
            #baseanswer = transtobase(s[1],[])
            idx1 = s[0].index("{")
            idx2 = s[0].index("}")
            ans = s[0][idx1+3:idx2]
            baseanswer = transtobase(ans,[])#BV中需要，string在后续有compose之后迭代也需要
            #之后需要检验是否相同
            with open(trainsetname,'a') as f:
                print(baseanswer,file=f)
        else:#无解
            with open(trainsetname,'a') as f:
                print('',file=f) 
    
def traingenwithoutrun(trainset,srcpath = '/home/ztye/experiments/obestring/0/DSL/'):
    outputpath = srcpath + "fulloutput/" #已有
    trainsetpath = srcpath + "trainset/"
    if os.path.exists(trainsetpath):
        cmdline = 'rm -rf ' + trainsetpath
        os.system(cmdline)
        cmdline = 'mkdir ' + trainsetpath
        os.system(cmdline)
    else:
        cmdline = 'mkdir ' + trainsetpath
        os.system(cmdline)

    # cmdline = 'python3 /home/ztye/experiments/obestring/0/ISTool/ISTool/runner/python/main.py {}'.format('fulloutput')
    # os.system(cmdline)

    for i in trainset:
        print("start " + str(i) + ":")
        outputname = outputpath + str(i) + ".out"

        #收集到trainset中，此处应为第一次
        trainsetname = trainsetpath + str(i) + ".out"
        s = []
        with open(outputname, 'r') as f:
            for line in f.readlines():
                s.append(line.strip())
        if len(s) == 4:
            #baseanswer = transtobase(s[1],[])
            idx1 = s[0].index("{")
            idx2 = s[0].index("}")
            ans = s[0][idx1+3:idx2]
            baseanswer = transtobase(ans,[])#BV中需要，string在后续有compose之后迭代也需要
            #之后需要检验是否相同
            with open(trainsetname,'a') as f:
                print(baseanswer,file=f)
        else:#无解
            with open(trainsetname,'a') as f:
                print('',file=f) 

def traingen(trainset,benchmarkname,execpath = "/home/ztye/experiments/obestring/0/ISTool/ISTool/build/executor/test",filepath="/home/ztye/experiments/obestring/0/DSL"):
    trainsetpath = filepath+'/trainset'
    if os.path.exists(trainsetpath):
        cmdline = 'rm -rf ' + trainsetpath
        os.system(cmdline)
        cmdline = 'mkdir ' + trainsetpath
        os.system(cmdline)
    else:
        cmdline = 'mkdir ' + trainsetpath
        os.system(cmdline)

    benchmark_path = filepath + '/' + benchmarkname
    output_path = filepath + '/trainset'
    for i in trainset:
        print("start "+str(i)+':')
        cmdline = execpath + ' ' + benchmark_path + '/' + str(i) + '.sl' + ' > ' + output_path + '/' + str(i) + '.out'
        os.system(cmdline)


def getstringjson(path = "/home/ztye/experiments/obestring/0/DSL",cnt = 209):#一次性无需修改
    inputpath = path + '/benchmark_string'
    outputpath = path + '/string_json'
    pyfile = path + '/python/main.py'
    for i in range(cnt):
        inputfile = inputpath + '/' + str(i) + '.sl'
        outputfile = outputpath + '/' + str(i) + '.json'
        cmdline = 'python3 ' + pyfile + ' ' + inputfile + ' ' + outputfile
        print(cmdline)
        os.system(cmdline)

def getbvjson(path = "/home/ztye/experiments/obestring/0/DSL",cnt=753):
    pass

#getstringjson()

#benchmark重命名以及记录映射关系，方便根据名称直接划分训练集数据集
def rename(path):#左右斜杠 一次性无需修改
    #path = path + '/' + 'benchmark_string'
    filesname = os.listdir(path)
    recordmap = {}
    cnt = 0
    for fname in filesname:
        recordmap[cnt] = fname
        cmdline = 'mv ' + path + '/' + fname + ' ' + path + '/' + str(cnt) + '.sl'
        cnt = cnt + 1
        os.system(cmdline)
    for key in recordmap:
        print(str(key)+':'+str(recordmap[key]))
    return 

def create_one_sci(arr):#arr = tmp[1][4][1]
    sci =''
    for it in arr[2]:
        if type(it) != type([]):
            sci = sci + it
        elif it[0] == 'String':
            sci = sci + '"' + it[1] + '"'
        else:
            break
        if it != arr[2][-1]:
            sci = sci + ' '
    return sci

def create_stringconsti(allarr):#allarr = tmp[1][4][1]的组合
    ntSci = []
    for arr in allarr:
        onesci = create_one_sci(arr)
        ntSci.append(onesci)
    return ntSci

def create_one_ici(arr):#arr = tmp[1][4][2]
    ici = ''
    for it in arr[2]:
        if type(it) != type([]):
            ici = ici + it
        elif it[0] == 'Int':
            ici = ici + str(it[1])
        else:
            break
        if it != arr[2][-1]:
            ici = ici + ' '
    return ici

def create_intconsti(allarr):#allarr = tmp[1][4][2]的组合
    ntIci = []
    for arr in allarr:
        onesci = create_one_ici(arr)
        ntIci.append(onesci)
    return ntIci

def create_one_header(arr): #arr = tmp[1]
    s = '('
    assert(arr[0]=='synth-fun')
    s = s + 'synth-fun'
    assert(arr[1]=='f')
    s = s + ' f'

    assert(len(arr[2]) > 0) #param
    s = s + ' ('
    for pa in arr[2]: 
        s = s + '(' + pa[0] + ' ' + pa[1] + ')'
        if pa != arr[2][-1]:
            s = s + ' '
    s = s + ')'

    s = s + ' ' + arr[3]
    s1 = s 

    s = ''
    s = '( ('
    startarr = arr[4][0]
    s = s + startarr[0] + ' ' + startarr[1] + ' ' + '(' + startarr[2][0] + '))'
    s2 = s
    return [s1,s2]


def create_header(allarr):# allarr = tmp[1]的组合
    header = []
    for arr in allarr:
        oneheader = create_one_header(arr)
        header.append(oneheader)
    return header

def create_one_tailer(arr):# arr = tmp[2:]
    ret = []
    ret.append('))')
    for t in arr:
        if t[0] == 'constraint':
            ct = '(constraint ('
            assert(t[1][0] ==  '=') #限制条件暂时都为=给出的
            ct = ct + '= ('
            ct = ct + t[1][1][0] + ' ' #'f'
            # for pa in t[1][1][1:]:
            #     if pa[0] == 'String':
            #         ct = ct + '"' + pa[1] + '"'
            #     elif pa[0] == 'Int':
            #         ct = ct + str(pa[1])
            #     else:
            #         assert(False)
            #     if pa!=t[1][1][-1]:#中间参数有可能一样
            #         ct = ct + ' '
            for i,pa in enumerate(t[1][1][1:]):
                if pa[0] == 'String':
                    ct = ct + '"' + pa[1] + '"'
                elif pa[0] == 'Int':
                    ct = ct + str(pa[1])
                else:
                    assert(False)
                if i!=len(t[1][1][1:]) - 1:#中间参数有可能一样
                    ct = ct + ' '
            ct = ct + ') '
            if t[1][2][0] == 'String':
                ct = ct + '"' + t[1][2][1] + '"'
            elif t[1][2][0] == 'Int':
                ct = ct + str(t[1][2][1])
            elif t[1][2][0] == 'Bool':
                ct = ct + t[1][2][1]
                #assert(False)
            else:
                assert(False)
            ct = ct + '))'
            ret.append(ct)
        elif t[0] == 'check-synth':
            ct = '(check-synth)'
            ret.append(ct)
        elif t[0] == 'define-fun':
            pass#不加答案
        elif t[0] == 'declare-var':
            pass#应该也不需要变量名
        else:
            print(t)
            assert(False)
    return ret

def create_tailer(allarr):# allarr = tmp[2:]的组合
    tailer = []
    for arr in allarr:
        onetailer = create_one_tailer(arr)
        tailer.append(onetailer)
    return tailer

def metagethtsi():
    metaheader ={'String':['(synth-fun f ((_arg_0 String) (_arg_1 Int)) String', '( (Start String (ntString))'], 'Int':['(synth-fun f ((_arg_0 String) (_arg_1 Int)) Int', '( (Start Int (ntInt))'], 'Bool':['(synth-fun f ((_arg_0 String) (_arg_1 Int)) Bool', '( (Start Bool (ntBool))']}
    metatailer = ['))', '(constraint (= (f "Mining US") "Mining"))', '(constraint (= (f "Soybean Farming CAN") "Soybean Farming"))', '(constraint (= (f "Soybean Farming") "Soybean Farming"))', '(constraint (= (f "Oil Extraction US") "Oil Extraction"))', '(constraint (= (f "Fishing") "Fishing"))', '(check-synth)']
    metaSci = '_arg_0 ""'
    metaIci = '_arg_0 1 0 -1'
    return metaheader,metatailer,metaSci,metaIci

def gethtsi(cntlist = [0,5],path = "/home/ztye/experiments/obestring/0/DSL/string_json"):#cntlist应为全集
    headerarr = []# allarr = tmp[1]的组合
    tailerarr = []# allarr = tmp[2:]的组合
    sciarr = []#allarr = tmp[1][4][1]的组合
    iciarr = []#allarr = tmp[1][4][2]的组合
    for cnt in cntlist:
        filepath = path + '/' + str(cnt) + '.json'
        with open(filepath, 'r') as f:
            tmp = json.load(f)
        headerarr.append(tmp[1])
        tailerarr.append(tmp[2:])
        sciarr.append(tmp[1][4][1])
        iciarr.append(tmp[1][4][2])
    header = create_header(headerarr)
    tailer = create_tailer(tailerarr)
    sci = create_stringconsti(sciarr)
    ici = create_intconsti(iciarr)
    return header,tailer,sci,ici
    
#根据json文件获取所需要的信息，应对所有文件保留对应记录
# with open('0.json', 'r') as f: #一个tmp是一个文件信息
#     tmp = json.load(f) #1中包含了常量、函数体信息；2往后包含了约束条件信息

# print(tmp[1][4])
# print(tmp[1][4][2][2])


# # a=create_header([tmp[1]])
# # print(a)
# b = create_stringconsti([tmp[1][4][1]])
# for i in b:
#     print(i)
# b = create_intconsti([tmp[1][4][2]])
# for i in b:
#     print(i)

# header,tailer,sci,ici = gethtsi()
# print(header)
# print(tailer)
# print(sci)
# print(ici)

def createmetafile(genes,metapath,metaIci,ntIntapp,metaSci,ntStringapp,funcs,metaheader,metatailer):
    t = '	'
    ntIntbase = [
    '(+ ntInt ntInt)',
    '(- ntInt ntInt)',
    '(str.len ntString)',
    '(str.to.int ntString)',
    '(ite ntBool ntInt ntInt)',
    '(str.indexof ntString ntString ntInt)']

    ntStringbase = [
    '(str.++ ntString ntString)',
    '(str.replace ntString ntString ntString)',
    '(str.at ntString ntInt)',
    '(int.to.str ntInt)',
    '(ite ntBool ntString ntString)',
    '(str.substr ntString ntInt ntInt)']

    ntBoolconst = 'true false'    
    ntBoolbase = [
    '(= ntInt ntInt)',
	'(str.prefixof ntString ntString)',
	'(str.suffixof ntString ntString)',
	'(str.contains ntString ntString)']
    #'(ite ntBool ntBool ntBool)']#eusolver特供

    signal = -1
    #TODO:eusolver需要特殊处理吗
    #eusolver特供 后续ite相关也是
    # suffix = header[num][0][-7:]
    # signal = -1
    # if 'String' in suffix:
    #     signal = 0
    # elif 'Int' in suffix:
    #     signal = 1
    # elif 'Bool' in suffix:
    #     signal = 2
    # else:
    #     print(num)
    #     print(header[num])
    #     quit()
    #到此为止

    ntStringfinal = []
    #print(num)
    ntStringfinal.append(metaSci) #num直接对应
    len1 = len(ntStringapp)#目前仅有ntStringapp和ntIntapp且按照此顺序
    for i in range(0,len1):
        if genes[i] == '1':
            ntStringfinal.append(ntStringapp[i])

    ntIntfinal = []
    ntIntfinal.append(metaIci)
    len2 = len1 + len(ntIntapp)
    for i in range(len1,len2):
        if genes[i] == '1':
            ntIntfinal.append(ntIntapp[i-len1])        

    ntStringbasecp = ntStringbase.copy()
    len3 = len2 + len(ntStringbase)
    for i in range(len2,len3):
        #if i == 19:#ite 保留
        #    continue
        if 'ite' in ntStringbase[i-len2] and signal == 0:
            continue 
        if genes[i] == '1':
            ntStringbasecp.remove(ntStringbase[i-len2])
    for nt in ntStringbasecp:
        ntStringfinal.append(nt)

    

    ntIntbasecp = ntIntbase.copy()
    len4 = len3 + len(ntIntbase)
    for i in range(len3,len4):#这里的ite不需要保留吗#0921我也想知道为啥不需要保留吗 eusolver能解决Start是Int但是没有ite的吗 都看情况保留
        if 'ite' in ntIntbase[i-len3] and signal == 1:
            continue
        if genes[i] == '1':
            ntIntbasecp.remove(ntIntbase[i-len3])
    for nt in ntIntbasecp:
        ntIntfinal.append(nt)

    
    ntBoolfinal = []
    ntBoolfinal.append(ntBoolconst)
    ntBoolbasecp = ntBoolbase.copy()
    len5 = len4 + len(ntBoolbase)
    #assert(len5 == LenGene)
    for i in range(len4,len5):
        if 'ite' in ntBoolbase[i-len4] and signal == 2:
            continue
        if genes[i] == '1':
            ntBoolbasecp.remove(ntBoolbase[i-len4])
    for nt in ntBoolbasecp:
        ntBoolfinal.append(nt)
    
    for key in metaheader:
        filename = metapath + '/metafile/meta'+key+'.sl'
        with open(filename,'w') as f:
            for p in funcs:
                print(p,file=f)
            for p in metaheader[key]:
                print(p,file=f)
            #if genes[31] == '1':
            #    p = ' (ntString@30 String ('
            #else:
            p = ' (ntString String ('
            print(p,file=f)
            for p in ntStringfinal:
                p_= t+p
                print(p_,file=f)
            print('))',file=f)
            #if genes[32] =='1':
            #    p = ' (ntInt@14 Int ('
            #else:
            p = ' (ntInt Int ('
            print(p,file=f)
            for p in ntIntfinal:
                p_ = t+p
                print(p_,file=f)
            print('))',file=f)
            #if genes[33] =='1':
            #    p = ' (ntBool@10 Bool ('
            #else:
            p = ' (ntBool Bool ('
            print(p,file=f)
            for p in ntBoolfinal:
                p_=t+p
                print(p_,file=f)
            print('))',file=f)
            for p in metatailer:
                print(p,file=f)
        


def createfile(genes,num,path,ntIci,ntIntapp,ntSci,ntStringapp,funcs,header,tailer):#eusolver根据header的信息修改一下保留的ite是哪一个 注意还要加上一个ite Bool Bool Bool
    t = '	'
    ntIntbase = [
    '(+ ntInt ntInt)',
    '(- ntInt ntInt)',
    '(str.len ntString)',
    '(str.to.int ntString)',
    '(ite ntBool ntInt ntInt)',
    '(str.indexof ntString ntString ntInt)']

    ntStringbase = [
    '(str.++ ntString ntString)',
    '(str.replace ntString ntString ntString)',
    '(str.at ntString ntInt)',
    '(int.to.str ntInt)',
    '(ite ntBool ntString ntString)',
    '(str.substr ntString ntInt ntInt)']

    ntBoolconst = 'true false'    
    ntBoolbase = [
    '(= ntInt ntInt)',
	'(str.prefixof ntString ntString)',
	'(str.suffixof ntString ntString)',
	'(str.contains ntString ntString)']
    #'(ite ntBool ntBool ntBool)']#eusolver特供

    signal = -1
    #eusolver特供 后续ite相关也是
    # suffix = header[num][0][-7:]
    # signal = -1
    # if 'String' in suffix:
    #     signal = 0
    # elif 'Int' in suffix:
    #     signal = 1
    # elif 'Bool' in suffix:
    #     signal = 2
    # else:
    #     print(num)
    #     print(header[num])
    #     quit()
    #到此为止

    ntStringfinal = []
    #print(num)
    ntStringfinal.append(ntSci[num]) #num直接对应
    len1 = len(ntStringapp)#目前仅有ntStringapp和ntIntapp且按照此顺序
    for i in range(0,len1):
        if genes[i] == '1':
            ntStringfinal.append(ntStringapp[i])

    ntIntfinal = []
    ntIntfinal.append(ntIci[num])
    len2 = len1 + len(ntIntapp)
    for i in range(len1,len2):
        if genes[i] == '1':
            ntIntfinal.append(ntIntapp[i-len1])        

    ntStringbasecp = ntStringbase.copy()
    len3 = len2 + len(ntStringbase)
    for i in range(len2,len3):
        #if i == 19:#ite 保留
        #    continue
        if 'ite' in ntStringbase[i-len2] and signal == 0:
            continue 
        if genes[i] == '1':
            ntStringbasecp.remove(ntStringbase[i-len2])
    for nt in ntStringbasecp:
        ntStringfinal.append(nt)

    

    ntIntbasecp = ntIntbase.copy()
    len4 = len3 + len(ntIntbase)
    for i in range(len3,len4):#这里的ite不需要保留吗#0921我也想知道为啥不需要保留吗 eusolver能解决Start是Int但是没有ite的吗 都看情况保留
        if 'ite' in ntIntbase[i-len3] and signal == 1:
            continue
        if genes[i] == '1':
            ntIntbasecp.remove(ntIntbase[i-len3])
    for nt in ntIntbasecp:
        ntIntfinal.append(nt)

    
    ntBoolfinal = []
    ntBoolfinal.append(ntBoolconst)
    ntBoolbasecp = ntBoolbase.copy()
    len5 = len4 + len(ntBoolbase)
    #assert(len5 == LenGene)
    for i in range(len4,len5):
        if 'ite' in ntBoolbase[i-len4] and signal == 2:
            continue
        if genes[i] == '1':
            ntBoolbasecp.remove(ntBoolbase[i-len4])
    for nt in ntBoolbasecp:
        ntBoolfinal.append(nt)
    
    filename = path + '/' + str(num) + '_.sl'
    with open(filename,'w') as f:
        for p in funcs:
            print(p,file=f)
        for p in header[num]:
            print(p,file=f)
        #if genes[31] == '1':
        #    p = ' (ntString@30 String ('
        #else:
        p = ' (ntString String ('
        print(p,file=f)
        for p in ntStringfinal:
            p_= t+p
            print(p_,file=f)
        print('))',file=f)
        #if genes[32] =='1':
        #    p = ' (ntInt@14 Int ('
        #else:
        p = ' (ntInt Int ('
        print(p,file=f)
        for p in ntIntfinal:
            p_ = t+p
            print(p_,file=f)
        print('))',file=f)
        #if genes[33] =='1':
        #    p = ' (ntBool@10 Bool ('
        #else:
        p = ' (ntBool Bool ('
        print(p,file=f)
        for p in ntBoolfinal:
            p_=t+p
            print(p_,file=f)
        print('))',file=f)
        for p in tailer[num]:
            print(p,file=f)

def getonegene(LenGene):#无限制深度
    s = ''
    for i in range(LenGene):
        if random.random()>0.5:
            s = s + '1'
        else:
            s = s + '0'
    return s


def _deal_thread(thread_pool, pos):
    status = thread_pool[pos]["thread"].poll()
    if status is not None and status != 1:
        # output_file = thread_pool[pos]["output_file"]
        # name = thread_pool[pos]["name"]
        # result = _read_all_lines(output_file)
        # if name not in cache: cache[name] = []
        # if len(result) == 0:
        #     cache[name].append({"status": False})
        # else:
        #     res = result[:-1]
        #     time_cost = float(result[-1])
        #     cache[name].append({"status": True, "result": res, "time": time_cost})
        # #os.system("rm %s" % output_file)
        thread_pool[pos] = None


def _run_command(thread_pool, command):
    pos = None
    while pos is None:
        for i in range(len(thread_pool)):
            if thread_pool[i] is not None:
                _deal_thread(thread_pool, i)
            if thread_pool[i] is None:
                pos = i
        time.sleep(0.1)

    #print(command)
    thread_pool[pos] = {
        "thread": subprocess.Popen(command, stdout=subprocess.PIPE, shell=True)
    }


def _join_all(thread_pool):
    while True:
        is_clear = True
        for i in range(len(thread_pool)):
            if thread_pool[i] is not None:
                _deal_thread(thread_pool, i)
                is_clear = False
        if is_clear: return

#totalt = 0.0

def getvalue(gene,popdict,PATH, exepath,train_set,geneticpath=''):#path1 = PATH,path2 = run_sygus #遗传算法时调用geneticpath 训练时应为''，遗传算法时应为cache/
    #改成一次性的利用metagrammar生成 done  TODO:test
    
    if gene in popdict:
        return popdict[gene]
    
    #if gene == '0':...就把trainset编号也加过去？#清空metainfo并加信息 done
    if '1' not in gene:
        #t1 = time.perf_counter()
        metainfopath = PATH + "/metafile/metainfo.txt"
        cmdline = 'rm ' + metainfopath
        os.system(cmdline)
        cmdline = 'touch ' + metainfopath
        os.system(cmdline)
        for i in train_set:
            cmdline = exepath + ' ' + gene + ' ' + str(i)
            os.system(cmdline)
        #t2 = time.perf_counter()
        #print(t2-t1)

    

    resultpath = PATH + '/result.txt'
    cmdline = 'rm ' + resultpath
    os.system(cmdline)
    cmdline = 'touch ' + resultpath
    os.system(cmdline)

    cmdline = exepath + ' ' + gene
    os.system(cmdline)

    value = []

    f = open(resultpath)
    
    while True:
        lines = f.readlines(10000)
        if not lines:
            break
        for line in lines:
            #value.append(eval(line))#理论上只有一行
            value.append([eval(l) for l in line.split()])
    f.close()

    #value = [math.log(v) if v>0 else 0 for v in value]
    value = [[k[0],math.log(k[0]+0.001),math.log(k[1])] if k[1]>0 else [k[0],math.log(k[0]+0.001),0] for k in value]
    popdict[gene] = value
    return value#value is a list of [展开次数，log(展开次数），log(位次)]

    
    
    
    #global totalt
    if gene in popdict:
        return popdict[gene]
    
    thread_pool = [None for _ in range(4)]

    # resultpath = PATH + "/result.txt"
    # cmdline = 'rm ' + resultpath
    # os.system(cmdline)
    # cmdline = 'touch ' + resultpath
    # os.system(cmdline)

    t1 = time.perf_counter()
    for file_id in train_set:
        # cmdline = exepath + ' ' + geneticpath + gene + ' ' + str(file_id)
        # os.system(cmdline)
        command = exepath + ' ' + geneticpath + gene + ' ' + str(file_id)
        _run_command(thread_pool,command)

    _join_all(thread_pool)
    t2 = time.perf_counter()
    #totalt+=(t2-t1)

    #在这里收集所有输出的feature值 每个feature在一个result里
    #这个地方文件交互的太多了可能
    #去掉这个部分待会再测一次
    #TODO:
    value = []
    for file_id in train_set:
        resultpath = PATH + '/result/' + str(file_id) + '.txt'
        f = open(resultpath)
    
        while True:
            lines = f.readlines(10000)
            if not lines:
                break
            for line in lines:
                value.append(eval(line))#理论上只有一行
        f.close()
    popdict[gene] = value

    return value

def listratio(sample,popdict,PATH,exepath,train_set,geneticpath=''):#比例作为特征值
    value1 = getvalue(sample,popdict,PATH,exepath,train_set,geneticpath)
    value2 = getvalue('0'*len(sample),popdict,PATH,exepath,train_set,geneticpath)
    cntlist = []
    for i in range(len(value1)):
        if value1[i] == 0:
            #res = value2[i]/timeout     #buggy
            res = 0
            cntlist.append(res)
        else:
            res = value2[i]/value1[i]
            cntlist.append(res)
    return cntlist  

def countdelete(sample,len_each):#0为app，1为remove
    cnt = 0
    left = len_each[0]
    right = len_each[0] + len_each[1]
    for i in range(left,right):
        if sample[i] == '1':
            cnt = cnt + 1
    return cnt

def countappend(sample,len_each):#
    cnt = 0
    left =0
    right = len_each[0]
    for i in range(left,right):
        if sample[i] == '1':
            cnt = cnt + 1
    return cnt

def countfails(sample,popdict,PATH,exepath,train_set,geneticpath=''):
    cnt = 0 
    value = getvalue(sample,popdict,PATH,exepath,train_set,geneticpath)#value = popdict[sample]?理论上都应该在
    for v in value:
        if v == 0:
            cnt = cnt + 1
    return cnt 

def getfeature(sample,feature_map,popdict,PATH,exepath,train_set,len_each,geneticpath=''):#字典是引用
    if sample in feature_map:
        return feature_map[sample]
    
    if '0'*len(sample) not in feature_map:
        value0 = getvalue('0'*len(sample),popdict,PATH,exepath,train_set,geneticpath)
        feature0 = copy.deepcopy(value0)
        for i in range(len(value0)):
            if value0[i][1] == 0:#表示无解
                feature0[i].append(0)
            else:
                feature0[i].append(1)
        cntdelete = countdelete('0'*len(sample),len_each)
        #feature.append(cntdelete)
        cntappend = countappend('0'*len(sample),len_each)
        #feature.append(cntappend)
        for i in range(len(feature0)):
            feature0[i].append(cntappend)
            feature0[i].append(cntdelete)
        feature_map['0'*len(sample)] = feature0

    # print(feature_map['0'*len(sample)])
    # print('--------------------------------------')


    value = getvalue(sample,popdict,PATH,exepath,train_set,geneticpath)
    # print(value[0])
    # quit()
    feature=copy.deepcopy(value)
    for i in range(len(value)):
        if value[i][1] == 0:#表示无解
            feature[i].append(0)
        else:
            feature[i].append(1)
    cntdelete = countdelete(sample,len_each)
    #feature.append(cntdelete)
    cntappend = countappend(sample,len_each)
    #feature.append(cntappend)
    for i in range(len(feature)):
        feature[i].append(cntappend)
        feature[i].append(cntdelete)
    #print(feature)
    # for f in order:
    #     feature.append(f)

    # ratio = listratio(sample,popdict,PATH,exepath,train_set,geneticpath) 
    # for f in ratio:
    #     feature.append(f)
    # cntdelete = countdelete(sample,len_each)
    # feature.append(cntdelete)
    # cntappend = countappend(sample,len_each)
    # feature.append(cntappend)
    # cntfail = countfails(sample,popdict,PATH,exepath,train_set,geneticpath)
    # feature.append(cntfail)
    # for i in sample:#最后每一位，有这个就不应该归一化
    #     feature.append(int(i))
    feature_map[sample] = feature
    #print(feature_map[sample])
    
    return feature

def get_real_timelist(TrainGenePath,gene,train_set,timeout = 300):#获取实际求解时间列表
    timelist = []
    samplepath = TrainGenePath + '/' + gene
    #filesname = os.listdir(samplepath)
    for file_id in train_set:
        outfilename = samplepath + '/' + str(file_id) + '_.out'
        f = open(outfilename)
        lines = f.readlines()
        if len(lines) == 0:
            timelist.append(timeout)
        elif len(lines) == 4:
            timelist.append(eval(lines[3]))
        f.close()
    return timelist

def get_ratio_from_two_timelist(timelist0,timelist1):
    ratio = 1.0
    for i in range(len(timelist0)):
        ratio = ratio * timelist0[i]/timelist1[i]
    ratio = ratio**(1/len(timelist0))
    return ratio

def get_real_ratio(basetimelist,TrainGenePath,gene,train_set,ratio_map):#以全0为base获取加速比
    if gene in ratio_map:
        return ratio_map[gene]
    if len(basetimelist) == 0:
        basetimelist = get_real_timelist(TrainGenePath,'0'*len(gene),train_set)
    selftimelist = get_real_timelist(TrainGenePath,gene,train_set)
    ratio = 1.0
    for i in range(len(selftimelist)):
        ratio = ratio * basetimelist[i]/selftimelist[i]
    ratio = ratio**(1/len(train_set))
    ratio_map[gene] = ratio
    return ratio

def get_max_min_ratio(TrainGenePath,LenGene,train_set,ratio_map):
    basetimelist = get_real_timelist(TrainGenePath,'0'*LenGene,train_set)
    base_ratio = 1.0
    cnt_max = 0
    cnt_min = 0
    max_ratio = 1.0
    min_ratio = 1.0
    max_gene = '0'*LenGene
    min_gene = max_gene
    genenames = os.listdir(TrainGenePath)
    for gene in genenames:
        if gene =='cache':
            continue
        new_ratio = get_real_ratio(basetimelist,TrainGenePath,gene,train_set,ratio_map)
        if new_ratio > max_ratio:
            max_ratio = new_ratio
            max_gene = gene
        if new_ratio < min_ratio:
            min_ratio = new_ratio
            min_gene = gene
        if new_ratio >= base_ratio:
            cnt_max = cnt_max + 1
            #print(gene)
        else:
            cnt_min = cnt_min + 1
    return max_ratio,max_gene,cnt_max,min_ratio,min_gene,cnt_min


def create_csv(TrainGenePath,PATH,exepath,train_set,len_each,pop_dict,feature_map,ratio_map,metapath,metaIci,ntIntapp,metaSci,ntStringapp,funcs,metaheader,metatailer):#TrainGenePath = .../TrainGenes
    #global totalt
    GenePath = TrainGenePath
    genesname = os.listdir(GenePath)
    #pop_dict ={}#存下来 估算出的每个基因对每个case的程序数目
    #sample_feature_map = {}
    #feature_map = {}
    #ratio_map = {}
    outdata = []
    #tmpcnt =0
    for sample in genesname:#修改为对于所有基因的所有tasks都求，一次基因求一次
        #outdata.append(sample+'-----------------------------------------')
        if sample == 'cache':#if len(sample)==5
            continue
        print("calculate sample:" + sample)
        createmetafile(sample,metapath,metaIci,ntIntapp,metaSci,ntStringapp,funcs,metaheader,metatailer)
        feature = getfeature(sample,feature_map,pop_dict,PATH,exepath,train_set,len_each)
        #ratio = get_real_ratio([],TrainGenePath,sample,train_set,ratio_map)#TODO:修改为真实时间 done
        timelist = get_real_timelist(TrainGenePath,sample,train_set)
        # print(len(feature))
        # print(len(timelist))
        assert(len(feature) == len(timelist))
        for i in range(len(feature)):
            newdata = []
            #newdata.append(i)
            for f in feature[i]:
                newdata.append(f)
            #newdata.append(feature[i])
            newdata.append(math.log(timelist[i]))
            # if newdata not in outdata:#去重
            #     outdata.append(newdata)
            outdata.append(newdata)

        # for f in feature:
        #     newdata.append(f)
        # newdata.append(ratio)

        
        # tmpcnt =tmpcnt +1
        # if tmpcnt>=4:
        #     quit()

    
    with open(PATH + '/sklearn/data.csv','w',encoding='utf-8') as f:
        csv_writer = csv.writer(f)
        csv_writer.writerows(outdata)
    #to be tested
    #print("k genes timecost of cpp, 4 threads:",totalt)

def append_csv(outdata,PATH):
    with open(PATH + '/sklearn/data.csv','a',encoding='utf-8') as f:
        csv_writer = csv.writer(f)
        csv_writer.writerows(outdata)


#Genetic Algorithms
def init_population(K,LenGene,survived):
    population = survived.copy()
    for i in range(K-len(population)):
        newgene = getonegene(LenGene)
        population.append(newgene)
    return population

import pickle
import numpy as np

def cross(population,LenGene):
    l = len(population)
    idx1 = random.randint(0,l-1)
    idx2 = random.randint(0,l-1)
    s = ''
    for i in range(LenGene):
        if random.random()>0.5:
            s = s + population[idx1][i]
        else:
            s = s + population[idx2][i]
    return s

def change(s):
    s_ = ''
    for i in s:
        if random.random()<0.05:#变异
            if i == '1':
                s_ = s_ + '0'
            else:
                s_ = s_ + '1'
        else:
            s_ = s_ + i
    return s_

def getKrank(points,K):#应当倒序排列#0921如果需要保证有K个的话需要先去重
    pointscopy = points.copy()
    new_points = list(set(pointscopy))
    new_points.sort(reverse = True)
    if len(new_points) <= K:
        return new_points[-1]
    return new_points[K]
    points.sort(reverse = True)
    return points[K]

def genetic(population,PATH,LenGene,feature_map,pop_dict,exepath,train_set,len_each,runs,num_tobetested,geneticpath='',information=[[],[],[],[],[],[],[]]):
    with open(PATH + "/sklearn/xgbreg","rb") as f:
        regr = pickle.load(f)
    
    K = len(population)#种群数量
    reg_point = {}
    # reg_timelist = {}
    createmetafile('0'*LenGene,PATH,information[0],information[1],information[2],information[3],information[4],information[5],information[6])
    #feature = np.array(getfeature('0'*LenGene,feature_map,pop_dict,PATH,exepath,train_set,len_each))
    feature = getfeature('0'*LenGene,feature_map,pop_dict,PATH,exepath,train_set,len_each)
    #feature = [[f] for f in feature]
    feature = np.array(feature)
    # reg_point['0'*LenGene] = regr.predict(feature.reshape(1,-1))[0]
    timelist0 = regr.predict(feature)
    timelist0 = [math.e**(t) for t in timelist0]
    #reg_timelist['0'*LenGene] = timelist
    reg_point['0'*LenGene] = 1.0

    with open(PATH + '/programming.txt','w') as file_object:
        for r in range(runs):
            print("runs:"+str(r)+'-------------------------')
            newpopulation = []
            for i in range(K):
                newg1 = cross(population,LenGene)
                newg2 = change(newg1)
                newpopulation.append(newg2)
            for p in population:
                newpopulation.append(p)
            featurecnt = 0
            for g in newpopulation:
                metapath = PATH
                #path_geneticgene = PATH +  '/TrainGenes/' + geneticpath + g #内部又生成了一次,还编码了TrainGenes这个路径 遗传算法中计算feature依赖于指定路径生成的对应文件
                # if not os.path.isdir(path_geneticgene):
                #     cmdline = 'mkdir ' + path_geneticgene
                #     os.system(cmdline)
                # else:
                #     continue

                
                # for num in train_set:
                #     createfile(g,num,path_geneticgene,information[0],information[1],information[2],information[3],information[4],information[5],information[6])
                print("featurecnt:"+str(featurecnt)+':'+ g)
                createmetafile(g,metapath,information[0],information[1],information[2],information[3],information[4],information[5],information[6])
                feature= getfeature(g,feature_map,pop_dict,PATH,exepath,train_set,len_each,geneticpath)
                #feature = [[f] for f in feature]
                feature = np.array(feature)
                # reg_point['0'*LenGene] = regr.predict(feature.reshape(1,-1))[0]
                timelist1 = regr.predict(feature)
                timelist1 = [math.e**(t) for t in timelist1]
                ratio = get_ratio_from_two_timelist(timelist0,timelist1)
                featurecnt = featurecnt + 1
                reg_point[g] = ratio
                print(ratio)  #nan!!! why 预测的时候可能会得到负数的时间？
            points = []
            for g in newpopulation:
                # 1115不应该有以前生成的了
                # #有时候生成了文件但是没有计算？以前生成的
                # if g not in reg_point:
                #     feature = np.array(getfeature(g,feature_map,pop_dict,PATH,exepath,train_set,len_each,geneticpath))
                #     reg_point[g] = regr.predict(feature.reshape(1,-1))[0]
                # #不太懂先补丁
                points.append(reg_point[g])
            Krank = getKrank(points,K)
            population = []
            for g in newpopulation:
                if reg_point[g] >= Krank:#用新的适应度 加速比
                    population.append(g)

            ##population为空？
            if len(population) == 0:
                file_object.write("Krank:"+str(Krank)+"\n")
                file_object.write("oldpopulations:\n")
                for g in newpopulation:
                    file_object.write(g+":         ") 
                    file_object.write(str(reg_point[g])+"\n")
                file_object.write("points:\n") 
                for p in points:
                    file_object.write(str(p)+"\n")



            for g in population:
                file_object.write(g+":         ") 
                file_object.write(str(reg_point[g])+"\n") 
            file_object.write("-----------------------------------------------------------\n")
            file_object.flush()

    points = []
    for g in population:
        points.append(reg_point[g])
    numrank = getKrank(points,num_tobetested)
    survived_population = []
    correspond_points = []
    for g in population:
        if reg_point[g] >= numrank:
            if g not in survived_population:
                survived_population.append(g)
                correspond_points.append(reg_point[g])      
    return survived_population,correspond_points
    
