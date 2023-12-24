#str.substr(Param0,0,str.indexof(Param0," ",str.len(str.++("ssp.","ssp."))))
#str.substr(Param0,+(1,str.indexof(Param0," ",0)),3)
import os

def paramcnt(funcbody):
    cnt = 0
    while chr(65 + cnt) in funcbody:
        cnt = cnt + 1
    return cnt

def funcbodytrans(funcbody):
    #print(funcbody)
    res = ''
    leftcnt = 0
    for i in range(len(funcbody)):
        if funcbody[i] == '(':
            leftcnt += 1
        elif funcbody[i] == ' ':
            if leftcnt > 0:
                res = res + '('
                leftcnt -= 1
            else:
                if res[-1]!=',':
                    res = res + ','
        elif funcbody[i] == ')':
            if res[-1]==',':
                res = res[:-1]+')'
            else:
                res = res + ')'
        else:
            res = res + funcbody[i]
    #print(res)
    return res

def replacefunc(funcbody,params):
    #res = funcbody
    res = funcbodytrans(funcbody)
    # print(chr(65+0))
    # print(params[0])
    for i in range(len(params)):
        res = res.replace(chr(65+i),chr(65+i)+'42')
    for i in range(len(params)):
        res = res.replace(chr(65+i)+'42',params[i])
    #return res[1:-1] # 去掉前后括号 #TODO：string需要改成逗号形式
    #print(res)
    return res

def transtobase(s,funcbodys):#TODO 空格BV和逗号string等的区别
    while 'func' in s:
        leng = len(s)
        idx1 = s.index('func')
        idx2 = s[idx1+4:].index('(')#相对于切片的坐标#BV为' ',string为'()
        funcnum = int(s[idx1+4:idx1+4+idx2])
        # print(funcnum)
        # print(funcbodys)
        funcbody = funcbodys[funcnum]
        paramnum = paramcnt(funcbody)
        sstart = s[0:idx1]
        send = ''
        tmpidx = idx1 + 4 + idx2 + 1
        assert(s[tmpidx-1] == '(')


        params = []
        for i in range(paramnum):
            idxi = tmpidx
            idxj = tmpidx

            leftcnt = 0
            leftcomma = 0
            while tmpidx < leng:
                if s[tmpidx] == '"':
                    leftcomma = 1-leftcomma
                elif s[tmpidx] == ',' and leftcnt == 0 and leftcomma == 0:
                    idxj = tmpidx
                    break
                elif s[tmpidx] == '(' and leftcomma == 0:
                    leftcnt += 1
                elif s[tmpidx] == ')' and leftcomma == 0:
                    if leftcnt >0:
                        leftcnt -= 1
                    else:
                        idxj = tmpidx
                        break
                else:
                    pass
                tmpidx = tmpidx + 1

            params.append(s[idxi:idxj])

            #if i != paramnum-1:
            tmpidx = tmpidx + 1 # 当前为右括号
        send = s[tmpidx:]
        #s = sstart + 'ite (= ' + params[0] + ' #x0000000000000001) ' + params[1] + ' ' + params[2] + send
        #print('---:',replacefunc(funcbody,params))
        # print(sstart)
        # print(send)
        # print(params)
        s = sstart + replacefunc(funcbody,params) + send
        # print(s)
        # quit()
    return s#去掉多余括号

# funcbodys = ['(str.++ (str.++ B  C ) A )', '(str.++ (str.substr B  C  D ) A )', '(str.++ (str.substr B  0  C ) A )', '(str.++ (str.substr B  0  1 ) A )', '(str.++ (str.substr B  C  1 ) A )', '(str.++ (str.substr A  B  C ) (str.++ D  E ))', '(str.++ A  (str.++ B  C ))', '(str.++ A  (str.substr B  C  D ))', '(str.substr A  0  B )', '(str.substr A  0  1 )', '(str.substr A  0  (str.indexof A  B  C ))', '(str.substr A  0  (str.indexof B  C  D ))', '(str.substr A  (+ 1  (str.indexof A  C  D )) B )', '(str.substr A  (+ 1  (str.indexof C  D  E )) B )', '(str.substr A  (+ 1  C ) B )', '(str.substr A  (+ C  (str.indexof A  D  E )) B )', '(str.substr A  (+ C  (str.indexof D  E  F )) B )', '(str.substr A  (+ C  D ) B )', '(str.substr A  1  B )', '(str.substr A  (- C  D ) B )', '(str.substr A  B  1 )', '(str.substr A  B  (str.indexof A  C  D ))', '(str.substr A  B  (str.indexof C  D  E ))', '(str.substr A  B  (str.len A ))', '(str.substr A  B  (- C  D ))', '(str.substr A  B  3 )', '(str.substr A  B  (+ C  D ))', '(str.substr A  B  (str.len C ))', '(+ 1  A )', '(+ 1  (str.indexof A  B  C ))', '(+ -1  A )', '(+ A  (str.indexof B  C  D ))', '(+ A  (str.indexof B  C  1 ))', '(str.indexof A  B  0 )', '(str.indexof A  B  1 )', '(- (str.indexof B  C  D ) A )', '(- (str.len B ) A )', '(str.replace (str.substr C  D  E ) A  B )', '(str.replace (str.replace C  D  E ) A  B )']
# tmp = 'func5("C0",0,str.indexof(Param0,func18(Param0,1),0),func19(Param1,func28(1),-1,str.indexof(Param0,"C0",0)),func5(Param1,func28(func28(func28(str.indexof(Param0,"C0",0)))),1,func18("C0",func28(str.indexof(Param0,"C0",0))),func14(Param0,+(str.indexof(Param1,func14(Param1,func28(str.indexof(Param0,"C0",0)),1),str.indexof(Param0,"C0",0)),1),1)))'
# print(transtobase(tmp,funcbodys))
# quit()

