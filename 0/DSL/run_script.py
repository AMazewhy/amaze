# import os
# import random
# from script import get_max_min_ratio

# def get_real_timelist(TrainGenePath,gene,train_set,timeout = 300):#获取实际求解时间列表
#     timelist = []
#     samplepath = TrainGenePath + '/' + gene
#     #filesname = os.listdir(samplepath)
#     for file_id in train_set:
#         outfilename = samplepath + '/' + str(file_id) + '_.out'
#         f = open(outfilename)
#         lines = f.readlines()
#         if len(lines) == 0:
#             timelist.append(timeout)
#         elif len(lines) == 4:
#             timelist.append(eval(lines[3]))
#         f.close()
#     return timelist

# def get_cvc5_timelist(TrainGenePath,gene,train_set,timeout = 300000):
#     timelist = []
#     samplepath = TrainGenePath + '/' + gene
#     #filesname = os.listdir(samplepath)
#     for file_id in train_set:
#         outfilename = samplepath + '/' + str(file_id) + '_.out'
#         f = open(outfilename)
#         lines = f.readlines()
#         if len(lines) == 0:
#             timelist.append(timeout)
#         elif 'infeasible' in lines[0]:
#             timelist.append(timeout)
#         elif 'timeout' in lines[0]:
#             timelist.append(timeout)
#         elif 'Parse Error' in lines[0]:
#             print('parse error on file ' + str(file_id))
#         else:
#             flag = False
#             for line in lines:
#                 if  'global::totalTime' in line:
#                     flag = True
#                     idx = line.index('=') + 1
#                     timelist.append(eval(line[idx:-3]))
#                     break
#             if not flag:
#                 print('no time on flie ' + str(file_id))    
#         f.close()
#     return timelist

# PATH="/home/ztye/experiments/obestring/0/DSL"

# #自动化 直接从TrainGenes中拷贝文件过去
# #genelist = ['0000000000000000000000000000000000000','0110001000001110000100110110000000100','0110001000001101000100110110001110101','0110001000001110001100110100000001101','0110001000101010001100110100000011111','0110001000100000101100110100000010101','0110001000001101000100111110000001101','0110001000101000001100110110000011001','0110001000001110001100110100000011101','0110001000001010001100110100000001001','0110001000000000000100110001000001001','0110001000001010001000110110000000100']
# #genelist = ['0000000000000000000000000000000000000','0101101100111010101001101011001011001','0101100000111000100101001011001011100','0101101000111010101001101011001011001','0101101100111001000101101011001011001','0101100101011001001101100011000011100','0101100000111001000101001011001011000','0101101000011010101101001011001011100','0101000001011011101001001101001011000','0101100100111010100001001011001011000','0100100100011010101001001011001011001','0101010100111001100101001111001010100','0101000001011011101001001101001011000']
# #genelist = ['011100110001111101001011000000101','010101011001111101001011000001000']
# genelist = ['011100110001111101001011000000101','011100110001111101001011000010101']

# EusolverPath = PATH + '/EusolverTestGenes'
# MaxflashPath = PATH + '/MaxflashTestGenes'
# CVC5Path = PATH + '/CVC5TestGenes'

# #genelist = ['0000000000000000000000000000000000000']

# #delete after cp
# # for gene in genelist:
# #     epath = EusolverPath + '/'+gene
# #     mpath = MaxflashPath + '/'+gene
# #     filesname = os.listdir(epath)
# #     for fname in filesname:
# #         if '.out' in fname:
# #             os.remove(epath + '/' + fname)
# #     filesname = os.listdir(mpath)
# #     for fname in filesname:
# #         if '.out' in fname:
# #             os.remove(mpath + '/' + fname)

# #运行maxflash和eusolver求解
# # for gene in genelist:
# #     cmdline = 'python3 /home/ztye/experiments/obestring/0/ISTool/ISTool/runner/python/main.py {}'.format(gene)
# #     os.system(cmdline)

# # quit()

# for gene in genelist:
#     #gene = '0000000000000000000000000000000000000'
#     gene0 = '0'*len(gene)
#     LenGene = len(gene)
#     CASES = 209
#     PATH="/home/ztye/experiments/obestring/0/DSL"
#     TrainGenePath = PATH + '/TrainGenes'
#     # EusolverPath = PATH + '/EusolverTestGenes'
#     # MaxflashPath = PATH + '/MaxflashTestGenes'
#     #TrainGenePath = CVC5Path
#     Timeout = 300

