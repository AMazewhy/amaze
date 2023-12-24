import random
import os

from script_bv import rename,getbvjson,traingen,tmpcopy,gettailer,getonegene,createfile,runbash,create_csv,get_max_min_ratio,get_real_timelist,init_population,get_real_ratio,append_csv,genetic,traingenwithoutrun
from transfer_bv import getprogdict,appendtrainset
from refine_freq_bv import getfnins_withidx



CASES = 350
TRAIN_CASES = int(CASES*0.9)



New_GEN_DATA = 0
BENCHMARK_RENAME = False
CREATE_JSON = False
BENCHMARK_NAME = 'benchmark_bv'

CREATE_SOURCE = False # create source get one answer for each benchmark

SEARCH_SOURCE = False

CREATE_DATA = False

TEST_RESULT = True

PATH="/home/ztye/experiments/obestring/0/DSL"

if BENCHMARK_RENAME:
    benmarkpath = PATH + '/' + BENCHMARK_NAME
    rename(benmarkpath)

if CREATE_JSON:
    getbvjson()

random.seed(42)
TRAIN_SET = random.sample([i for i in range(CASES)],TRAIN_CASES)
TRAIN_SET.sort()
print(TRAIN_SET)
# print(len(TRAIN_SET))

ALL_SET = [i for i in range(CASES)]
TEST_SET = [i for i in ALL_SET if i not in TRAIN_SET]

if CREATE_SOURCE:
    traingen(TRAIN_SET)

    getprogdict(TRAIN_SET)

if SEARCH_SOURCE:
    cmdline = PATH + '/SLEUTH-master/sleuth -i allarr.txt -s 0.4 -I -O -o > tmp' 
    os.system(cmdline)

    #copy from tmp to freq_sleuth.txt
    tmpcopy("tmp","freq_sleuth.txt")

funcs,BVapp,funcbodys = getfnins_withidx()#funcbody传入appendtrainset
# for func in funcs:
#     print(func)
# for b in BVapp:
#     print(b)
# print(funcbodys)
# quit()


LenBase = 10
LenGene = len(BVapp) + LenBase
len_each = [len(BVapp),LenBase] #按照上述顺序的分别的长度

tailer = gettailer(cntlist = [i for i in range(CASES)])

num = 0
while num < New_GEN_DATA:
    print("Generating genes: " + str(num) + "------------------------")#设置了seed后这里的序列也是给定的
    gene = getonegene(LenGene=LenGene)
    print(gene)

    # path_traingene0 = PATH + '/TrainGenes/' + '0'*LenGene
    # if not os.path.isdir(path_traingene0):
    #     gene = '0'*LenGene
    
    # path_traingene0 = PATH + '/TrainGenes/' + '1'*LenGene
    # if not os.path.isdir(path_traingene0):
    #     gene = '1'*LenGene

    path_traingene = PATH + '/TrainGenes/' + gene #编码的命名 #TODO:改一次基因组成需要清空 不要动态的改变挖掘的pattern比较好 不然基因都浪费了？
    if not os.path.isdir(path_traingene):
        cmdline = 'mkdir ' + path_traingene
        os.system(cmdline)
        num = num + 1
        for i in TRAIN_SET:
            createfile(gene,i,path_traingene,BVapp,funcs,tailer)
            # filename = path_traingene + '/' + str(i) + '_.sl'
            # outputname = filename[:-3] + '.out'
            # runbash(filename,outputname)
        cmdline = 'python3 /home/ztye/experiments/obestring/0/ISTool/ISTool/runner/python/main.py {}'.format(gene)  #已经改为先验证8个 有一个bvnot 判定为2/8有解
        os.system(cmdline)
    else:
        continue

CREATE_ZERO = False #生成全0基因检验
if CREATE_ZERO:
    gene = '0'*LenGene

    path_traingene = PATH + '/TrainGenes/' + gene
    if not os.path.isdir(path_traingene):
        cmdline = 'mkdir ' + path_traingene
        os.system(cmdline)
        num = num + 1
        for i in TRAIN_SET:
            createfile(gene,i,path_traingene,BVapp,funcs,tailer)
            # filename = path_traingene + '/' + str(i) + '_.sl'
            # outputname = filename[:-3] + '.out'
            # runbash(filename,outputname)
        cmdline = 'python3 /home/ztye/experiments/obestring/0/ISTool/ISTool/runner/python/main.py {}'.format(gene)  #已经改为先验证8个 有一个bvnot 判定为2/8有解
        os.system(cmdline)
    else:
        pass

    

#TODO：create_csv 遗传算法（应该全部可以沿用） + 每次迭代增加可选的程序（利用fulloutput的输出加入到trainset中 transfer_bv中有appendtrainset #DONE