def FromISToolGetProg(filepath):
    s = []
    with open(filepath, 'r') as f:
        for line in f.readlines():
            s.append(line.strip())

    if len(s) == 4:
        #baseanswer = transtobase(s[1],[])
        idx1 = s[0].index("{")
        idx2 = s[0].index("}")
        ans = s[0][idx1+3:idx2]
        return ans
    else:
        return ''

def appendtrainset(trainset,gene,funcbodys,path = "/home/ztye/experiments/obestring/0/DSL"):
    for i in trainset:
        aimpath = path + '/trainset/'+str(i)+'.out'
        if not os.path.exists(aimpath):
            os.system("touch %s" % aimpath)
        s = []
        with open(aimpath, 'r') as f:
            for line in f.readlines():
                s.append(line.strip())
        #sourcepath = path + '/fulloutput/' + str(i) + '.out' # gene+str(i)+'_.out'
        sourcepath = path + '/TrainGenes/' + gene +'/' + str(i)+'_.out'
        cands = FromISToolGetProg(sourcepath)
        basecands = transtobase(cands,funcbodys)
        #basecands = basecands + gene
        if basecands not in s and basecands != '': #and len(basecands) < 600:
            s.append(basecands)
        with open(aimpath,'w') as f:
            for i in range(len(s)):
                if i != len(s) - 1:
                    f.write(s[i]+'\n')
                else:
                    f.write(s[i])
            # for ss in s:
            #     f.write(ss+'\n')

def treetoarr(s1,dict1):
    outarr = []
    l1 = len(s1)
    i=0
    j=0
    while j < l1:
        if s1[j] != '(' and s1[j]!=')' and s1[j]!=',':
            j = j+1
        else:
            if i==j:
                outarr.append(-1)
                j=j+1
                i=j
                continue
            tmp = s1[i:j]
            if tmp in dict1:
                pass
            else:
                num = len(dict1)
                dict1[tmp] = num 
            val = dict1[tmp]
            outarr.append(val)
            if s1[j]!='(':
                outarr.append(-1)
            j=j+1
            i=j  
    return outarr

def treetoarr2origin(s1,dict2):#将字符串常量视为同一个参数 需在节点与节点之间增加边信息标记idx
    outarr = []
    l1 = len(s1)
    i=0
    j=0
    while j < l1:
        if s1[j] != '(' and s1[j]!=')' and s1[j]!=',':
            j = j+1
        else:
            if i==j:#连续的右括号
                outarr.append(-1)
                j=j+1
                i=j
                continue
            tmp = s1[i:j]
            if '"' in tmp:
                tmp = 'StringConst'
            if tmp in dict2:
                pass
            else:
                num = len(dict2)
                dict2[tmp] = num 
            val = dict2[tmp]
            outarr.append(val)
            if s1[j]!='(':
                outarr.append(-1)
            j=j+1
            i=j  
    return outarr,dict2

