#include <bits/stdc++.h>
using namespace std;

struct Burst{

    string processId;
    double arrivalTime;
    double startTime;
    double endTime;
    double priority;
    double burstTime;

    Burst(string processId, double priority, double arrivalTime, double burstTime) : processId(processId), arrivalTime(arrivalTime), priority(priority), burstTime(burstTime) {}

    friend bool operator<(Burst a, Burst b){
        if(a.priority ==b.priority){
            if(a.arrivalTime==b.arrivalTime){
                return a.burstTime<b.burstTime;
            }
            return a.arrivalTime<b.arrivalTime;
        }
        return a.priority<b.priority;
    }
    friend bool byArrivalTime(Burst a, Burst b);
};

bool byArrivalTime(Burst a, Burst b){
    if(a.arrivalTime==b.arrivalTime){
            if(a.priority==b.priority){
                return a.burstTime < b.burstTime;
            }
            return a.priority < b.priority;
        }    
        return a.arrivalTime < b.arrivalTime;
    }

int main(int argc, char** argv){
    string inputFile = "input.txt";
    string outputFile = "output.txt";
    if(argc==1){}
    else if(argc==2){
        if(argv[1]=="-h"s || argv[1]=="--help"s){
            printf("usage: %s [-h] [inputFile] [outputFile]\n\nProgram for CPU Scheduling, following Non Preemptive Priority Scheduling method.\n\npositional arguements: inputFile outputFile\n\noptional arguements: -h, --help show this help message and exit\n", argv[0]);
            return 0;
        }
        inputFile=argv[1];
    }
    else if(argc==3){
        inputFile=argv[1];
        outputFile=argv[2];
    }
    else{
        printf("usage: %s [-h] [inputFile] [outputFile]\n\nProgram for CPU Scheduling, following Non Preemptive Priority Scheduling method.\n\npositional arguements: inputFile outputFile\n\noptional arguements: -h, --help show this help message and exit\n", argv[0]);
        return 1;
    }
    ifstream input;
    try{
        input.open(inputFile);
        if(input.fail()){
            throw "Invalid file " + inputFile + "\n";
        }
        string s;
        input >> s;
        if(s!="ProcessId"){
            throw string("Invalid File Structure.\n\nFile structure should be \nProcessId 	Priority 	ArrivalTime 	BurstTime\n");
        }
        input >> s;
        if(s!="Priority"){
            throw string("Invalid File Structure.\n\nFile structure should be \nProcessId 	Priority 	ArrivalTime 	BurstTime\n");
        }
        input >> s;
        if(s!="ArrivalTime"){
            throw string("Invalid File Structure.\n\nFile structure should be \nProcessId 	Priority 	ArrivalTime 	BurstTime\n");
        }
        input >> s;
        if(s!="BurstTime"){
            throw string("Invalid File Structure.\n\nFile structure should be \nProcessId 	Priority 	ArrivalTime 	BurstTime\n");
        }
        priority_queue<Burst> pq;
        deque<Burst> data;
        int num = 0;
        map<string,int> completionTime;
        while(!input.eof()){
            num++;
            string processId;
            double priority, arrivalTime, burstTime;
            input >> processId >> priority >> arrivalTime >> burstTime;
            data.push_back(Burst(processId,priority,arrivalTime,burstTime));
            char c = input.get();
            if(input.eof()){break;}
        }
        sort(data.begin(), data.end(), byArrivalTime);
        double curTime = data.front().arrivalTime;
        vector<Burst> solution;
        while(data.size()){
            while(data.size() && data.front().arrivalTime<=curTime){
                pq.push(data.front());
                data.pop_front();
            }
            if(pq.size()==0){
                curTime=data.front().arrivalTime;
                continue;
            }
            solution.push_back(pq.top());
            pq.pop();
            solution.back().startTime=curTime;
            solution.back().endTime=curTime+solution.back().burstTime;
            curTime=solution.back().endTime;
        }
        while(pq.size()){
            solution.push_back(pq.top());
            pq.pop();
            solution.back().startTime=curTime;
            solution.back().endTime=curTime+solution.back().burstTime;
            curTime=solution.back().endTime;
        }
        ofstream output(outputFile, ostream::trunc|ostream::out);
        output << "processId   startTime   endTime\n";
        for(auto i:solution){
            output << i.processId << "        " << i.startTime << "        " << i.endTime << '\n';
        }
        double turnAroundTime = 0;
        double totalBurstTime = 0;

        for(auto i:solution){
            totalBurstTime+=i.burstTime;
            turnAroundTime+=i.endTime-i.arrivalTime;
        }
        cout << "Total time taken: " << curTime << " ms" << endl;
        cout << "Throughput: " << 1000.0/curTime*num << " jobs per second" << endl;
        cout << "Average Turn around time: " << turnAroundTime/num << " ms" << endl;
        cout << "Average Waiting Time: " << (turnAroundTime-totalBurstTime)/num << " ms" << endl;
        cout << "Average Elapsed Time: " << curTime/num << " ms" << endl;
    }catch(string err){
        printf("%s", err.c_str());
    }
}