#tmp = '(if0 (bvand x #x0000000000000001) (shl1 (bvnot (shl1 (shr1 x)))) (bvnot (shl1 (bvnot x))))'
#tmp = '(if0 x (shl1 (bvand x #x00000000000000)) (bvnot (shl1 (bvnot x))))'
#在一个括号内的首个表示父节点 后续皆为子节点
#0816meeting后#TODO：将直接拿到的解程序翻译到基本的算子组成 注意ISTOOL1024也对应需要这个功能（或者说应该给1024一些翻译后的解程序） DONE
#0901 transtobase需要能够处理所有compose的算子
#func7:(ite (= (bvand D  #x0000000000000001 ) C ) A  B ))
#(func7 (shl1 (bvor x #x0000000000000001)) x #x0000000000000000 x))
#识别出对应数量的params

def paramcnt(funcbody):
    cnt = 0
    while chr(65 + cnt) in funcbody:
        cnt = cnt + 1
    return cnt

def replacefunc(funcbody,params):
    res = funcbody
    for i in range(len(params)):
        res = res.replace(chr(65+i),params[i])
    return res[1:-1] # 去掉前后括号

def transtobase(s,funcbodys):#处理那几个已经compose的算子 然后将扩展后的程序保存到原来的文件或者文件集合里 .out收集所有文件 没有特殊处理最后一个右括号
    #print(s)
    tobetransop = ['if0','shr16','shr4','shr1','shl1']
    opdict = {'shr1':'#x0000000000000001','shr4':'#x0000000000000004','shr16':'#x0000000000000010','shl1':'#x0000000000000001'}
    for op in tobetransop:
        while op in s:
            leng = len(s)
            idx = s.index(op)
            sstart = s[0:idx]#预处理操作符左侧字符串
            send = ''
            #获取所有操作符
            if op == 'if0':
                #获取x,y,z
                tmpidx = idx + len(op) + 1
                assert(s[tmpidx-1] == ' ')
                params = []
                for i in range(3):
                    idxi = tmpidx
                    idxj = tmpidx
                    if s[tmpidx] == '(':#找到匹配的右括号
                        leftcnt = 0
                        while tmpidx < leng:
                            if s[tmpidx] == '(':
                                leftcnt = leftcnt + 1
                            elif s[tmpidx] == ')':
                                leftcnt = leftcnt - 1
                            else:
                                pass
                            tmpidx = tmpidx + 1
                            if leftcnt == 0:
                                idxj = tmpidx
                                break
                    else:#直接的参数
                        while tmpidx < leng:
                            if s[tmpidx] == ' ' or s[tmpidx] == ')':
                                idxj = tmpidx
                                break
                            tmpidx = tmpidx + 1
                    params.append(s[idxi:idxj])
                    if i != 2:
                        tmpidx = tmpidx + 1 # 当前为空格
                send = s[tmpidx:]
                s = sstart + 'ite (= ' + params[0] + ' #x0000000000000001) ' + params[1] + ' ' + params[2] + send
                #print(s)
            else:
                #获取一个参数即可
                tmpidx = idx + len(op) + 1
                assert(s[tmpidx-1] == ' ')
                idxi = tmpidx
                idxj = tmpidx
                if s[tmpidx] == '(':#找到匹配的右括号
                    leftcnt = 0
                    while tmpidx < leng:
                        if s[tmpidx] == '(':
                            leftcnt = leftcnt + 1
                        elif s[tmpidx] == ')':
                            leftcnt = leftcnt - 1
                        else:
                            pass
                        tmpidx = tmpidx + 1
                        if leftcnt == 0:
                            idxj = tmpidx
                            break
                else:#直接的参数
                    while tmpidx < leng:
                        if s[tmpidx] == ' ' or s[tmpidx] == ')':
                            idxj = tmpidx
                            break
                        tmpidx = tmpidx + 1
                param = s[idxi:idxj]
                send = s[tmpidx:]
                if 'shl' in op:
                    baseop = 'bvshl'
                else:
                    baseop = 'bvlshr'
                s = sstart + baseop + ' ' + param + ' ' + opdict[op] + send
    #print(s) 
    while 'func' in s:
        leng = len(s)
        idx1 = s.index('func')
        idx2 = s[idx1+4:].index(' ')#相对于切片的坐标
        funcnum = int(s[idx1+4:idx1+4+idx2])
        funcbody = funcbodys[funcnum]
        paramnum = paramcnt(funcbody)
        sstart = s[0:idx1]
        send = ''
        tmpidx = idx1 + 4 + idx2 + 1
        assert(s[tmpidx-1] == ' ')


        params = []
        for i in range(paramnum):
            idxi = tmpidx
            idxj = tmpidx
            if s[tmpidx] == '(':#找到匹配的右括号
                leftcnt = 0
                while tmpidx < leng:
                    if s[tmpidx] == '(':
                        leftcnt = leftcnt + 1
                    elif s[tmpidx] == ')':
                        leftcnt = leftcnt - 1
                    else:
                        pass
                    tmpidx = tmpidx + 1
                    if leftcnt == 0:
                        idxj = tmpidx
                        break
            else:#直接的参数
                while tmpidx < leng:
                    if s[tmpidx] == ' ' or s[tmpidx] == ')':
                        idxj = tmpidx
                        break
                    tmpidx = tmpidx + 1
            params.append(s[idxi:idxj])
            if i != paramnum-1:
                tmpidx = tmpidx + 1 # 当前为空格
        send = s[tmpidx:]
        #s = sstart + 'ite (= ' + params[0] + ' #x0000000000000001) ' + params[1] + ' ' + params[2] + send
        s = sstart + replacefunc(funcbody,params) + send
    return s#去掉多余括号