def treetoarr2(s1,dict2):#将字符串常量视为同一个参数 在节点与节点之间增加了边信息标记idx 20231127 在处理"(" ")" 有问题
    #print(s1)
    outarr = []
    l1 = len(s1)
    i=0
    j=0
    idxlist =[]
    stringflag = 0
    while j < l1:
        if s1[j] =='"':
            stringflag = 1-stringflag
            j = j+1
        elif stringflag == 1 or s1[j] != '(' and s1[j]!=')' and s1[j]!=',':      #'),'的处理有bug fixed
            j = j+1
        else:
            if i==j:#连续的右括号 或者 右括号接逗号 （右括号应该不会接左括号吧）
                outarr.append(-1)
                outarr.append(-1)
                if s1[j] == ',':
                    if (len(idxlist) == 0):
                        print(j)
                    idxlist[-1] = idxlist[-1] + 1
                    #print(idxlist)
                elif s1[j] == ')':
                    if j == len(s1) - 1:
                        idxlist.pop()
                    if j < len(s1) - 1 and (s1[j-1] != '"' or s1[j+1] != '"'):
                        idxlist.pop()
                        #print(idxlist)
                j=j+1
                i=j
                continue
            tmp = s1[i:j]
            if '"' in tmp:
                tmp = 'StringConst'
            if tmp in dict2:
                pass
            else:
                num = len(dict2)
                dict2[tmp] = num 
            val = dict2[tmp]
            if len(idxlist) > 0:
                outarr.append(idxlist[-1])
            outarr.append(val)
            if s1[j]!='(':
                outarr.append(-1)
                outarr.append(-1)
                if s1[j] == ',':
                    if (len(idxlist) == 0):
                        print(j)
                    idxlist[-1] = idxlist[-1] + 1
                    #print(idxlist)
                elif s1[j] == ')':
                    if j == len(s1) - 1:
                        idxlist.pop()

                    if j < len(s1) - 1 and (s1[j-1] != '"' or s1[j+1] != '"'):
                        idxlist.pop()
                        #print(idxlist)
            else:
                idxlist.append(1000)#标志0号变量
                #print(idxlist)
            j=j+1
            i=j 

    #print(idxlist)
    assert(len(dict2)<1000) 
    return outarr,dict2

# ori = 'str.++("(",str.replace(Param0,"-",str.++(")"," ")))'
# print(ori)
# outarr,dict2 = treetoarr2(ori,{})
# print(outarr)
# print(dict2)
# quit()

def getorder(a):
    out = ''
    for i in a:
        if i != -1 and i < 1000:
            out = out + str(i)
    return out

# dict2 = {}
# s = []
# with open('allprog.txt','r') as f:
#     for line in f.readlines():
#         s.append(line.strip())
# outarrs = []
# for si in s:
#     outarr,dict2 = treetoarr2(si,dict2)
#     outarrs.append(outarr)

# with open('allarr.txt','w') as f:
#     for i in range(len(outarrs)):
#         outarr = outarrs[i]
#         outs = str(i)+' '+str(i)+' '+str(len(outarr))
#         for n in outarr:
#             outs = outs + ' ' + str(n)
#         print(outs,file=f)

# with open('dict2.txt','w') as f2:
#     for key in dict2:
#         outs = key + ':' + str(dict2[key])
#         print(outs,file= f2)

# for si in s:
#     o,d = treetoarr2(s[0],d)
#     oo,d = treetoarr2origin(s[0],d)
#     o1 = getorder(o)
#     o2 = getorder(oo)
#     if o1 != o2:
#         print("fail on:",end='')
#         print(si)
# print("success")

def getprogdict(trainset,path = "/home/ztye/experiments/obestring/0/DSL"):
    dict1 = {}
    dict2 = {}

    # a,dict2 = treetoarr2('str.substr(Param0,+(1,str.indexof(Param0," ",0)),3)',dict2)
    # print(a)
    # quit()

    s=[]
    for i in trainset:
        fname = path + "/trainset/" + str(i) + ".out" 
        fo = open(fname,'r')
        for line in fo.readlines():
            newprog = line.strip()
            # print(newprog[-1])
            # print(newprog)
            # print(newprog[:-1])
            # quit()
            if len(newprog)==0:
                continue
            s.append(newprog)#0824疑惑 为什么要去掉末尾的一个符号？ lstrip 所以右边有个换行
            #break
        fo.close()

    with open(path + '/allprog.txt','w') as f:
        for si in s:
            #
            # if 'ite' in si:
            #     continue
            #
            print(si,file=f)

    outarrs = []
    for si in s:
        if 'ite' in si:
            continue
        outarr,dict2 = treetoarr2(si,dict2)
        outarrs.append(outarr)


    lenrecored = []

    with open(path + '/allarr.txt','w') as f:
        cnt = 0
        for outarr in outarrs:
            if len(outarr) > 150:
                continue
            lenrecored.append(len(outarr))
            outs = str(cnt) + ' ' + str(cnt) + ' ' + str(len(outarr))
            cnt = cnt + 1
            for n in outarr:
                outs = outs + ' ' + str(n)
            print(outs,file = f)


    with open(path + '/dict2.txt','w') as f2:
        for key in dict2:
            outs = key + ':' + str(dict2[key])
            print(outs,file= f2)

    # with open(path + '/allarr.txt','w') as f:
    #     for i in range(len(outarrs)):
    #         outarr = outarrs[i]
    #         outs = str(i)+' '+str(i)+' '+str(len(outarr))
    #         for n in outarr:
    #             outs = outs + ' ' + str(n)
    #         print(outs,file=f)


    # with open(path + '/dict2.txt','w') as f2:
    #     for key in dict2:
    #         outs = key + ':' + str(dict2[key])
    #         print(outs,file= f2)






    


