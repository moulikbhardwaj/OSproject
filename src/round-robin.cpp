#include <bits/stdc++.h>
using namespace std;

struct Burst{

    string processId;
    double arrivalTime;
    double startTime;
    double endTime;
    mutable double burstTime;
    
    Burst(string processId, double arrivalTime, double burstTime) : processId(processId), arrivalTime(arrivalTime), burstTime(burstTime) {}

    friend bool operator<(Burst a, Burst b){
    if(a.arrivalTime==b.arrivalTime){
        return a.processId < b.processId;
    }    
    return a.arrivalTime < b.arrivalTime;
    }
};

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
            throw string("Invalid File Structure.\n\nFile structure should be \nProcessId   ArrivalTime 	BurstTime\n");
        }
        input >> s;
        if(s!="ArrivalTime"){
            throw string("Invalid File Structure.\n\nFile structure should be \nProcessId  	ArrivalTime 	BurstTime\n");
        }
        input >> s;
        if(s!="BurstTime"){
            throw string("Invalid File Structure.\n\nFile structure should be \nProcessId  	ArrivalTime 	BurstTime\n");
        }
        deque<Burst> data;
        int num = 0;
        while(!input.eof()){
            num++;
            string processId;
            double arrivalTime, burstTime;
            input >> processId >> arrivalTime >> burstTime;
            data.push_back(Burst(processId,arrivalTime,burstTime));
        }
        sort(data.begin(), data.end());
        double curTime = data.front().arrivalTime;

        set<Burst> currentList;
        vector<pair<string,pair<double,double>>> solution;
        double total = 0;
        double achieved = 0;
        for(auto i:data){
            total+=i.burstTime;
        }
        map<string,double> completionTime;
        auto cpy = data;
        while(achieved!=total){
            while(data.size() && curTime>=data.front().arrivalTime){
                currentList.insert(data.front());
                data.pop_front();
            }
            for(auto it = currentList.begin(); it!=currentList.end();){
                achieved++;
                solution.push_back({it->processId, {curTime, curTime+1}});
                curTime++;
                if(it->burstTime==1){
                    completionTime[it->processId] = curTime;
                    it = currentList.erase(it);
                    continue;
                }
                else{
                    it->burstTime--;
                }
                it++;
            }
        }
        data = cpy;
        ofstream output(outputFile, ostream::trunc|ostream::out);
        output << "processId   startTime   endTime\n";
        for(auto i:solution){
            output << i.first << "        " << i.second.first << "        " << i.second.second << '\n';
        }
        double turnAroundTime = 0;
        double totalBurstTime = 0;
        for(auto i:data){
            totalBurstTime+=i.burstTime;
            turnAroundTime+=completionTime[i.processId]-i.arrivalTime;
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