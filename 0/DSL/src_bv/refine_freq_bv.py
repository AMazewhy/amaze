

#如果A是B的频繁模式延伸，且频繁度B>k(=0.8)*频繁度A，则去掉A
def testAB(A,B):
    pattern1 = A[0]
    freq1 = A[1]
    pattern2 = B[0]
    freq2 = B[1]
    if len(pattern1) > len(pattern2):
        return False
    flag = True
    for idx in range(len(pattern1)):
        if pattern1[idx] == pattern2[idx]:
            continue
        else:
            flag = False
    if flag and freq1*0.8<freq2:
        return True
    else:
        return False

def createsubnodes(typelist,parentnode):
    for t in typelist:
        subnode = BVNode(t)
        parentnode.subnodes.append(subnode)
        subnode.parent = parentnode

class BVNode: #所有节点类型都是BitVec 扩展之后ite bool（= x #x01)
    def __init__(self,name) -> None:
        self.name = name
        self.subnodes = []
        self.parent = None
        self.label = False
        #if name == 'B' or name == 'x' or name == '#x0000000000000001' or name == '#x0000000000000000':
        if name == 'B' or name == 'x' or '#x' in name:
            self.type = '(BitVec 64)'
        elif name == 'bvnot': #or name == 'shl1' or name == 'shr1' or name == 'shr4' or name == 'shr16' :
            self.type = '(BitVec 64)'
            createsubnodes(['B'],self)
        elif name == 'bvlshr' or name == 'bvshl':
            self.type = '(BitVec 64)'
            createsubnodes(['B','B'],self)
        elif name == 'bvand' or name == 'bvor' or name == 'bvxor' or name == 'bvadd':
            self.type = '(BitVec 64)'
            createsubnodes(['B','B'],self)
        #elif name == 'if0':
        elif self.name == 'ite':
            self.type = '(BitVec 64)'
            createsubnodes(['=','B','B'],self)
        elif self.name == '=':
            self.type = '(bool)'
            createsubnodes(['B','B'],self)
        else:
            assert(False)
        
    def getroot(self):
        tmpnode = self
        while tmpnode.parent != None:
            tmpnode = tmpnode.parent
        return tmpnode  
    
    def recusive_copy(self):
        newnode = BVNode(self.name)
        if self.label == True:
            newnode.label = True
        for sn in range(len(self.subnodes)):
            newnode.subnodes[sn] = self.subnodes[sn].recusive_copy()
            newnode.subnodes[sn].parent = newnode

        return newnode


    def clone(self,label=True):
        self.label = label
        root = self.getroot()
        root_copied = root.recusive_copy()
        bfs = [root_copied]
        while len(bfs) > 0:
            tmpnode = bfs.pop(0)
            if tmpnode.label == True:
                #tmpnode.label = False # no label
                self.label = False # no label 1
                return tmpnode
            for subnode in tmpnode.subnodes:
                bfs.append(subnode)
        assert(False)

    def print(self):
        print(self.name,end='')
        if len(self.subnodes)>0:
            print('(',end='')
        for subnode in self.subnodes:
            subnode.print()
            print(' ',end='')
        if len(self.subnodes)>0:
            print(')',end='')
    
    def getsignal(self):
        s = ''
        if self.name == 'x':
            s = s + 'B'
        else:
            s = s + self.name
        if len(self.subnodes)>0:
            s = s + '('
        for subnode in self.subnodes:
            s = s + subnode.getsignal()
            if subnode!= self.subnodes[-1]:
                s = s + ' '
        if len(self.subnodes)>0:
            s = s + ')'
        return s

#bv不需要再翻译？
def interpreter(treenode:BVNode):#最大param范围
    s = treenode.getsignal()
    # while "StringConst" in s:
    #     s = s.replace("StringConst","S") BV对应的常数只有#x00和#x01这两个应该可以直接加到里面？
    return s

