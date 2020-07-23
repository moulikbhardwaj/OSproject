#include <bits/stdc++.h>
using namespace std;

struct process{
    int arrivalTime;
    int burstTime;
};

int main(int argc, char** argv){
    ofstream file(argv[1]);
    random_device rd;
    mt19937 gen(rd());
    uniform_int_distribution<int> dist(1, 50);
    uniform_int_distribution<int> dist1(0, 100);
    uniform_int_distribution<int> dist2(20, 100);
    int n = dist(gen);
    file << n << endl;
    vector<process> vc(n);
    for(int i = 0; i < n; i++){
        vc[i].arrivalTime = dist1(gen);
        vc[i].burstTime = dist2(gen);
    }
    for(int i = 0; i < n; i++){
        file <<  i+1 << '\n';
    }
    for(int i = 0; i < n; i++){
        file <<  vc[i].arrivalTime << '\n';
    }
    for(int i = 0; i < n; i++){
        file <<  vc[i].burstTime << '\n';
    }
}