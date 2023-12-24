import json
import os
import random
import csv
import math
from transfer_bv import transtobase

def runbash(filename, outputname, timeout = 300):
    #TODO:这个带时间的output用于求加速比 分离出其中（前两行）的解用于追加>>写入trainsetForbv中
    #暂时只用来求解完整的解 timeout仍然先使用300
    cmdline = 'timeout {} bash -c "/home/ztye/experiments/obestring/0/DSL/eusolver_bash {} > {}"'.format(timeout,filename,outputname) #前面加上timeout 300可行好像也没问题
    print(cmdline)
    os.system(cmdline)
    # quit()

def traingen(trainset,filepath = "/home/ztye/experiments/obestring/0/DSL/benchmark_bv/",srcpath = "/home/ztye/experiments/obestring/0/DSL/src_bv/"):
    outputpath = srcpath + "fulloutput/"
    trainsetpath = srcpath + "trainset/"
    if os.path.exists(trainsetpath):
        cmdline = 'rm -rf ' + trainsetpath
        os.system(cmdline)
        cmdline = 'mkdir ' + trainsetpath
        os.system(cmdline)
    else:
        cmdline = 'mkdir ' + trainsetpath
        os.system(cmdline)
    
    for i in trainset:
        print("start " + str(i) + ":")
        filename = filepath + str(i) + ".sl"
        outputname = outputpath + str(i) + ".out"
        runbash(filename,outputname)

        #收集到trainset中，此处应为第一次
        trainsetname = trainsetpath + str(i) + ".out"
        s = []
        with open(outputname, 'r') as f:
            for line in f.readlines():
                s.append(line.strip())
        if len(s) == 3:
            #baseanswer = transtobase(s[1],[])
            baseanswer = transtobase(s[1][:-1],[])#BV特供
            #之后需要检验是否相同
            with open(trainsetname,'a') as f:
                print(baseanswer,file=f)
        else:#无解
            with open(trainsetname,'a') as f:
                print('',file=f)

def traingenwithoutrun(trainset,filepath = "/home/ztye/experiments/obestring/0/DSL/benchmark_bv/",srcpath = "/home/ztye/experiments/obestring/0/DSL/src_bv/"):
    outputpath = srcpath + "fulloutput/"
    trainsetpath = srcpath + "trainset/"
    if os.path.exists(trainsetpath):
        cmdline = 'rm -rf ' + trainsetpath
        os.system(cmdline)
        cmdline = 'mkdir ' + trainsetpath
        os.system(cmdline)
    else:
        cmdline = 'mkdir ' + trainsetpath
        os.system(cmdline)
    
    for i in trainset:
        print("start " + str(i) + ":")
        filename = filepath + str(i) + ".sl"
        outputname = outputpath + str(i) + ".out"
        # runbash(filename,outputname)

        #收集到trainset中，此处应为第一次
        trainsetname = trainsetpath + str(i) + ".out"
        s = []
        with open(outputname, 'r') as f:
            for line in f.readlines():
                s.append(line.strip())
        if len(s) == 3:
            #baseanswer = transtobase(s[1],[])
            baseanswer = transtobase(s[1][:-1],[])#BV特供
            #之后需要检验是否相同
            with open(trainsetname,'a') as f:
                print(baseanswer,file=f)
        else:#无解
            with open(trainsetname,'a') as f:
                pass

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

def getbvjson(path = "/home/ztye/experiments/obestring/0/DSL",cnt = 350):#一次性无需修改
    inputpath = path + '/benchmark_bv'
    outputpath = path + '/bv_json'
    pyfile = path + '/python/main.py'
    for i in range(cnt):
        inputfile = inputpath + '/' + str(i) + '.sl'
        outputfile = outputpath + '/' + str(i) + '.json'
        cmdline = 'python3 ' + pyfile + ' ' + inputfile + ' ' + outputfile
        print(cmdline)
        os.system(cmdline)

