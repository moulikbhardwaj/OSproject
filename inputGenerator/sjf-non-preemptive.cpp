#include <bits/stdc++.h>
using namespace std;

struct process{
    int burstTime;
};

int main(int argc, char** argv){
    ofstream file(argv[1]);
    srand(time(NULL));
    random_device rd;
    mt19937 gen(rd());
    uniform_int_distribution<int> dist(1, 50);
    uniform_int_distribution<int> dist1(20, 100);
    int n = dist(gen);
    file << n << endl;
    vector<process> vc(n);
    for(int i = 0; i < n; i++){
        vc[i].burstTime = dist1(gen);
    }
    for(int i = 0; i < n; i++){
        file <<  vc[i].burstTime << '\n';
    }
}