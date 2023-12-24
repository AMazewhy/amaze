#写脚本activate py368然后跑eusolver？
#方法3: os.system('bash -c "source /home/citceae/anaconda3/etc/profile.d/conda.sh && conda activate py368 && " + ') 最保险的方法，暂时没有发现问题
#bash激活然后运行
#./eusolver_bash /home/ztye/experiments/obestring/0/DSL/eusolver-main/benchmarks/icfp/icfp_5_1000.sl > rubbish.txt

import os
# filename = "/home/ztye/experiments/obestring/0/DSL/benchmark_bv/icfp_5_1000.sl"
# outputname = "/home/ztye/experiments/obestring/0/DSL/trainsetForbv/icfp_5_1000.out"
# cmdline = 'bash -c "/home/ztye/experiments/obestring/0/DSL/eusolver_bash {} > {}"'.format(filename,outputname)
# os.system(cmdline)
#以上可以调用eusolver获得输出

def runbash(filename, outputname):
     #TODO:这个带时间的output用于求加速比 分离出其中（前两行）的解用于追加>>写入trainsetForbv中
    cmdline = 'timeout {} bash -c "/home/ztye/experiments/obestring/0/DSL/eusolver_bash {} > {}"'.format(300,filename,outputname) #前面加上timeout 300可行好像也没问题
    print(cmdline)
    os.system(cmdline)
    # quit()

filepath = "/home/ztye/experiments/obestring/0/DSL/benchmark_bv/"
outputpath = "/home/ztye/experiments/obestring/0/DSL/src_bv/fulloutput/"#以后应该是append？
filesname = os.listdir(filepath)
for fname in filesname:
    filename = filepath + fname
    outputname = outputpath + fname[:-3] + '.out' #路径应当修改 区分出求加速比的过程和只需要获取解的过程
    runbash(filename,outputname)

#TODO：对着整个string的流程 改写对应于bv的需要 如node相关
#部分结论：可以用define-fun嵌套 因为bv已经有一些define-fun如shl1，可以定义shl1 (shl1 x)，只需保证定义在shl1声明之后 不过初步观测没有看到明显的加速效果
#所有BV的输入文法好像都是一模一样的？
'''
【重要】refined_freq中的node编码
【重要】bv的估计最小解也需要重写
算法过程对应

traingen：由maxflash batched synthsis得到；由于eusolver或者通用的表达式可能没有这一项，改用求解器本身求解单个解 后续每次得到新的解时追加 TODO：改动整体的算法逻辑
getprogdict:将所有挖掘用程序转换为sleuth要求的前序树形式 DONE
sleuth的挖掘频繁模式：getprogdict处理了eusolver解的格式和原来其他求解器解的格式不一致的问题 （逗号分隔和空格分隔、括号的使用等） 该功能不受影响（挖掘数量下降很多）时间反而变慢了是错觉吗


tobetest：
getfnins_withidx：将挖掘得到的频繁模式翻译为可以加入到文法中的函数和对应产生式的形式 DONE #TODO:把shr，shl，if0翻译到原始版本(待定)
gethtsi:获取每一个文件的header，tailer，const等 bv里可以简化只需要记录constraint即可（其他都是一样的）DONE
createfile:根据得到的频繁模式和每一个task的信息构造出新文法对应的task bv里简化许多 DONE

get_real_ratio:根据输出文件的格式更改
create_csv:依赖于ISTool1024的run_sygus获取feature TODO：run_sygus有依赖于string的实现需要大量改动 主要工作量在这里 plan1 DONE

'''


    



