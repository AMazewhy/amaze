import random 
import os
from refine_freq import getfnins,getfnins_withidx
from script import rename,gethtsi,metagethtsi,createfile,getonegene,get_max_min_ratio,create_csv,genetic,init_population,get_real_ratio,append_csv,tmpcopy,traingenwithoutrun
from transfer import getprogdict,appendtrainset
import time

PATH="/home/ztye/experiments/obestring/0/DSL"
# New_GEN_DATA = 0
CREATE_DATA = True
TEST_ALL = False
CREATE_SOURCE = True #是否生成初始100个解 #只生成一个
SEARCH_SOURCE = True #获取原始的频繁模式
BENCHMARK_RENAME = False
# BENCHMARK_NAME = 'benchmark_string'
# if 'bv' in BENCHMARK_NAME:
#     CASES = 350
#     TRAIN_CASES = int(CASES*0.9)
# elif 'string' in BENCHMARK_NAME:
#     CASES = 209
#     TRAIN_CASES = int(CASES*0.9)

# if BENCHMARK_RENAME:
#     benmarkpath = PATH + '/' + BENCHMARK_NAME
#     rename(benmarkpath)
CASES = 209
OneofTen = 21

random.seed(42)
ALL_SET = [i for i in range(CASES)]
random.shuffle(ALL_SET)
#0
TEST_SET = ALL_SET[:OneofTen]
VAL_SET = ALL_SET[OneofTen:3*OneofTen]
TRAIN_SET = ALL_SET[3*OneofTen:]

#TRAIN_SET = [i for i in ALL_SET if i not in TEST_VAL_SET]

TRAIN_SET.sort()
print(TRAIN_SET)
print(len(TRAIN_SET))
# p.sort()
# print(p)
# quit()


#TEST_SET = [i for i in ALL_SET if i not in TRAIN_SET]



#TRAIN_SET = [7, 16, 17, 20, 30, 34, 37, 39, 43, 51, 57, 63, 66, 69, 74, 83, 85, 86, 92, 97, 101, 112, 119, 123, 132, 133, 143, 151, 153, 154, 155, 159, 171, 178, 180, 181, 187, 188, 190, 198]
if TEST_ALL:
    TRAIN_SET = [i for i in range(CASES)]
    TRAIN_SET = TEST_SET


#对每个任务获取100个解
if CREATE_SOURCE:#一次之后可以为False
    from script import newtraingen
    #对每个组合方案只跑一次
    #newtraingen(TRAIN_SET) #一次性行为 #0919修改为使用另一个方法 即利用指定求解器生成

    #TODO:由于肯定会跑一次生成全零基因，上述的newtraingen可以更改为后续的生成方法并加appendtrainset

    traingenwithoutrun(TRAIN_SET)
    getprogdict(TRAIN_SET) #一次性行为 生成allarr.txt


if SEARCH_SOURCE:
    # cmdline = PATH + '/SLEUTH-master/sleuth -i allarr.txt -s 0.15 -I -O -o > tmp' #一次性行为 支持度需要修改（相对支持度？）
    cmdline = PATH + '/SLEUTH-master/sleuth -i allarr.txt -S 6 -I -O -o > tmp' #一次性行为 支持度需要修改（相对支持度？）
    os.system(cmdline)

    #copy from tmp to freq_sleuth.txt
    tmpcopy("tmp","freq_sleuth.txt")



funcs,ntIntapp,ntStringapp,funcbodys = getfnins_withidx()#使用了定制位置的频繁模式版本




LenBase = 16
LenGene = len(ntIntapp) + len(ntStringapp) + LenBase #84+16 = 100 stringapp + intapp + straingremove + intremove + boolremove #20 + 16 = 36 #TODO:len(Intapp+Stringapp)?
len_each = [len(ntIntapp) + len(ntStringapp),LenBase] #按照上述顺序的分别的长度

header,tailer,ntSci,ntIci = gethtsi(cntlist= [i for i in range(CASES)])


metaheader,metatailer,metaSci,metaIci = metagethtsi()



CREATE_ZERO = True #生成全0基因检验
if CREATE_ZERO:
    gene = '0'*LenGene

    path_traingene = PATH + '/TrainGenes/' + gene
    if not os.path.isdir(path_traingene):
        cmdline = 'mkdir ' + path_traingene
        os.system(cmdline)
        for i in TRAIN_SET:
            createfile(gene,i,path_traingene,ntIci=ntIci,ntIntapp=ntIntapp,ntSci=ntSci,ntStringapp=ntStringapp,funcs=funcs,header=header,tailer=tailer)
        for i in VAL_SET:
            createfile(gene,i,path_traingene,ntIci=ntIci,ntIntapp=ntIntapp,ntSci=ntSci,ntStringapp=ntStringapp,funcs=funcs,header=header,tailer=tailer)
        cmdline = 'python3 /home/ztye/experiments/obestring/0/ISTool/ISTool/runner/python/main.py {}'.format(gene) 
        os.system(cmdline)
        appendtrainset(TRAIN_SET,gene,funcbodys)
    else:
        pass

