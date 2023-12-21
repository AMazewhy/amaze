# result of Table1 and Table3

import random
import os

def get_real_timelist(TrainGenePath,gene,id_set,timeout = 300):
    targetline = 4
    if 'bv' in TrainGenePath:
        targetline = 3
    timelist = []
    samplepath = TrainGenePath + '/' + gene
    for file_id in id_set:
        outfilename = samplepath + '/' + str(file_id) + '_.out'
        f = open(outfilename)
        lines = f.readlines()
        if len(lines) == 0:
            timelist.append(timeout)
        elif len(lines) == targetline:
            timelist.append(eval(lines[targetline-1]))
        f.close()
    return timelist

def get_ratio_from_two_timelist(timelist1,timelist2):
    ratio = 1.0
    for i in range(len(timelist1)):
        t1 = timelist1[i]
        t2 = timelist2[i]
        ratio = ratio *(t1/t2)
    ratio = ratio**(1/len(timelist1))
    return ratio

def get_topk_ratio_with_gene(TrainGenePath,LenGene,VAL_SET,k=0):
    gene0 = '0'*LenGene
    timelist0 = get_real_timelist(TrainGenePath,gene0,VAL_SET)
    ratiolist = []
    gene_ratio_map = {}
    genesname = os.listdir(TrainGenePath)
    for sample in genesname:
        if sample == 'cache':#if len(sample)==5
            continue
        newtimelist = get_real_timelist(TrainGenePath,sample,VAL_SET)
        ratio = get_ratio_from_two_timelist(timelist0,newtimelist)
        ratiolist.append(ratio)
        gene_ratio_map[sample] = ratio
    ratiolist.sort(reverse=True)
    bar = ratiolist[k]
    ret = []
    for key in gene_ratio_map:
        if gene_ratio_map[key]>=bar:
            ret.append([key,gene_ratio_map[key]])
    return ret

def get_answer(t1,t2,T1,T2):
    if t2<=T1:
        return t2
    elif t1<T2:
        return T1+t1
    else:
        return T1+T2

def get_new_timelist(timelist1,timelist2,T1,timeout=300):
    newlist = []
    T2 = timeout - T1
    for i in range(len(timelist1)):
        ans = get_answer(timelist1[i],timelist2[i],T1,T2)
        newlist.append(ans)
    return newlist

def find_best_timeout2(timelist1,timelist2,step = 0.01,totaltimeout=300):
    T1 = 0.00
    T2 = totaltimeout-T1
    maxratio = 0
    ret =301
    while T1<=totaltimeout:
        newratio = 1.0
        newtimelist2 = get_new_timelist(timelist1,timelist2,T1)
        newratio = get_ratio_from_two_timelist(timelist1,newtimelist2)
        if newratio>maxratio:
            maxratio = newratio
            ret = T1
        T1 = T1 + step
    return ret,maxratio

# Each targetgene is computed from function get_topk_ratio_with_gene(),i.e. selected based on the performance on VAL_SET;
# Because we will rerun the DSL corresponding to the targetgene and the starting DSL, and there is random factors affecting the time cost, the optimal gene on VAL_SET may be not the same.
# Therefore, we record the genes here.
target_genes_record = {
    'obestring0':'1100101011111111111011010100111111110111100111110011110000100100','obestring1':'1110011011111111010010000111011111101011011100111111111010010000111010','obestring2':'1100001111110100000011111110110111110101001011110010011000000000','obestring3':'11110100010100101111111101010101100110110001110101110000111100110010','obestring4':'1110111000010001101110011110011100001111101110101100000000100010000','obestring5':'111101000101111011110000000000001110000100101101100011111100110110','obestring6':'1110010110001100100010001101010111101010101100011111010001101100110110','obestring7':'1100001011110001101011111111101101000111111110011000000000000010010','obestring8':'11110110110101101000111101111101110010111101111110000110100111010','obestring9':'111110101110010100111100100111101110000011011111110110101011110100001100000000',
    'maxflashstring0':'010000000010100010010000110000100000000100000000110000100100100100',
    'maxflashstring1':'1100000000100000100010000101110010001000100000010101000001100',
    'maxflashstring2':'10000000000000000001000000000000000000000010000000000010000000001010',
    'maxflashstring3':'1000000000000010000000000000000010001000000000000000000101100',
    'maxflashstring4':'00000000000000010000010000000000010001000000000000000000101110',
    'maxflashstring5':'0110000000000001000000000100000000000010000000100000001000000000',
    'maxflashstring6':'00000001000011000000010000000000000000100000100010100000101110',
    'maxflashstring7':'01100000000000010000000000000000000000000010000010100000101110',
    'maxflashstring8':'0100100000000000000000000000000010000000000000100010010100000101100',
    'maxflashstring9':'0000000000000000000000010000011101010000001100000100000001000000101000',
    'eusolverstring0':'1110110101011000111110111011111111101011100101000100000000',
    'eusolverstring1':'10010100100101001001010100100001100101011000000111010001010110000100',
    'eusolverstring2':'1111010110010011011100100000110001101011100010000000000000',
    'eusolverstring3':'100010000000000000100110110111111010100101110011011100000000',
    'eusolverstring4':'101010010110100011111111000110101010100101110110011111111100010001100000000',
    'eusolverstring5':'100111011001110001100001011101111110101100001010010000000',
    'eusolverstring6':'10110110000111000100111100000010011011100101010001010110000000110000000',
    'eusolverstring7':'101101110111000001010010100100101100111011100111110010101101110001011110000000',
    'eusolverstring8':'100011010110100100100100001101111101000101001001000001100001000',
    'eusolverstring9':'1110010001111101110110111101110110111101101010011111001010011110010100',
    'eusolverbv0':'0111111101101010110000111110110100000000000',
    'eusolverbv1':'1000001100100000000000000000100000000000001',
    'eusolverbv2':'0011101000111001010010000000111000000000000',
    'eusolverbv3':'000010101100000001001001100000110100000000000',
    'eusolverbv4':'1001010000000001000000000001011010000000001',
    'eusolverbv5':'1000010010001000000010000000000000000000000',
    'eusolverbv6':'10001010000101111000000000000000000000000000000',
    'eusolverbv7':'110011100111100100010111110010001100000000000',
    'eusolverbv8':'00011010010101000000001000001001000000000000',
    'eusolverbv9':'1010111001100101001010000011000110000000000001',
    }