def notrans(s):
    return s

# funcbodys = ['(ite (= (bvand (bvlshr E  F ) D ) C ) A  B )', '(ite (= (bvand (bvlshr D  E ) C ) #x0000000000000001 ) A  B )', '(ite (= (bvand (bvlshr D  E ) C ) B ) #x0000000000000001  A )', '(ite (= (bvand (bvlshr D  E ) #x0000000000000001 ) C ) A  B )', '(ite (= (bvand (bvlshr C  D ) #x0000000000000001 ) B ) #x0000000000000001  A )', '(ite (= (bvand D  E ) C ) A  B )', '(ite (= (bvand C  D ) B ) #x0000000000000001  A )', '(ite (= (bvand D  #x0000000000000001 ) C ) A  B )', '(ite (= (bvand C  #x0000000000000001 ) B ) #x0000000000000001  A )', '(ite (= (bvand C  D ) #x0000000000000001 ) A  B )', '(ite (= C  D ) A  B )', '(ite (= B  C ) (ite (= F  G ) D  E ) A )', '(ite (= B  C ) (ite (= F  #x0000000000000001 ) D  E ) A )', '(ite (= B  C ) A  (ite (= F  G ) D  E ))', '(ite (= B  C ) A  (ite (= F  #x0000000000000001 ) D  E ))', '(= (bvand (bvlshr C  D ) B ) A )', '(= (bvand (bvlshr B  C ) A ) #x0000000000000001 )', '(= (bvand (bvlshr B  C ) #x0000000000000001 ) A )', '(= (bvand B  C ) A )', '(= (bvand B  #x0000000000000001 ) A )', '(= (bvand A  B ) #x0000000000000001 )', '(= A  #x0000000000000001 )', '(bvand (bvlshr B  C ) A )', '(bvand (bvlshr A  B ) #x0000000000000001 )', '(bvand A  #x0000000000000001 )', '(bvlshr (bvlshr B  C ) A )', '(bvlshr (bvlshr B  #x0000000000000010 ) A )', '(bvlshr A  B )']
# tmp = '(if0 (func23 x #x0000000000000001) (if0 (func24 (shr16 x)) (bvor (func27 x #x0000000000000001) #x0000000000000001) (bvor (shr16 x) x)) (if0 (func24 (shr16 (shr16 x))) (bvor (func27 x #x0000000000000001) #x0000000000000001) (if0 (func24 x) x (bvor (func27 x #x0000000000000001) #x0000000000000001))))'
# print(transtobase(tmp,funcbodys))
# quit()

def trainsetinit(cnt = 350):
    import os
    for i in range(cnt):
        path = '/home/ztye/experiments/obestring/0/DSL/src_bv/trainset/'
        filename = path + str(i) + '.out'
        cmdline = 'touch '+ filename
        os.system(cmdline)

def FromEuretGetProg(filepath):
    s = []
    with open(filepath, 'r') as f:
        for line in f.readlines():
            s.append(line.strip())
    if len(s) == 3:
        return s[1][:-1]
    else:
        return ''
    #return s[1][:-1] #左括号开头 右括号结尾 包起来的以空格分隔的程序集
 
