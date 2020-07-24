#include <bits/stdc++.h>
using namespace std;

struct process{
    int priority;
    int arrivalTime;
    int burstTime;
    
    friend ostream & operator<<(ostream & out, process p){
        out << p.priority << ' ' << p.arrivalTime << ' ' << p.burstTime;
        return out;
    }
};

int main(int argc, char** argv){
    ofstream file(argv[1]);
    random_device rd;
    mt19937 gen(rd());
    uniform_int_distribution<int> dist(1, 10);
    uniform_int_distribution<int> dist1(0, 100);
    uniform_int_distribution<int> dist2(20, 100);
    uniform_int_distribution<int> dist3(1, 100);
    int n = dist(gen);
    file << n << endl;
    vector<process> vc(n);
    for(int i = 0; i < n; i++){
        vc[i].arrivalTime = dist1(gen);
        vc[i].burstTime = dist2(gen);
        vc[i].priority = dist3(gen);
    }
    for(int i = 0; i < n; i++){
        file << '\n' << i+1 << ' ' << vc[i];
    }
}