def create_one_tailer(arr):# arr = tmp[2:]
    ret = []
    ret.append('))')
    standlen = len('0000000000000000')
    for t in arr:
        #print(t)
        if t[0] == 'constraint':
            ct = '(constraint ('
            assert(t[1][0] ==  '=') #限制条件暂时都为=给出的
            ct = ct + '= ('
            ct = ct + t[1][1][0] + ' ' #'f'
            #print(t[1][1][1])
            assert(t[1][1][1][0]==['_', 'BitVec', ['Int', 64]])
            #print(t[1][1][1][1])
            pa = str(hex(t[1][1][1][1]))[2:]
            pa = (standlen-len(pa))*'0' + pa
            ct = ct + '#x' + pa
            #print(ct)
            # for i,pa in enumerate(t[1][1][1:]):
            #     if pa[0] == 'String':
            #         ct = ct + '"' + pa[1] + '"'
            #     elif pa[0] == 'Int':
            #         ct = ct + str(pa[1])
            #     else:
            #         assert(False)
            #     if i!=len(t[1][1][1:]) - 1:#中间参数有可能一样
            #         ct = ct + ' '
            ct = ct + ') '
            assert(t[1][2][0]==['_', 'BitVec', ['Int', 64]])
            pa = str(hex(t[1][2][1]))[2:]
            pa = (standlen-len(pa))*'0' + pa
            ct = ct + '#x' + pa
            # if t[1][2][0] == 'String':
            #     ct = ct + '"' + t[1][2][1] + '"'
            # elif t[1][2][0] == 'Int':
            #     ct = ct + str(t[1][2][1])
            # elif t[1][2][0] == 'Bool':
            #     ct = ct + t[1][2][1]
            #     #assert(False)
            # else:
            #     assert(False)
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


def gettailer(cntlist = [0,5],path = "/home/ztye/experiments/obestring/0/DSL/bv_json"):#cntlist应为全集
    tailerarr = []# allarr = tmp[2:]的组合
    for cnt in cntlist:
        filepath = path + '/' + str(cnt) + '.json'
        with open(filepath, 'r') as f:
            tmp = json.load(f)
        tailerarr.append(tmp[7:])#有5个函数
    tailer = create_tailer(tailerarr)
    return tailer#header全部相同 tailer不一样 BVconst全部相同 只需要tailer

# tailer = gettailer()
# for t in tailer[0]:
#     print(t)

def createfile(genes,num,path,BVapp,funcs,tailer):#if0是否必须保留，不必须 BV所有header都相同放进了funcs里
    t = '   '
    BVconst = ['#x0000000000000000', '#x0000000000000001', 'x']
    BVbase = [
        '(bvnot Start)',
        '(shl1 Start)',
        '(shr1 Start)',
        '(shr4 Start)',
        '(shr16 Start)',
        '(bvand Start Start)',
        '(bvor Start Start)',
        '(bvxor Start Start)',
        '(bvadd Start Start)',
        '(if0 Start Start Start)'
    ]

    BVfinal = BVconst.copy()

    len1 = len(BVapp)
    for i in range(0,len1):
        if genes[i] == '1':
            BVfinal.append(BVapp[i])

    BVbasecp = BVbase.copy()
    len2 = len1 + len(BVbasecp)
    for i in range(len1,len2):
        if genes[i] == '1':
            if 'if0' in BVbase[i-len1]:#0908改动 保留if0
                continue
            BVbasecp.remove(BVbase[i-len1])
    for nt in BVbasecp:
        BVfinal.append(nt)
    
    filename = path + '/' + str(num) + '_.sl'
    with open(filename, 'w') as f:
        for p in funcs:
            print(p,file=f)
        p = '(Start (BitVec 64) ('
        print(p,file=f)
        for p in BVfinal:
            p_ = t + p
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

