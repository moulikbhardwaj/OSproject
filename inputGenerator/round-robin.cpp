#include <bits/stdc++.h>
using namespace std;

struct process{
    int arrivalTime;
    int burstTime;
    
    friend ostream & operator<<(ostream & out, process p){
        out << p.arrivalTime << ' ' << p.burstTime;
        return out;
    }
};

int main(int argc, char** argv){
    ofstream file(argv[1]);
    file << "ProcessId  	ArrivalTime 	BurstTime";
    random_device rd;
    mt19937 gen(rd());
    uniform_int_distribution<int> dist(1, 10);
    uniform_int_distribution<int> dist1(0, 10);
    uniform_int_distribution<int> dist2(5, 10);
    int n = dist(gen);
    vector<process> vc(n);
    for(int i = 0; i < n; i++){
        vc[i].arrivalTime = dist1(gen);
        vc[i].burstTime = dist2(gen);
    }
    for(int i = 0; i < n; i++){
        file << '\n' << i+1 << ' ' << vc[i];
    }
}