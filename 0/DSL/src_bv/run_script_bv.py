import os

def FromEuretGetProg(filepath):
    s = []
    with open(filepath, 'r') as f:
        for line in f.readlines():
            s.append(line.strip())
    return s[1][:-1] #左括号开头 右括号结尾 包起来的以空格分隔的程序集
    #以后单个程序可以先加入到对应的解集集合里

# path = "/home/ztye/experiments/obestring/0/DSL/src_bv/trainsetForbv/"
# filesname = os.listdir(path)
# s = []
# for filename in filesname:
#     filepath = path + filename
#     s.append(FromEuretGetProg(filepath))

# with open("allprog.txt", "w") as f:#allporg不带有多余括号
#     for si in s:
#         print(si,file=f)

# PATH="/home/ztye/experiments/obestring/0/DSL"
# cmdline = PATH + '/SLEUTH-master/sleuth -i allarr.txt -s 0.4 -I -O -o > tmp' #一次性行为 支持度需要修改（相对支持度？）
# print(cmdline)
# os.system(cmdline)
#1.14开始跑

def _get_output_file(benchmark_name:str):
    output_file = benchmark_name[:-3] + ".out"
    if not os.path.exists(output_file):
        os.system("touch %s" % output_file)
        return output_file
    return output_file

def get_all_benchmark(path: str, valid = lambda f: ".sl" in f):
    path_list = os.listdir(path)
    benchmark_list = []
    for file in path_list:
        if valid(file):
            benchmark_list.append(os.path.join(path, file))
    return benchmark_list

def createout():
    src_path = "/home/ztye/experiments/obestring/0/DSL/TrainGenes"
    gene = '0010100111111110'
    benchmark_list = get_all_benchmark(src_path + "/" + gene)
    for benchmark_file in benchmark_list:
        benchmark_name = benchmark_file
        output_file = _get_output_file(benchmark_name)


# import csv
# import numpy as np

# PATHsk="/home/ztye/experiments/obestring/0/DSL/sklearn/"

# data = []
# with open(PATHsk + 'data.csv',encoding='utf-8') as f:
#     for row in csv.reader(f,skipinitialspace=True):
#         data.append(row)

# for i in range(len(data)):
#     data[i].insert(280,0)


# with open(PATHsk + 'data.csv','w',encoding='utf-8') as f:
#         csv_writer = csv.writer(f)
#         csv_writer.writerows(data)

import random


# timelist0 = get_real_timelist(TrainGenePath,gene0,TRAIN_SET)
# with open("rubbish.txt",'w') as f:
#     for gene in genelist:
#         newtimelist = get_real_timelist(TrainGenePath,gene,TRAIN_SET)
#         f.write("------------------------------\n")
#         for i in range(len(timelist0)):
#             f.write(str(timelist0[i])+','+str(newtimelist[i])+'\n')


def getratiofromtwotimelist(timelist1,timelist2):
    ratio = 1.0
    for i in range(len(timelist1)):
        t1 = timelist1[i]
        t2 = timelist2[i]
        ratio = ratio *(t1/t2)
    ratio = ratio**(1/len(timelist1))
    return ratio

def getanswer(t1,t2,T1,T2):
    if t2<=T1:
        return t2
    elif t1<T2:
        return T1+t1
    else:
        return T1+T2

def getnewtimelist(timelist1,timelist2,T1,timeout=300):
    newlist = []
    T2 = timeout - T1
    for i in range(len(timelist1)):
        ans = getanswer(timelist1[i],timelist2[i],T1,T2)
        newlist.append(ans)
    return newlist

def findbesttimeout1(timelist1,timelist2,step = 0.1,totaltimeout=300):
    T1 = 0
    T2 = totaltimeout-T1
    minsum = 1e9
    ret = 301
    while T1<=totaltimeout:
        newsum = 0
        for i in range(len(timelist1)):
            newsum = newsum + getanswer(timelist1[i],timelist2[i],T1,T2)
        if newsum < minsum:
            minsum = newsum 
            ret = T1

        T1 = T1+step
    return ret

def findbesttimeout2(timelist1,timelist2,step = 0.01,totaltimeout=300):
    T1 = 0.0
    T2 = totaltimeout-T1
    maxratio = 0
    ret =301
    while T1<=totaltimeout:
        newratio = 1.0
        newtimelist2 = getnewtimelist(timelist1,timelist2,T1)
        newratio = getratiofromtwotimelist(timelist1,newtimelist2)
        if newratio>maxratio:
            maxratio = newratio
            ret = T1
        # if abs(T1 - 300)<1e-3:
        #     print(T1)
        #     print("--------------:",newratio)
        # if abs(T1-63.5)<1e-3:
        #     print("??????????????????:",newratio)
        T1 = T1 + step
    return ret,maxratio

# def baseratio(timelist1,timelist2):
#     ratio = 1
#     for i in range(len(timelist1)):
#         ratio = ratio * (timelist1[i]/timelist2[i])

#     ratio = ratio**(1/len(timelist1))
#     return ratio


CASES = 350
TRAIN_CASES = int(CASES*0.9)

random.seed(42)
TRAIN_SET = random.sample([i for i in range(CASES)],TRAIN_CASES)
TRAIN_SET.sort()
#print(TRAIN_SET)

from script_bv import get_real_timelist

PATH="/home/ztye/experiments/obestring/0/DSL"
TrainGenePath = PATH + '/TrainGenes'

gene0 = '0000000000000000'
genelist = ['0100000000000000','0010000000010001','0110000000010001']

ALL_SET = [i for i in range(CASES)]
TEST_SET = [i for i in ALL_SET if i not in TRAIN_SET]
TRAIN_SET = TEST_SET

timelist0 = get_real_timelist(TrainGenePath,gene0,TRAIN_SET)

aimtimelist = get_real_timelist(TrainGenePath,genelist[2],TRAIN_SET)


# ret,ratio = findbesttimeout2(timelist0,aimtimelist)
# print(ret,ratio)  
# base = getratiofromtwotimelist(timelist0,aimtimelist)
# print(base)

newtimelist = getnewtimelist(timelist0,aimtimelist,4.689999999999944,300)
# gap = [aimtimelist[i] - newtimelist[i] for i in range(len(timelist0))]
# print(gap)

ratio0 = getratiofromtwotimelist(timelist0,aimtimelist)
ratio1 = getratiofromtwotimelist(timelist0,newtimelist)

print(ratio0)
print(ratio1)
    



