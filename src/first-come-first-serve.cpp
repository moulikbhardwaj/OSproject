#include <bits/stdc++.h>
#include<fstream>
using namespace std;

const int N=100005;

int n;
struct process
{
    int id;
    int burst_time;
    int arrival_time;
    int waiting_time;
    int finishing_time;
    int turn_around_time;
};
process P[N];


void FCFS()
{   fstream f;
    f.open("output.txt",ios::out);
    while(f)
    {
    
        double total_waiting_time = 0.0;
        double total_turn_around_time = 0.0;
        f<<"processId"<<'\t'<<"startTime"<<'\t'<<"endTime"<<endl;
        for(int i=0; i<n; i++)
        {
            P[i].finishing_time = P[i-1].finishing_time + P[i].burst_time;
            P[i].turn_around_time = P[i].finishing_time - P[i].arrival_time;
            P[i].waiting_time = P[i].turn_around_time - P[i].burst_time;
    
            total_waiting_time += P[i].waiting_time;
            total_turn_around_time += P[i].turn_around_time;
            
            f<<i+1<<'\t'<< P[i-1].finishing_time<<'\t'<<P[i].finishing_time<<endl;
        
            
        }
        
        cout<<fixed<<setprecision(2);
        cout<<"Average Waiting Time: "<<(total_waiting_time/n)<<"\n";
        cout<<"Average Turn Around Time: "<<(total_turn_around_time/n)<<"\n";
    f.close();  
    }
    
    
    
    return;
    
    
}


int main()
{
    cout<<"Number of Processes: ";
    cin>>n;

    cout<<"Process Ids:\n";
    for(int i=0; i<n; i++) cin>>P[i].id;

    cout<<"Process Burst Times:\n";
    for(int i=0; i<n; i++) cin>>P[i].burst_time;

    cout<<"Process Arrival Times:\n";
    for(int i=0; i<n; i++) cin>>P[i].arrival_time;

    FCFS();

    return 0;
}