def create_funcbody(treenode:BVNode,tmpdict:dict):
    s = ''
    #flag = False
    if len(treenode.subnodes) > 0:
        s = s + '('
    if treenode.name in tmpdict:
        s = s + chr(65 + tmpdict[treenode.name]) + ' '
    else:# #x00 #x01
        s = s + treenode.name + ' '
    
    for subnode in treenode.subnodes:
        s = s + create_funcbody(subnode,tmpdict)
        if subnode != treenode.subnodes[-1]:#这个判等也许有bug
            s = s + ' '
    if len(treenode.subnodes) > 0:
        s = s + ')'
    return s
    

#返回genes.py中的funcs数组
#函数命名，变量编号
#func0-func1-... A-B-C-...
def createonefunc(treenode:BVNode,idx):
    rets = '(define-fun '
    funcname = 'func'+str(idx)+' '
    rets = rets + funcname + ' '

    tmpdict = {}
    bfs = [treenode]
    cnt = 0
    sign = '('
    while len(bfs) > 0:
        t = bfs.pop(0)
        if t.name == 'B':
            t.name = t.name + str(cnt)
            sign = sign + "(" + chr(65+cnt) + ' ' + t.type + ") "
            tmpdict[t.name] = cnt
            cnt = cnt + 1
        if t.name == 'x' and t.name in tmpdict:#变量x已经被声明过 不需要再加
            #sign = sign + "(" + chr(65+tmpdict[t.name]) + ' ' + t.type.capitalize() + ") "
            pass
        if t.name == 'x' and t.name not in tmpdict:
            sign = sign + "(" + chr(65+cnt) + ' ' + t.type + ") "
            tmpdict[t.name] = cnt
            cnt = cnt + 1
        for subnode in t.subnodes:
            bfs.append(subnode)

    sign = sign + ')'
    rets = rets + sign + ' '

    # if treenode.type == 'string':
    #     functype = 'String'
    # elif treenode.type == 'int':
    #     functype = 'Int'
    # elif treenode.type == 'bool':
    #     functype = 'Bool'
    # else:
    #     assert(False)
    #functype = '(BitVec 64)'
    functype = treenode.type
    rets = rets + functype + ' '

    funcbody = create_funcbody(treenode,tmpdict)
    rets = rets + funcbody + ')'

    return rets,funcbody


def createfunc(treelist):
    funcs = ['',
'(set-logic BV)',
'',
'(define-fun shr1 ((x (BitVec 64))) (BitVec 64) (bvlshr x #x0000000000000001))',
'(define-fun shr4 ((x (BitVec 64))) (BitVec 64) (bvlshr x #x0000000000000004))',
'(define-fun shr16 ((x (BitVec 64))) (BitVec 64) (bvlshr x #x0000000000000010))',
'(define-fun shl1 ((x (BitVec 64))) (BitVec 64) (bvshl x #x0000000000000001))',
'(define-fun if0 ((x (BitVec 64)) (y (BitVec 64)) (z (BitVec 64))) (BitVec 64) (ite (= x #x0000000000000001) y z))']
    funcbodys = []
    for i in range(len(treelist)):
        newfunc,funcbody = createonefunc(treelist[i],i)
        funcbodys.append(funcbody)
        if 'bool' in newfunc or 'ite' in newfunc:#0908改动 不加ite
            continue
        funcs.append(newfunc)
    return funcs,funcbodys

def createoneapp(treenode:BVNode,i):
    if treenode.type == '(bool)':
        return ''
    if treenode.name == 'ite':
        return ''
    app = '(func'+str(i)
    bfs = [treenode]
    tmprec = []
    while len(bfs) > 0:
        t = bfs.pop(0)
        if len(t.subnodes) == 0:
            if t.name == 'x' and t.name not in tmprec:
                app = app + ' Start'
                tmprec.append(t.name)
            elif t.name == 'x' and t.name in tmprec:
                pass
            elif '#x' in t.name: #两个常量
                pass
            else:
                app = app + ' Start'
        for subnode in t.subnodes:
            bfs.append(subnode)
    app = app + ')'
    return app 

def createapp(treelist):
    ntBVapp = []
    for i in range(len(treelist)):
        app = createoneapp(treelist[i],i)
        if app == '':
            continue
        ntBVapp.append(app)
    return ntBVapp