'''
s1 ='(-1,str.indexof(Param0,"overhead",0))'
s2 = 'str.substr(Param0,0,str.indexof(Param0," ",str.len(str.++("ssp.","ssp."))))'
s3 = 'str.substr(Param0,+(-1,str.indexof(Param0,".",1)),+(1,+(1,1)))'
s4 = 'str.replace(str.substr(Param0,+(-1,+(-1,+(-1,+(-1,str.len(Param0))))),str.len(Param0)),">","")'
s5 = 'str.substr(Param0,+(1,str.indexof(Param0,"-",-(Param1,2))),str.indexof(Param0,"-",Param1))'
s6 = 'str.++(Param0,str.++("/n",str.++(Param1,str.++("/n",Param2))))'
s7 = 'str.substr(Param0,0,-(str.len(Param0),3))'
s8 = 'str.substr(Param1,0,str.indexof(Param1,"_",1))'
s9 = '-(2,str.indexof(int.to.str(+(-1,str.indexof(Param0,Param1,1))),int.to.str(2),0))'
s10 = 'str.replace(Param0,str.substr(Param0,+(1,1),+(1,+(1,1))),"")'
s11 = 'str.contains(Param0,"9999999")'
s12 = 'str.at(Param0,+(Param1,-1))'
s13 = 'str.indexof(Param1,str.at(Param0,1),+(1,1))'
s14 = 'str.replace(str.replace(str.replace(Param0,"BRD","Branding"),"DRS","Direct Response"),"LDS","Leads")'
s15 = 'str.substr(Param0,0,+(-1,str.indexof(Param0,"-",1)))'
s16 = 'str.substr(Param0,0,str.indexof(str.++(Param0,"|"),"|",1))'
s17 = 'str.substr(Param0,+(1,+(1,str.len("Name"))),str.len(Param0))'
s18 = 'ite(str.prefixof("C0",Param0),Param0,Param1)'
s19 = 'ite(str.suffixof("/",Param0),"microsoft",ite(str.suffixof("windows",Param0),"windows","mac"))'
s20 = 'str.substr(Param0,+(1,str.indexof(str.replace(str.replace(Param0,"/"," "),"/"," "),"/",1)),str.len(Param0))'
s21 = 'str.suffixof(Param1,Param0)'
s22 = 'ite(str.contains(Param0,Param2),Param0,Param1)'
s23 = 'str.replace(Param0,str.replace("that",Param0,""),"")'
s24 = 'str.replace(str.substr(Param0,0,str.indexof(Param0,"<",1)),str.++("<",str.++("b",">")),"")'
s25 = 'str.prefixof(Param0,Param1)'
s26 = 'str.++("Dr.",str.++(" ",str.substr(Param0,0,str.indexof(Param0," ",0))))'
s27 = 'str.substr(Param1,+(1,str.indexof(Param1,"_",1)),str.len(Param1))'
s28 = 'str.++(str.at(Param0,0),str.++(".",str.++(str.at(Param0,+(1,str.indexof(Param0," ",0))),".")))'
s29 = 'str.substr(Param0,+(1,str.indexof(Param0," ",0)),str.len(Param0))'
s30 = 'str.substr(Param0,0,3)'
s31 = 'str.substr(Param0,+(1,str.indexof(Param0," ",0)),3)'
s32 = 'str.substr(Param0,Param1,str.len(Param0))'
s33 = 'str.++(Param1,str.++(" ",Param0))'
s34 = 'str.substr(Param0,0,+(-1,str.indexof(Param0,"Inc",1)))'
s35 = 'str.++(Param0,str.++(".",str.++(" ",Param1)))'  #原本为‘,’,但是逗号被用于作parse，为方便直接修改 38
s36 = 'str.replace(str.replace(Param0,Param1,""),Param1,"")'
s = []
s.append(s1)
s.append(s2)
s.append(s3)
s.append(s4)
s.append(s5)
s.append(s6)
s.append(s7)
s.append(s8)
s.append(s9)
s.append(s10)
s.append(s11)
s.append(s12)
s.append(s13)
s.append(s14)
s.append(s15)
s.append(s16)
s.append(s17)
s.append(s18)
s.append(s19)
s.append(s20)
s.append(s21)
s.append(s22)
s.append(s23)
s.append(s24)
s.append(s25)
s.append(s26)
s.append(s27)
s.append(s28)
s.append(s29)
s.append(s30)
s.append(s31)
s.append(s32)
s.append(s33)
s.append(s34)
s.append(s35)
s.append(s36)
#从文件中读取并添加
'''