# starting DSL's solvedtasks, average timecost; optimzed DSL's solvedtasks, average timecost with two-stage; optimzed DSL's solvedtasks, average timecost without two-stage
results = {}

benchmarks = ['eusolverstring','maxflashstring','obestring','eusolverbv']

for benchmark in benchmarks:
    for group in range(10):
        TrainGenePath = "./{}/{}/TrainGenes".format(benchmark,group)
        BVflag = False
        if 'bv' in benchmark:
            BVflag = True
        if BVflag:
            CASES = 350
            ONE = 35
        else:
            CASES = 209
            ONE = 21

        random.seed(42)
        ALL_SET = [i for i in range(CASES)]
        random.shuffle(ALL_SET)
        TEST_SET = ALL_SET[group*ONE:(group+1)*ONE]
        if group == 8:
            VAL_SET = ALL_SET[9*ONE:] + ALL_SET[:ONE]
        elif group == 9:
            VAL_SET = ALL_SET[:2*ONE]
        else:
            VAL_SET = ALL_SET[(group+1)*ONE:(group+3)*ONE]
        TEST_VAL_SET = TEST_SET + VAL_SET
        TRAIN_SET = [i for i in ALL_SET if i not in TEST_VAL_SET]

        key = benchmark+str(group)
        target_gene = target_genes_record[key]

        LenGene = len(target_gene)
        gene0 = '0'*LenGene

        timelist0 = get_real_timelist(TrainGenePath,gene0,TRAIN_SET)
        testtimelist0 = get_real_timelist(TrainGenePath,gene0,TEST_SET)

        targettimelist = get_real_timelist(TrainGenePath,target_gene,TRAIN_SET)
        testtargettimelist = get_real_timelist(TrainGenePath,target_gene,TEST_SET)

        timeout = 300

        ret,ratio = find_best_timeout2(timelist0,targettimelist)

        #without two-stage
        notwostagepub0 = []
        notwostagepubnew = []
        notwostagesolved = 0
        for i in range(len(testtargettimelist)):
            if testtimelist0[i]<timeout and testtargettimelist[i]<timeout:
                notwostagepub0.append(testtimelist0[i])
                notwostagepubnew.append(testtargettimelist[i])
            if testtargettimelist[i]<timeout:
                notwostagesolved +=1

        notwostageavetime = sum(notwostagepubnew)/len(notwostagepubnew)

        #with two-stage
        originsolved = 0
        newsolved = 0
        newtimelist = get_new_timelist(testtimelist0,testtargettimelist,ret,timeout)

        pub0 = []
        pubnew = []
        for i in range(len(newtimelist)):
            if testtimelist0[i]<timeout:
                originsolved +=1
            if newtimelist[i]<timeout:
                newsolved +=1
            if newtimelist[i]<timeout and testtimelist0[i]<timeout:
                pub0.append(testtimelist0[i])
                pubnew.append(newtimelist[i])
        
        avgtime0 = sum(pub0)/len(pub0)
        avgtimenew = sum(pubnew)/len(pubnew)

        ret = [originsolved,avgtime0,newsolved,avgtimenew,notwostagesolved,notwostageavetime]
        results[key] = ret

#result of RQ1 and RQ3:
finalresult = {} 
for benchmark in benchmarks:
    allsolved = 0
    allavgtime = 0
    allnewsolved = 0
    allnewavgtime = 0
    allnosolved = 0
    allnonewavgtime = 0
    for group in range(10):
        key = benchmark+str(group)
        result = results[key]
        allsolved += result[0]
        allavgtime += result[1]
        allnewsolved += result[2]
        allnewavgtime += result[3]
        allnosolved += result[4]
        allnonewavgtime += result[5]
    allavgtime /= 10
    allnewavgtime /= 10
    allnonewavgtime /= 10
    speedup1 = allavgtime/allnewavgtime
    speedup2 = allavgtime/allnonewavgtime
    ret = [allsolved,allnewsolved,allavgtime,allnewavgtime,speedup1,allnosolved,allnonewavgtime,speedup2]
    finalresult[benchmark]=ret

#report1
print("benchmark,starting DSL solved, new DSL solved, avgtime0, avgtime1, speedup:")
for benchmark in benchmarks:
    ret = finalresult[benchmark]
    print("{},{},{},{:.2f},{:.2f},{:.2f}".format(benchmark,ret[0],ret[1],ret[2],ret[3],ret[4]))

print()


#report3
print("benchmark,with two-stage solved, avgtime,speepup1,without two-stage solved,avgtime,speedup2:")
for benchmark in benchmarks:
    ret = finalresult[benchmark]
    print("{},{},{:.2f},{:.2f},{},{:.2f},{:.2f}".format(benchmark,ret[1],ret[3],ret[4],ret[5],ret[6],ret[7]))









        
        