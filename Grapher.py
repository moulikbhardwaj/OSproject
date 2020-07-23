#! /bin/python3
import warnings
import matplotlib.pyplot as plt
from numpy.random import rand
import argparse

warnings.filterwarnings("ignore")

parser = argparse.ArgumentParser(description="Plots a simple Gantt Chard from output file made by CPU schedulers")
parser.add_argument('dataFile', type=str, nargs='?', default='output.txt')
parser.add_argument('-s', '--save_figure', action="store_true", help="Save figure rather than displaying output")
parser.add_argument('outputFile', type=str, nargs='?')

args = parser.parse_args()

WIDTH = 5

class Burst():
    def __init__(self, processId):
        self.startTimes= list()
        self.endTimes= list()
        self.processId=str(processId)
    
    def addBurst(self, startTime, endTime):
        self.startTimes.append(int(startTime))
        self.endTimes.append(int(endTime))

    def rangeTouples(self):
        return [(i,j-i) for i,j in zip(self.startTimes, self.endTimes)]

    def __str__(self):
        return "Burst with pid: "+self.processId
    def __repr__(self):
        return "Burst with pid: "+self.processId

    def __lt__(self, other):
        return self.processId < other.processId

class Graph():
    def __init__(self, inputFile):
        with open(inputFile) as file:
            contents = file.readline().rstrip().split()
            if contents.__len__()!=3:
                raise Exception("Error, Invalid Syntax")
            if contents[0]!="processId":
                raise Exception("Error, Invalid Syntax")
            if contents[1]!="startTime":
                raise Exception("Error, Invalid Syntax")
            if contents[2]!="endTime":
                raise Exception("Error, Invalid Syntax")

            diction = dict()
            mx = -1
            for dt in file:
                dt = dt.rstrip('\n').split()
                if(len(dt)!=3):
                    raise Exception(dt)
                if not str(dt[0]) in diction:
                    diction[str(dt[0])] = Burst(dt[0])
                diction[str(dt[0])].addBurst(dt[1],dt[2])
                mx = max(mx,int(dt[2]))
            diction = dict(sorted(diction.items(), key=lambda item: int(item[0])))
            fig, gnt = plt.subplots()
            gnt.set_ylim(0, len(diction)*WIDTH+WIDTH)
            gnt.set_xlim(0,mx*1.1)
            gnt.set_xlabel('time since start(ms)')
            gnt.set_ylabel('Process ID')

            gnt.grid(True)
            
            gnt.set_yticks(range(5,len(diction)*WIDTH+WIDTH,WIDTH))
            gnt.set_yticklabels([diction[i].processId for i in diction])
            idx = 1
            xtk=[]
            for i in diction:
                gnt.broken_barh(diction[i].rangeTouples(),((idx*WIDTH)-WIDTH/2,WIDTH), facecolor=rand(3,))
                for j in diction[i].rangeTouples():
                    xtk.append(j[0])
                    xtk.append(j[0]+j[1])
                idx+=1
            gnt.set_xticks(xtk)
            for label in gnt.get_xticklabels():
                label.set_rotation('vertical')
                label.set_fontsize('x-small')
            if(args.save_figure):
                plt.savefig(args.outputFile)
            else:
                plt.show()

if __name__ == "__main__":
    Graph(args.dataFile)