def getbasetree():#扩展后base也需要修改
    rettree = []
    #namelist = ['bvnot','shl1','shr1','shr4','shr16','bvand','bvor','bvxor','bvadd','if0']
    namelist = ['bvnot','bvand','bvor','bvxor','bvadd']#剩下几个要重新写
    for name in namelist:
        newtree = BVNode(name)
        rettree.append(newtree)
    newtree = BVNode('bvlshr')
    #newtree.subnodes[0].name = 'x'
    newtree.subnodes[1].name = '#x0000000000000001'
    rettree.append(newtree)
    newtree = BVNode('bvlshr')
    #newtree.subnodes[0].name = 'x'
    newtree.subnodes[1].name = '#x0000000000000004'
    rettree.append(newtree)
    newtree = BVNode('bvlshr')
    #newtree.subnodes[0].name = 'x'
    newtree.subnodes[1].name = '#x0000000000000010'
    rettree.append(newtree)
    newtree = BVNode('bvshl')
    #newtree.subnodes[0].name = 'x'
    newtree.subnodes[1].name = '#x0000000000000001'
    rettree.append(newtree)
    newtree = BVNode('ite')
    #newtree.subnodes[0].subnodes[0].name = 'x'
    newtree.subnodes[0].subnodes[1].name = '#x0000000000000001'
    rettree.append(newtree)
    return rettree


def getfnins_withidx():#处理带有idx的频繁模式
    path = "/home/ztye/experiments/obestring/0/DSL/src_bv"
    #基于sleuth生成的频繁模式 获得经过筛选后的可用的频繁模式  
    f = open(path+"/freq_sleuth.txt")
    value = []
    while True:
        lines = f.readlines(10000)
        if not lines:
            break
        for line in lines:
            value.append(line)
    f.close()

    #print(value[-1])

    freq_list = [] #[str]
    for v in value:
        idx = v.index(' - ')
        new_pattern = v[:idx].split()
        new_freq = []
        new_freq.append(new_pattern)
        new_freq.append(eval(v[idx+2:]))
        freq_list.append(new_freq)

    labels = [1 for i in range(len(freq_list))]
    l = len(freq_list)
    for i in range(l-1):
        for j in range(i+1,l):
            if testAB(freq_list[i],freq_list[j]):
                labels[i] = 0
                break
            if freq_list[i][0][0] != freq_list[j][0][0]:
                break

    refined_freq_list = []
    for i in range(len(labels)):
        if labels[i] == 1:
            refined_freq_list.append(freq_list[i])

    #对每一个频繁模式建所有可能的完全树 去掉等价的部分
    #处理映射关系
    f = open(path+"/dict2.txt")
    value = []
    while True:
        lines = f.readlines(10000)
        if not lines:
            break
        for line in lines:
            value.append(line)
    f.close()

    opmap = {}
    for v in value:
        idx = v.index(':')
        op = v[:idx]
        strnum = v[idx+1:].strip()
        opmap[strnum] = op

    base_trees = getbasetree()

    treelist=[]
    for ap in refined_freq_list:
        a = ap[0]
        #print(a)
        if eval(a[0]) >= 1000:
            continue #必然对应于另一个更短的不以idx开头的频繁模式
        newnode = BVNode(opmap[a[0]])
        idx = -1
        
        flag = True
        for i in a[1:]:
            if i == '-1':
                if idx != -1:
                    idx = -1
                    continue
                else:
                    if newnode.parent == None:
                        break
                    newnode = newnode.parent
                    continue
            elif eval(i) >= 1000:
                idx = eval(i) - 1000
                continue

            tmpnode = newnode
            newnode = BVNode(opmap[i])
            assert(idx != -1)
            assert(tmpnode.subnodes[idx].type == newnode.type)#Param0,Param1的类型是否有问题
            # if tmpnode.subnodes[idx].type != newnode.type: # 类型不匹配可能是由于将所有idx=1000看作了相同的一个节点 
            #     print(a)
            #     flag = False
            tmpnode.subnodes[idx] = newnode
            newnode.parent = tmpnode

        if flag:
            newtree = newnode.getroot()
            treelist.append(newtree)

    signals = []
    updated_treelist = []

    for t in base_trees:
        signals.append(interpreter(t))
    #print(signals)

    for t in treelist:
        newsignal = interpreter(t)
        if newsignal in signals:
            continue
        signals.append(newsignal)
        #print(newsignal)
        updated_treelist.append(t)



    funcs,funcbodys = createfunc(updated_treelist)
    funcs.append('(synth-fun f ( (x (BitVec 64))) (BitVec 64)')
    funcs.append('(')
    #BV所有header都相同
    
    BVapp = createapp(updated_treelist)
    return funcs,BVapp,funcbodys