def getvalue(gene,popdict,PATH, exepath,train_set,geneticpath=''):#path1 = PATH,path2 = run_sygus #遗传算法时调用geneticpath 训练时应为''，遗传算法时应为cache/
    if gene in popdict:
        return popdict[gene]
    
    resultpath = PATH + "/result.txt"
    cmdline = 'rm ' + resultpath
    os.system(cmdline)
    cmdline = 'touch ' + resultpath
    os.system(cmdline)

    for file_id in train_set:
        cmdline = exepath + ' ' + geneticpath + gene + ' ' + str(file_id)
        os.system(cmdline)
    f = open(resultpath)
    value = []
    while True:
        lines = f.readlines(10000)
        if not lines:
            break
        for line in lines:
            value.append(eval(line))
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
            if math.isnan(res):
                res = 1.0
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
    feature = []
    ratio = listratio(sample,popdict,PATH,exepath,train_set,geneticpath) 
    for f in ratio:
        feature.append(f)
    cntdelete = countdelete(sample,len_each)
    feature.append(cntdelete)
    cntappend = countappend(sample,len_each)
    feature.append(cntappend)
    cntfail = countfails(sample,popdict,PATH,exepath,train_set,geneticpath)
    feature.append(cntfail)
    for i in sample:#最后每一位，有这个就不应该归一化
        feature.append(int(i))
    feature_map[sample] = feature
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
        elif len(lines) == 3:#eusolver是三行
            timelist.append(eval(lines[2]))
        f.close()
    return timelist

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
    ratios = []
    genenames = os.listdir(TrainGenePath)
    for gene in genenames:
        if gene =='cache':
            continue
        new_ratio = get_real_ratio(basetimelist,TrainGenePath,gene,train_set,ratio_map)
        ratios.append(new_ratio)
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
    ratios.sort()
    return max_ratio,max_gene,cnt_max,min_ratio,min_gene,cnt_min,ratios


def create_csv(TrainGenePath,PATH,exepath,train_set,len_each,pop_dict,feature_map,ratio_map):#TrainGenePath = .../TrainGenes
    GenePath = TrainGenePath
    genesname = os.listdir(GenePath)
    #pop_dict ={}#存下来 估算出的每个基因对每个case的程序数目
    #sample_feature_map = {}
    #feature_map = {}
    #ratio_map = {}
    outdata = []
    for sample in genesname:
        if sample == 'cache':#if len(sample)==5
            continue
        print("calculate sample:",sample)
        feature = getfeature(sample,feature_map,pop_dict,PATH,exepath,train_set,len_each)
        ratio = get_real_ratio([],TrainGenePath,sample,train_set,ratio_map)
        newdata = []
        for f in feature:
            newdata.append(f)
        newdata.append(ratio)
        outdata.append(newdata)

    
    with open(PATH + '/sklearn/data.csv','w',encoding='utf-8') as f:
        csv_writer = csv.writer(f)
        csv_writer.writerows(outdata)
    #to be tested

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

def getKrank(points,K):#应当倒序排列
    points.sort(reverse = True)
    return points[K]

def genetic(population,PATH,LenGene,feature_map,pop_dict,exepath,train_set,len_each,runs,num_tobetested,geneticpath='',information=[[],[],[]]):
    with open(PATH + "/sklearn/xgbreg","rb") as f:
        regr = pickle.load(f)
    
    K = len(population)#种群数量
    reg_point = {}
    feature = np.array(getfeature('0'*LenGene,feature_map,pop_dict,PATH,exepath,train_set,len_each))
    # print(feature)
    # print(len(feature))
    # quit()
    reg_point['0'*LenGene] = regr.predict(feature.reshape(1,-1))[0]

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
                path_geneticgene = PATH +  '/TrainGenes/' + geneticpath + g #内部又生成了一次,还编码了TrainGenes这个路径 遗传算法中计算feature依赖于指定路径生成的对应文件
                if not os.path.isdir(path_geneticgene):
                    cmdline = 'mkdir ' + path_geneticgene
                    os.system(cmdline)
                else:
                    continue

                for num in train_set:
                    createfile(g,num,path_geneticgene,information[0],information[1],information[2])
                print("featurecnt:"+str(featurecnt)+'------------------------')
                feature_gene = np.array(getfeature(g,feature_map,pop_dict,PATH,exepath,train_set,len_each,geneticpath))
                featurecnt = featurecnt + 1
                feature = feature_gene
                reg_point[g] = regr.predict(feature.reshape(1,-1))[0]
            points = []
            for g in newpopulation:
                #有时候生成了文件但是没有计算？以前生成的
                if g not in reg_point:
                    feature = np.array(getfeature(g,feature_map,pop_dict,PATH,exepath,train_set,len_each,geneticpath))
                    reg_point[g] = regr.predict(feature.reshape(1,-1))[0]
                #不太懂先补丁
                points.append(reg_point[g])
            Krank = getKrank(points,K)
            population = []
            for g in newpopulation:
                if reg_point[g] >= Krank:#用新的适应度 加速比
                    population.append(g)

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
    