def appendtrainset(trainset,gene,funcbodys,path = "/home/ztye/experiments/obestring/0/DSL"):
    for i in trainset:
        aimpath = path + '/src_bv/trainset/'+str(i)+'.out'
        s = []
        with open(aimpath, 'r') as f:
            for line in f.readlines():
                s.append(line.strip())
        #sourcepath = path + '/fulloutput/' + str(i) + '.out' # gene+str(i)+'_.out'
        sourcepath = path + '/TrainGenes/' + gene +'/' + str(i)+'_.out'
        cands = FromEuretGetProg(sourcepath)
        basecands = transtobase(cands,funcbodys)
        if basecands not in s and basecands != '':
            s.append(basecands)
        with open(aimpath,'w') as f:
            for i in range(len(s)):
                if i != len(s) - 1:
                    f.write(s[i]+'\n')
                else:
                    f.write(s[i])
            # for ss in s:
            #     f.write(ss+'\n')
            

def bvstrans(bvs): #bv的解（带有前后括号）经过bvstrans转换后可以回到原来string格式的解 从而复用原来的toarr函数
    news = ''
    l1 = len(bvs)-1 #最后一个是多余的括号 如果复制第二行的话
    i = 0
    j = 0
    firstafterleft = False
    while j < l1:
        if bvs[j] == '(':
            firstafterleft = True
            j += 1
            i = j
            continue
        if bvs[j] == ' ':
            if firstafterleft:
                tmp = bvs[i:j]
                news = news + tmp + '('
                firstafterleft = False
                j += 1
                i = j
            else:
                tmp = bvs[i:j]
                news = news + tmp + ','
                j += 1
                i = j
        elif bvs[j] == ')':
            tmp = bvs[i:j]
            news = news + tmp + ')'
            j += 1
            i = j
        else:
            j += 1
    return news

# ss = "(if0 (bvand (shr16 x) #x0000000000000001) (if0 (bvand x #x0000000000000001) (shr16 (bvxor (shr1 x) x)) (shr16 x)) (shr1 (shr4 (shr16 (bvand (shr4 (shr4 x)) x))))))"
# news = bvstrans(ss)
# print(news)

def treetoarr2(s1,dict2):#bv版本 将#带数字视为同一个参数   在节点与节点之间增加了边信息标记idx 
    '''
    左括号开始 右括号结束
    只有一个变量为x
    常数只有#x0000000000000000 #x0000000000000001
    '''
    outarr = []
    l1 = len(s1)
    i=0
    j=0
    idxlist =[]
    while j < l1:
        if s1[j] != '(' and s1[j]!=')' and s1[j]!=',':      #'),'的处理有bug fixed
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
                    if j <= len(s1) - 1:
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
                    if j <= len(s1) - 1:
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


def getprogdict(trainset,path = "/home/ztye/experiments/obestring/0/DSL/src_bv"):
    dict2 = {}

    s = []
    for i in trainset:
        fname = path + "/trainset/" + str(i) + ".out" 
        fo = open(fname,'r')
        for line in fo.readlines():
            s.append(line.lstrip())
        fo.close()

    with open(path + '/allprog.txt','w') as f:
        for si in s:
            print(si,file=f)

    bvs=[]
    with open(path + '/allprog.txt','r') as f:
        for line in f.readlines():
            bvs.append(line.strip())

    s = []
    for bv in bvs:
        s.append(bvstrans(bv))

    outarrs = []
    for si in s:
        outarr,dict2 = treetoarr2(si,dict2)
        outarrs.append(outarr)

    lenrecored = []

    with open(path + '/allarr.txt','w') as f:
        cnt = 0
        for outarr in outarrs:
            if len(outarr) > 210:#303/350个小于500的长度 会不会仍然太长了？
                continue
            lenrecored.append(len(outarr))
            outs = str(cnt) + ' ' + str(cnt) + ' ' + str(len(outarr))
            cnt = cnt + 1
            for n in outarr:
                outs = outs + ' ' + str(n)
            print(outs,file = f)

        # for i in range(len(outarrs)):
        #     outarr = outarrs[i]
        #     outs = str(i)+' '+str(i)+' '+str(len(outarr))
        #     for n in outarr:
        #         outs = outs + ' ' + str(n)
        #     print(outs,file=f)

    with open(path + '/dict2.txt','w') as f2:
        for key in dict2:
            outs = key + ':' + str(dict2[key])
            print(outs,file= f2)

    lenrecored.sort()
    print(lenrecored)

# getprogdict([i for i in range(350)])