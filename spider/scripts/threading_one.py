'''a program to selling ticks'''

import threading
import time
import os

I = 1000
LOCK = threading.Lock()

def do_other():
    '''this func could be any func to do other works.'''
    time.sleep(0.5)

def booth(threads):
    '''func for each thread'''
    global I
    global LOCK
    while True:
#        LOCK.acquire()
        if I != 0:
            I -= 1
            print(threads, ':now left:', I)
            do_other()
        else:
            print(threads, 'no more tickets')
            os._exit(0)
#        LOCK.release()
        do_other()

for k in range(10):
    newThread = threading.Thread(target=booth, args=(k, ))
    newThread.start()
