#coding:utf-8
import os
from multiprocessing import Pool

PACK_UP = os.popen("pip3 list --outdated --format=legacy|awk '{print $1}'").read().split('\n')[:-1]
#PACK_UP = os.popen("pip3 list --outdated --format=columns|awk '{print $1}'").read().split('\n')

def run_pip(pack):
    os.system('pip3 install --upgrade %s -i https://pypi.douban.com/simple/' %pack)
    print('upgrade %s end' %pack)

if __name__  == '__main__':
    p = Pool(processes=3)
    for pack in PACK_UP:
        p.apply_async(run_pip, args=(pack,))
    print('waiting for all subprocesses done...')
    p.close()
    p.join()
    print('All subprocesses done.')