#     TRAIN_SET = [i for i in range(CASES)]
#     #NOTTRAIN_SET = [7, 16, 17, 20, 30, 34, 37, 39, 43, 51, 57, 63, 66, 69, 74, 83, 85, 86, 92, 97, 101, 112, 119, 123, 132, 133, 143, 151, 153, 154, 155, 159, 171, 178, 180, 181, 187, 188, 190, 198]
#     #TRAIN_SET = [i for i in range(CASES) if i not in NOTTRAIN_SET]
#     TRAIN_SET = [3, 5, 13, 21, 36, 37, 42, 61, 64, 73, 80, 85, 100, 104, 111, 167, 168, 195, 201, 204, 208]
#     TRAIN_SET = [0, 1, 2, 4, 6, 7, 8, 9, 10, 11, 12, 14, 15, 16, 17, 18, 19, 20, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 38, 39, 40, 41, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 62, 63, 65, 66, 67, 68, 69, 70, 71, 72, 74, 75, 76, 77, 78, 79, 81, 82, 83, 84, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 101, 102, 103, 105, 106, 107, 108, 109, 110, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 196, 197, 198, 199, 200, 202, 203, 205, 206, 207]
#     #TRAIN_SET = [3, 9, 13, 28, 38, 59, 72,73,76,77,87,91,92,96,97,101,102,113,115,118,128,130,135,137,139,140,145,146,149,152,165,167,169,181,184,186,187,192,193,196]#0702

#     # t0 = get_real_timelist(TrainGenePath,gene0,TRAIN_SET)
#     # t1 = get_real_timelist(TrainGenePath,gene,TRAIN_SET)
#     t0 = get_real_timelist(TrainGenePath,gene0,TRAIN_SET)
#     t1 = get_real_timelist(TrainGenePath,gene,TRAIN_SET)
#     success_then_fail = 0
#     fail_then_success = 0
#     fast = 0
#     slow = 0
#     ratio = 1.0
#     for i in range(len(t0)):
#         ratio = ratio * t0[i]/t1[i]
#     ratio = ratio**(1/len(TRAIN_SET))

#     with open("timerecord_tmp",'a') as f:
#         f.write('gene:'+gene + '\n')
#         for i in range(len(t0)):
#             f.write(str(t0[i])+','+str(t1[i]) + '\n')
#             if t0[i] == Timeout and t1[i] < Timeout:
#                 fail_then_success = fail_then_success + 1
#             elif t1[i] == Timeout and t0[i] < Timeout:
#                 success_then_fail = success_then_fail + 1
#             else:
#                 pass
#             if t0[i]>t1[i]:
#                 fast = fast + 1
#             elif t0[i]<t1[i]:
#                 slow = slow + 1
#         f.write(str(ratio)+'\n')
#         f.write("success_then_fail:"+str(success_then_fail)+'\n')
#         f.write("fail_then_success:"+str(fail_then_success)+'\n')
#         f.write('fast:'+str(fast)+'\n')
#         f.write('slow:'+str(slow)+'\n')
#         f.write('----------------------------------------------------------------\n')

# quit()
# ratio_map = {}
# max_ratio,max_gene,cnt_max,min_ratio,min_gene,cnt_min = get_max_min_ratio(TrainGenePath,LenGene,TRAIN_SET,ratio_map)
# print(max_ratio)
# print(max_gene)
# print(min_ratio)
# print(min_gene)
# print(cnt_max)
# print(cnt_min)


# # inputpath = '/home/citceae/DSL/generalization/modify/'
# # outputpath = '/home/citceae/DSL/generalization/modify_out/'
# # filesname = os.listdir(inputpath)

# # cnt = 0
# # for f in filesname:
# #     print("step:"+str(cnt)+"---------------------------------")
# #     cnt = cnt + 1
# #     inputname = inputpath + f
# #     outputname = outputpath + f[:-3] + '.out'
# #     cmdline = '/home/citceae/ISTool0109max/ISTool/build/executor/run_sygus ' + inputname + ' ' + outputname + ' ' + 'obe'
# #     os.system(cmdline)
  

# '''
# for i in range(1,41):
#     cmdline = '/home/citceae/ISTool0109max/ISTool/build/executor/run_sygus /home/citceae/DSL/genesfile/{}_.sl /home/citceae/DSL/genesfile/{}_m.out maxflash'.format(str(i),str(i))
#     os.system(cmdline)
# '''