#对于生成的所有训练数据，生成对应的feature-ratio .csv文件
TrainGenePath = PATH + '/TrainGenes'
exepath = '/home/ztye/experiments/obestring/0/ISTool1024/ISTool/build/executor/run_sygus'
pop_dict = {}
feature_map = {}
ratio_map = {}

if CREATE_DATA: #改为每轮迭代后都跑一次
    create_csv(TrainGenePath,PATH,exepath,TRAIN_SET,len_each,pop_dict,feature_map,ratio_map)#计算一下代价


# max_ratio,max_gene,cnt_max,min_ratio,min_gene,cnt_min,ratios = get_max_min_ratio(TrainGenePath,LenGene,TRAIN_SET,ratio_map)
# print(max_ratio)
# print(max_gene)
# print(min_ratio)
# print(min_gene)
# print(cnt_max)
# print(cnt_min)
# for r in ratios:
#     print(r)

# noanswercount = []
# genenames = os.listdir(TrainGenePath)
# for gene in genenames:
#     if gene =='cache':
#         continue
#     timelist = get_real_timelist(TrainGenePath,gene,TRAIN_SET)
#     noanswercount.append(timelist.count(300))

# noanswercount.sort()
# print(noanswercount)

# quit()

if TEST_RESULT:

    genelist = ['0'*LenGene,'0100000000000000','0010000000010001','0110000000010001']
    ratiolist = []

    for gene in genelist:
        path_traingene = TrainGenePath + '/' + gene
        for i in TEST_SET:
            createfile(gene,i,path_traingene,BVapp,funcs,tailer)
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


random.seed()
iteration = 5
K = 50#种群数量
runs = 30
num_tobetested = 5
geneticpath = 'cache/'

survived_population = ['0100110000001001','0100110000001000','0101100000001001']
survivied_all_collections = survived_population.copy()

#tmp
# traingenwithoutrun(TRAIN_SET)
# for gene in survived_population:
#     appendtrainset(TRAIN_SET,gene,funcbodys,PATH)

# quit()
#tmp

for iter in range(iteration):
    print("iters:"+str(iter)+'-------------------------')
    #训练xgboost模型#TODO 需要测试收敛性 看起来还可以
    cmdline = 'python3 ' + PATH + '/sklearn/xgboost_test.py'
    os.system(cmdline)

    #遗传算法
    population = init_population(K,LenGene,survived_population)#TODO：不要每次都重新random 这样30个runs可能跑不出最好的效果 要么复用得到的一些基因 要么增大runs的数量达到更好的效果
    survived_population,correspond_points  = genetic(population,PATH,LenGene,feature_map,pop_dict,exepath,TRAIN_SET,len_each,runs,num_tobetested,geneticpath = geneticpath,information=[BVapp,funcs,tailer])

    #对survived的基因进行细粒度真实检验,并写入csv
    outdata = []
    for gene in survived_population:
        path_traingene = PATH + '/TrainGenes/' + gene
        if not os.path.isdir(path_traingene):
            cmdline = 'mkdir ' + path_traingene
            os.system(cmdline)

            for i in TRAIN_SET:
                createfile(gene,i,path_traingene,BVapp,funcs,tailer)
            cmdline = 'python3 /home/ztye/experiments/obestring/0/ISTool/ISTool/runner/python/main.py {}'.format(gene)
            os.system(cmdline)
        else:
            pass #continue会导致部分ratio没有进入ratio_map
            
        
    #     assert(gene in feature_map)
    #     feature = feature_map[gene]
    #     ratio = get_real_ratio([],TrainGenePath,gene,TRAIN_SET,ratio_map)
    #     newdata = []
    #     for f in feature:
    #         newdata.append(f)
    #     newdata.append(ratio)
    #     outdata.append(newdata)

    # append_csv(outdata,PATH)#是不是需要去重避免加入重复的条目 看起来已经去重了 #0917改为重新跑一编feature因为参考集合有变动
    for gene in survived_population:
        appendtrainset(TRAIN_SET,gene,funcbodys,PATH)#【可以直接加全部基因里的解】

    pop_dict.clear()
    feature_map.clear()
    create_csv(TrainGenePath,PATH,exepath,TRAIN_SET,len_each,pop_dict,feature_map,ratio_map)


    print('iterations {}:'.format(iter))
    for g in survived_population:
        if g not in survivied_all_collections:
            survivied_all_collections.append(g)
        print(g)
        print(ratio_map[g])


# with open('survived.txt', 'w') as f:
#     for g in survivied_all_collections:#所有细粒度检验的结果
#         print(g+':',file=f)
#         print(ratio_map[g],file=f)
#         print('\n',file=f)