#TODO:tobetest seems right

# funcs,BVapp = getfnins_withidx()

# # funcs = ['', '(set-logic BV)', '', '(define-fun shr1 ((x (BitVec 64))) (BitVec 64) (bvlshr x #x0000000000000001))', '(define-fun shr4 ((x (BitVec 64))) (BitVec 64) (bvlshr x #x0000000000000004))', '(define-fun shr16 ((x (BitVec 64))) (BitVec 64) (bvlshr x #x0000000000000010))', '(define-fun shl1 ((x (BitVec 64))) (BitVec 64) (bvshl x #x0000000000000001))', '(define-fun if0 ((x (BitVec 64)) (y (BitVec 64)) (z (BitVec 64))) (BitVec 64) (ite (= x #x0000000000000001) y z))', '(define-fun func0  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) ) (BitVec 64) (if0 (bvand (shr1 D ) C ) A  B ))', '(define-fun func1  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (if0 (bvand (shr1 C ) B ) #x0000000000000001  A ))', '(define-fun func2  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) ) (BitVec 64) (if0 (bvand (shr1 D ) C ) A  B ))', '(define-fun func3  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (if0 (bvand (shr1 C ) B ) #x0000000000000001  A ))', '(define-fun func4  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (if0 (bvand (shr1 C ) #x0000000000000001 ) A  B ))', '(define-fun func5  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) ) (BitVec 64) (if0 (bvand C  D ) A  B ))', '(define-fun func6  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (if0 (bvand C  #x0000000000000001 ) A  B ))', '(define-fun func7  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) ) (BitVec 64) (if0 (bvand (shr16 D ) C ) A  B ))', '(define-fun func8  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (if0 (bvand (shr16 C ) B ) #x0000000000000001  A ))', '(define-fun func9  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) ) (BitVec 64) (if0 (bvand (shr16 D ) C ) A  B ))', '(define-fun func10  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (if0 (bvand (shr16 C ) B ) #x0000000000000001  A ))', '(define-fun func11  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (if0 (bvand (shr16 C ) #x0000000000000001 ) A  B ))', '(define-fun func12  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) ) (BitVec 64) (if0 (bvand (shr4 D ) C ) A  B ))', '(define-fun func13  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (if0 (bvand (shr4 C ) B ) #x0000000000000001  A ))', '(define-fun func14  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) ) (BitVec 64) (if0 (bvand (shr4 D ) C ) A  B ))', '(define-fun func15  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (if0 (bvand (shr4 C ) B ) #x0000000000000001  A ))', '(define-fun func16  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (if0 (bvand (shr4 C ) #x0000000000000001 ) A  B ))', '(define-fun func17  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) ) (BitVec 64) (if0 (bvand C  D ) A  B ))', '(define-fun func18  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (if0 (bvand C  #x0000000000000001 ) A  B ))', '(define-fun func19  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) (F (BitVec 64)) (G (BitVec 64)) ) (BitVec 64) (if0 (bvand B  C ) (if0 (bvand (shr1 G ) F ) D  E ) A ))', '(define-fun func20  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) (F (BitVec 64)) (G (BitVec 64)) ) (BitVec 64) (if0 (bvand B  C ) (if0 (bvand F  G ) D  E ) A ))', '(define-fun func21  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) (F (BitVec 64)) ) (BitVec 64) (if0 (bvand B  C ) (if0 (bvand F  #x0000000000000001 ) D  E ) A ))', '(define-fun func22  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) (F (BitVec 64)) (G (BitVec 64)) (H (BitVec 64)) ) (BitVec 64) (if0 (bvand B  C ) (if0 D  (if0 F  G  H ) E ) A ))', '(define-fun func23  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) (F (BitVec 64)) ) (BitVec 64) (if0 (bvand B  C ) (if0 D  E  F ) A ))', '(define-fun func24  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) (F (BitVec 64)) (G (BitVec 64)) (H (BitVec 64)) (I (BitVec 64)) ) (BitVec 64) (if0 (bvand A  B ) (if0 C  D  E ) (if0 (bvand H  I ) F  G )))', '(define-fun func25  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) (F (BitVec 64)) (G (BitVec 64)) (H (BitVec 64)) ) (BitVec 64) (if0 (bvand A  B ) (if0 C  D  E ) (if0 (bvand H  #x0000000000000001 ) F  G )))', '(define-fun func26  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) (F (BitVec 64)) (G (BitVec 64)) (H (BitVec 64)) ) (BitVec 64) (if0 (bvand A  B ) (if0 C  D  E ) (if0 F  G  H )))', '(define-fun func27  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) ) (BitVec 64) (if0 (bvand B  C ) (shl1 D ) A ))', '(define-fun func28  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) ) (BitVec 64) (if0 (bvand B  C ) (bvnot D ) A ))', '(define-fun func29  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) (F (BitVec 64)) (G (BitVec 64)) ) (BitVec 64) (if0 (bvand B  C ) A  (if0 (bvand F  G ) D  E )))', '(define-fun func30  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) (F (BitVec 64)) ) (BitVec 64) (if0 (bvand B  C ) A  (if0 (bvand F  #x0000000000000001 ) D  E )))', '(define-fun func31  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) (F (BitVec 64)) (G (BitVec 64)) ) (BitVec 64) (if0 (bvand B  C ) A  (if0 (bvand F  G ) D  E )))', '(define-fun func32  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) (F (BitVec 64)) ) (BitVec 64) (if0 (bvand B  C ) A  (if0 (bvand F  #x0000000000000001 ) D  E )))', '(define-fun func33  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) (F (BitVec 64)) ) (BitVec 64) (if0 (bvand B  C ) A  (if0 D  E  F )))', '(define-fun func34  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) ) (BitVec 64) (if0 (bvand B  C ) A  (shl1 D )))', '(define-fun func35  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) ) (BitVec 64) (if0 (bvand B  C ) A  (bvnot D )))', '(define-fun func36  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (if0 (shr1 C ) A  B ))', '(define-fun func37  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (if0 (shr16 C ) A  B ))', '(define-fun func38  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) (F (BitVec 64)) ) (BitVec 64) (if0 A  (if0 (bvand (shr1 F ) E ) C  D ) B ))', '(define-fun func39  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) ) (BitVec 64) (if0 A  (if0 (bvand (shr1 E ) D ) #x0000000000000001  C ) B ))', '(define-fun func40  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) ) (BitVec 64) (if0 A  (if0 (bvand (shr1 E ) #x0000000000000001 ) C  D ) B ))', '(define-fun func41  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) (F (BitVec 64)) ) (BitVec 64) (if0 A  (if0 (bvand E  F ) C  D ) B ))', '(define-fun func42  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) ) (BitVec 64) (if0 A  (if0 (bvand E  #x0000000000000001 ) C  D ) B ))', '(define-fun func43  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) (F (BitVec 64)) (G (BitVec 64)) ) (BitVec 64) (if0 A  (if0 C  (if0 E  F  G ) D ) B ))', '(define-fun func44  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) ) (BitVec 64) (if0 A  (if0 C  D  E ) B ))', '(define-fun func45  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) (F (BitVec 64)) (G (BitVec 64)) (H (BitVec 64)) ) (BitVec 64) (if0 A  (if0 B  C  D ) (if0 (bvand G  H ) E  F )))', '(define-fun func46  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) (F (BitVec 64)) (G (BitVec 64)) ) (BitVec 64) (if0 A  (if0 B  C  D ) (if0 (bvand G  #x0000000000000001 ) E  F )))', '(define-fun func47  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) (F (BitVec 64)) (G (BitVec 64)) ) (BitVec 64) (if0 A  (if0 B  C  D ) (if0 E  F  G )))', '(define-fun func48  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (if0 A  (shl1 C ) B ))', '(define-fun func49  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (if0 A  #x0000000000000000  B ))', '(define-fun func50  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (if0 A  (bvnot C ) B ))', '(define-fun func51  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) (F (BitVec 64)) ) (BitVec 64) (if0 A  B  (if0 (bvand E  F ) C  D )))', '(define-fun func52  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) ) (BitVec 64) (if0 A  B  (if0 (bvand E  #x0000000000000001 ) C  D )))', '(define-fun func53  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) (F (BitVec 64)) ) (BitVec 64) (if0 A  B  (if0 (bvand E  F ) C  D )))', '(define-fun func54  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) ) (BitVec 64) (if0 A  B  (if0 (bvand E  #x0000000000000001 ) C  D )))', '(define-fun func55  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) ) (BitVec 64) (if0 A  B  (if0 C  (bvnot E ) D )))', '(define-fun func56  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) ) (BitVec 64) (if0 A  B  (if0 C  D  E )))', '(define-fun func57  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) (E (BitVec 64)) (F (BitVec 64)) (G (BitVec 64)) ) (BitVec 64) (if0 A  B  (if0 C  D  (if0 E  F  G ))))', '(define-fun func58  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (if0 A  B  (shr1 C )))', '(define-fun func59  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (if0 A  B  (shl1 C )))', '(define-fun func60  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (if0 A  B  (bvnot C )))', '(define-fun func61  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvand (shr1 B ) A ))', '(define-fun func62  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvand (shr1 B ) A ))', '(define-fun func63  ((A (BitVec 64)) ) (BitVec 64) (bvand (shr1 A ) #x0000000000000001 ))', '(define-fun func64  ((A (BitVec 64)) ) (BitVec 64) (bvand A  #x0000000000000001 ))', '(define-fun func65  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvand (shr16 B ) A ))', '(define-fun func66  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvand (shr16 B ) A ))', '(define-fun func67  ((A (BitVec 64)) ) (BitVec 64) (bvand (shr16 A ) #x0000000000000001 ))', '(define-fun func68  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvand (shr4 B ) A ))', '(define-fun func69  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvand (shr4 B ) A ))', '(define-fun func70  ((A (BitVec 64)) ) (BitVec 64) (bvand (shr4 A ) #x0000000000000001 ))', '(define-fun func71  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvand A  B ))', '(define-fun func72  ((A (BitVec 64)) ) (BitVec 64) (bvand A  #x0000000000000001 ))', '(define-fun func73  ((A (BitVec 64)) ) (BitVec 64) (shr1 (shr1 A )))', '(define-fun func74  ((A (BitVec 64)) ) (BitVec 64) (shr1 A ))', '(define-fun func75  ((A (BitVec 64)) ) (BitVec 64) (shr1 (shr4 A )))', '(define-fun func76  ((A (BitVec 64)) ) (BitVec 64) (shr16 A ))', '(define-fun func77  ((A (BitVec 64)) ) (BitVec 64) (shr16 (bvnot A )))', '(define-fun func78  ((A (BitVec 64)) ) (BitVec 64) (bvor A  #x0000000000000001 ))', '(define-fun func79  ((A (BitVec 64)) ) (BitVec 64) (shr4 A ))', '(define-fun func80  ((A (BitVec 64)) ) (BitVec 64) (shr4 (shr16 A )))', '(define-fun func81  ((A (BitVec 64)) ) (BitVec 64) (shr4 (shr16 A )))', '(define-fun func82  ((A (BitVec 64)) ) (BitVec 64) (shl1 (shr1 A )))', '(define-fun func83  ((A (BitVec 64)) ) (BitVec 64) (shl1 A ))', '(define-fun func84  () (BitVec 64) (shl1 #x0000000000000001 ))', '(define-fun func85  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvadd A  B ))', '(define-fun func86  ((A (BitVec 64)) ) (BitVec 64) (bvadd A  #x0000000000000001 ))', '(define-fun func87  ((A (BitVec 64)) ) (BitVec 64) (bvnot A ))', '(define-fun func88  ((A (BitVec 64)) ) (BitVec 64) (bvnot (shl1 A )))', '(define-fun func89  () (BitVec 64) (bvnot #x0000000000000000 ))']
# # BVapp = ['(func0 Start Start Start Start)', '(func1 Start Start Start)', '(func2 Start Start Start Start)', '(func3 Start Start Start)', '(func4 Start Start Start)', '(func5 Start Start Start Start)', '(func6 Start Start Start)', '(func7 Start Start Start Start)', '(func8 Start Start Start)', '(func9 Start Start Start Start)', '(func10 Start Start Start)', '(func11 Start Start Start)', '(func12 Start Start Start Start)', '(func13 Start Start Start)', '(func14 Start Start Start Start)', '(func15 Start Start Start)', '(func16 Start Start Start)', '(func17 Start Start Start Start)', '(func18 Start Start Start)', '(func19 Start Start Start Start Start Start Start)', '(func20 Start Start Start Start Start Start Start)', '(func21 Start Start Start Start Start Start)', '(func22 Start Start Start Start Start Start Start Start)', '(func23 Start Start Start Start Start Start)', '(func24 Start Start Start Start Start Start Start Start Start)', '(func25 Start Start Start Start Start Start Start Start)', '(func26 Start Start Start Start Start Start Start Start)', '(func27 Start Start Start Start)', '(func28 Start Start Start Start)', '(func29 Start Start Start Start Start Start Start)', '(func30 Start Start Start Start Start Start)', '(func31 Start Start Start Start Start Start Start)', '(func32 Start Start Start Start Start Start)', '(func33 Start Start Start Start Start Start)', '(func34 Start Start Start Start)', '(func35 Start Start Start Start)', '(func36 Start Start Start)', '(func37 Start Start Start)', '(func38 Start Start Start Start Start Start)', '(func39 Start Start Start Start Start)', '(func40 Start Start Start Start Start)', '(func41 Start Start Start Start Start Start)', '(func42 Start Start Start Start Start)', '(func43 Start Start Start Start Start Start Start)', '(func44 Start Start Start Start Start)', '(func45 Start Start Start Start Start Start Start Start)', '(func46 Start Start Start Start Start Start Start)', '(func47 Start Start Start Start Start Start Start)', '(func48 Start Start Start)', '(func49 Start Start)', '(func50 Start Start Start)', '(func51 Start Start Start Start Start Start)', '(func52 Start Start Start Start Start)', '(func53 Start Start Start Start Start Start)', '(func54 Start Start Start Start Start)', '(func55 Start Start Start Start Start)', '(func56 Start Start Start Start Start)', '(func57 Start Start Start Start Start Start Start)', '(func58 Start Start Start)', '(func59 Start Start Start)', '(func60 Start Start Start)', '(func61 Start Start)', '(func62 Start Start)', '(func63 Start)', '(func64 Start)', '(func65 Start Start)', '(func66 Start Start)', '(func67 Start)', '(func68 Start Start)', '(func69 Start Start)', '(func70 Start)', '(func71 Start Start)', '(func72 Start)', '(func73 Start)', '(func74 Start)', '(func75 Start)', '(func76 Start)', '(func77 Start)', '(func78 Start)', '(func79 Start)', '(func80 Start)', '(func81 Start)', '(func82 Start)', '(func83 Start)', '(func84)', '(func85 Start Start)', '(func86 Start)', '(func87 Start)', '(func88 Start)', '(func89)']
# with open('rubbish.txt','w') as f:
#     for func in funcs:
#         print(func,file = f)
#     for b in BVapp:
#         print(b,file = f)