# '''
# gene = '1111011101100001011100001001110000'
# cmdline = 'mkdir /home/citceae/DSL/candgenes/'+gene
# os.system(cmdline)
# path = '/home/citceae/DSL/candgenes/' + gene + '/'
# for i in range(1,41):
#     print("step:"+str(i)+"---------------------------------")
#     createfile(gene,i,path)
#     cmdline = '/home/citceae/ISTool0109max/ISTool/build/executor/run_sygus /home/citceae/DSL/candgenes/{}/{}_.sl /home/citceae/DSL/candgenes/{}/{}_.out obe'.format(gene,str(i),gene,str(i))
#     os.system(cmdline)



# #0作为填充 timeout = 300
# origintime = [0,0.7515900000,5.6525250000,0.6447880000,5.7919210000,178.1173020000,300,300,6.9934610000,0.2790840000,0.1671380000,221.2818950000,7.5104600000,0.0014780000,0.0358410000,0.5104630000,300,2.0721160000,3.2959690000,300,15.0850400000,0.0713870000,300,300,0.0066230000,0.0810620000,0.1262040000,300,0.0063890000,54.8227170000,8.0320400000,300,0.6648390000,0.0045580000,19.2783880000,0.0205090000,0.0096350000,37.0810610000,0.2290330000,300,0.1385460000]

# #标记所有.sl文件 打开对应的.out 如果有两行则读取第二行转换为float然后求加速比
# samplepath = '/home/citceae/DSL/candgenes/'+gene+'/'
# filesname = os.listdir(samplepath)
# ratio = []
# cnt = 0
# for f in filesname:#12_.sl
#     if f[-4:] == "_.sl":
#         cnt = cnt + 1
#         curnum = (int)(f[:-4])
#         outfilename = f[:-4]+'_.out'
#         if outfilename in filesname:
#             abspath = samplepath+'/'+outfilename
#             f = open(abspath)
#             lines = f.readlines()
#             assert(len(lines) == 2)
#             value1 = eval(lines[1])
#             value2 = origintime[curnum]
#             ratio.append(value2/value1)
#             f.close()
#         else:
#             value1 = 300
#             value2 = origintime[curnum]
#             ratio.append(value2/value1)
#     else:
#         continue
# #print(len(ratio))
# ratio.sort()
# ret = 1.0
# for r in ratio:
#     ret = ret*r
# ret = ret**(1/len(ratio))
# print(ret)
# #ret = 1.0
# #for i in range(8):
# #    ret = ret*ratio[i]
# #ret = ret**(1/8)
# #print(ret)
# #ret = 1.0
# #for i in range(8):
# #    ret = ret*ratio[0-i]
# #ret = ret**(1/8)
# #print(ret)
# '''
# # quit()


# # L = 34
# # def getonegene():#暂时不能处理后三位
# #     s = ''
# #     for i in range(L):
# #         if random.random()>0.5:
# #             s = s + '1'
# #         else:
# #             s = s + '0'
# #     s_ = s[0:L-3] + '000'
# #     return s_

# # #gene = '0110001101101000110000000101110000'

# # #随机生成一些sample而不是取用所有40个测试？
# # for i in range(6):
# #     gene = getonegene()
# #     path = '/home/citceae/DSL/NewNetGene/'+ gene + '/'

# #     if not os.path.isdir(path):
# #         cmdline = 'mkdir /home/citceae/DSL/NewNetGene/'+ gene
# #         os.system(cmdline)
# #     else:
# #         continue

# #     #candset = []
# #     #for i in range(8):
# #     #    newcand = random.randint(1,40)
# #     #    if newcand not in candset:
# #     #        candset.append(newcand)
# #     for i in range(1,41):#1,41
# #     #for i in candset:
# #         print("step:"+str(i)+"---------------------------------")
# #         createfile(gene,i,path)
# #         cmdline = '/home/citceae/ISTool0109max/ISTool/build/executor/run_sygus /home/citceae/DSL/NewNetGene/{}/{}_.sl /home/citceae/DSL/NewNetGene/{}/{}_.out obe'.format(gene,str(i),gene,str(i))
# #         os.system(cmdline)


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




import random


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
    T1 = 0.00
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


def gettopkratiowithgene(TrainGenePath,LenGene,VAL_SET,k=10):
    gene0 = '0'*LenGene
    timelist0 = get_real_timelist(TrainGenePath,gene0,VAL_SET)
    ratiolist = []
    gene_ratio_map = {}
    genesname = os.listdir(TrainGenePath)
    for sample in genesname:
        if sample == 'cache':#if len(sample)==5
            continue
        newtimelist = get_real_timelist(TrainGenePath,sample,VAL_SET)
        ratio = getratiofromtwotimelist(timelist0,newtimelist)
        ratiolist.append(ratio)
        gene_ratio_map[sample] = ratio
    ratiolist.sort(reverse=True)
    bar = ratiolist[k]
    ret = []
    for key in gene_ratio_map:
        if gene_ratio_map[key]>=bar:
            ret.append([key,gene_ratio_map[key]])
    return ret