appendtrainset(TRAIN_SET,'0'*LenGene,funcbodys)    


#对于生成的所有训练数据，生成对应的feature-ratio .csv文件
TrainGenePath = PATH + '/TrainGenes'
exepath = '/home/ztye/experiments/obestring/0/ISTool1024/ISTool/build/executor/run_sygus'
pop_dict = {}
feature_map = {}
ratio_map = {}
ratio_map['0'*LenGene] = 1.0



TEST_RESULT = True
if TEST_RESULT:

    genelist = ['0'*LenGene,'1100101011111111111011010100111111110111100111110011110000100100']
    #genesname = os.listdir(TrainGenePath)
    
    ratiolist = []

    for gene in genelist:
        path_traingene = TrainGenePath + '/' + gene
        for i in TEST_SET:
            createfile(gene,i,path_traingene,ntIci=ntIci,ntIntapp=ntIntapp,ntSci=ntSci,ntStringapp=ntStringapp,funcs=funcs,header=header,tailer=tailer)
        cmdline = 'python3 /home/ztye/experiments/obestring/0/ISTool/ISTool/runner/python/main.py {}'.format(gene)
        os.system(cmdline)

        ratio = get_real_ratio([],TrainGenePath,gene,TEST_SET,ratio_map)
        ratiolist.append(ratio)

    print("test:")
    for r in ratiolist:
        print(r)

    ratio_map.clear()
    trainratio = []
    for gene in genelist:
        ratio = get_real_ratio([],TrainGenePath,gene,TRAIN_SET,ratio_map)
        trainratio.append(ratio)
    print("train:")
    for r in trainratio:
        print(r)

    ratio_map.clear()
    allratio = []
    for gene in genelist:
        ratio = get_real_ratio([],TrainGenePath,gene,ALL_SET,ratio_map)
        allratio.append(ratio)
    print("all:")
    for r in allratio:
        print(r)

    

    quit()



metapath = PATH

# t1 = time.perf_counter()
if CREATE_DATA:
    create_csv(TrainGenePath,PATH,exepath,TRAIN_SET,len_each,pop_dict,feature_map,ratio_map,metapath,metaIci,ntIntapp,metaSci,ntStringapp,funcs,metaheader,metatailer)
# t2 = time.perf_counter()
# print(t2-t1)
#quit()

random.seed()
iteration = 10#10
K = 50#种群数量50
runs = 40#增大一下？好像并不一定收敛了40
num_tobetested = 10#10
geneticpath = 'cache/'

survived_population = ['0'*LenGene]


for iter in range(iteration):
    print("iters:"+str(iter)+'-------------------------')
    #训练xgboost模型#TODO 需要测试收敛性 看起来还可以
    cmdline = 'python3 ' + PATH + '/sklearn/xgboost_test.py'
    os.system(cmdline)

    #遗传算法
    population = init_population(K,LenGene,survived_population)#TODO：不要每次都重新random 这样30个runs可能跑不出最好的效果 要么复用得到的一些基因 要么增大runs的数量达到更好的效果
    survived_population,correspond_points  = genetic(population,PATH,LenGene,feature_map,pop_dict,exepath,TRAIN_SET,len_each,runs,num_tobetested,geneticpath = geneticpath,information=[metaIci,ntIntapp,metaSci,ntStringapp,funcs,metaheader,metatailer])
    

    #对survived的基因进行细粒度真实检验,并写入csv
    outdata = []
    for gene in survived_population:
        path_traingene = PATH + '/TrainGenes/' + gene
        if not os.path.isdir(path_traingene):
            cmdline = 'mkdir ' + path_traingene
            os.system(cmdline)

            for i in TRAIN_SET:
                createfile(gene,i,path_traingene,ntIci=ntIci,ntIntapp=ntIntapp,ntSci=ntSci,ntStringapp=ntStringapp,funcs=funcs,header=header,tailer=tailer)
            for i in VAL_SET:
                createfile(gene,i,path_traingene,ntIci=ntIci,ntIntapp=ntIntapp,ntSci=ntSci,ntStringapp=ntStringapp,funcs=funcs,header=header,tailer=tailer)
            cmdline = 'python3 /home/ztye/experiments/obestring/0/ISTool/ISTool/runner/python/main.py {}'.format(gene)
            os.system(cmdline)
            ratio = get_real_ratio([],TrainGenePath,gene,TRAIN_SET,ratio_map)
            appendtrainset(TRAIN_SET,gene,funcbodys)
        else:
            pass #continue会导致部分ratio没有进入ratio_map
            
    
    pop_dict.clear()
    feature_map.clear()
    #create_csv(TrainGenePath,PATH,exepath,TRAIN_SET,len_each,pop_dict,feature_map,ratio_map)
    create_csv(TrainGenePath,PATH,exepath,TRAIN_SET,len_each,pop_dict,feature_map,ratio_map,metapath,metaIci,ntIntapp,metaSci,ntStringapp,funcs,metaheader,metatailer)

    print('iterations {}:'.format(iter))
    for g in survived_population:
        print(g)
        print(ratio_map[g])
    
    survived_population = random.choices(survived_population,k=3)
    