CASES = 209
OneofTen = 21

random.seed(42)
ALL_SET = [i for i in range(CASES)]
random.shuffle(ALL_SET)
#0
TEST_SET = ALL_SET[:OneofTen]
VAL_SET = ALL_SET[OneofTen:3*OneofTen]
TRAIN_SET = ALL_SET[3*OneofTen:]
TRAIN_SET.sort()
#print(TRAIN_SET)

from script import get_real_timelist

PATH="/home/ztye/experiments/obestring/0/DSL"
TrainGenePath = PATH + '/TrainGenes'
#TrainGenePath = PATH + '/TrainGenesMaxflashString'

genebase = '0000000000000000000000000000000000000000000000000000000000000000'
#genemaxflashstring = '00000000000000000000000000000000000000000000000000000000000000'
LenGene = len(genebase)
gene0 = '0'*LenGene
top10 = gettopkratiowithgene(TrainGenePath,LenGene,VAL_SET,k=10)
for i in top10:
    print(i)

quit()


# genelist =  ['0'*LenGene,'10101001011101110110110111000000101', '10101001011101110110110111000001000','10101001011101111110110111000001100', '10101001011101111110110111000001101', '10101001011101111110110111001001100', '10111001010101110110110101000001100', '10111001010101111110110101000001101', '10111001010101111110110101001001101', '10111001010101111110110111000000100', '10111001010111110110110111001001101', '10111011010101101110111101000001100']
#genelist =  ['0'*LenGene,'00001000000000011100010000000000000000000000110100000000100000','00101000000000001001000000100000000100000000110100000000000010','00001000000000001001011000000000000100000000110100000000000000']
# genelist = ['0'*LenGene,'00001000000000001001010000100000000100000000110110000000000100',
# '00001000000000001100010000000000000000000000110100000000100000',
# '00001000000000010000010000000000000000000000110100000000000000', 
# '00001000000000010000010000000000000100000000110100000000100111', 
# '00001000000000010000110000000000000100000000110100000000100100',
# '00001000000000010100010000000000000000000000110100100000100100', 
# '00001000000000010100110000000000000000000000110100000000000100',
# '00001000000000011100010000000000000000000000110010000000100000', 
# '00001000000000011100010000000000000000000000110100000000100000',
# '00101000000000001000000000100000000100000000110000000000000000', 
# '00101000000000001001000000100000000100000000110100000000000010']

#maxflash string
genelist = ['0'*LenGene,
'00001000000000010000010000000000000000000000110100000000000000', 
'00001000000000010100010000000000000000000000110100100000100100']

#maxflash string server

genelist = ['0'*LenGene,'0100000100000010001110000000001010000010000001110100000']

timeoutvalue = []




ALL_SET = [i for i in range(CASES)]
TEST_SET = [i for i in ALL_SET if i not in TRAIN_SET]
#TRAIN_SET = TEST_SET

timelist0 = get_real_timelist(TrainGenePath,gene0,TRAIN_SET)
testtimelist0 = get_real_timelist(TrainGenePath,gene0,TEST_SET)
                                  
newratios = []
cntlist = []
for gene in genelist:
    aimtimelist = get_real_timelist(TrainGenePath,gene,TRAIN_SET)
    cnt1 = 0
    cnt2 = 0
    with open('rubbish.txt','w') as f:
        for i in range(len(aimtimelist)):
            if timelist0[i]!=300 and aimtimelist[i]!=300:
                if timelist0[i]<aimtimelist[i]:
                    cnt1 = cnt1 + 1
                else:
                    cnt2 = cnt2 + 1
            print(str(timelist0[i]) + ' ' + str(aimtimelist[i]),file = f)
    cntlist.append([cnt1,cnt2])
        # quit()
    testtimelist = get_real_timelist(TrainGenePath,gene,TEST_SET)
    #print(testtimelist)

    ret,ratio = findbesttimeout2(timelist0,aimtimelist)
    print("besttimeout and ratio on trainset:",ret,ratio)  

    newtimelist = getnewtimelist(testtimelist0,testtimelist,ret,300)
    print(newtimelist)
    #quit()


    ratio0 = getratiofromtwotimelist(testtimelist0,testtimelist)
    ratio1 = getratiofromtwotimelist(testtimelist0,newtimelist)
    newratios.append(ratio1)
    print("test ratio without timeout:",ratio0)
    print("test ratio with timeout:",ratio1)
    
# print(newratios)
print(cntlist)


