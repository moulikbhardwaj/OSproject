//sjf cpu scheduling

#include <iostream>
#include <string.h>
#include <fstream>
using namespace std;
int nextShortest(int *arr, int n)
{
    int pos = 0;
    int min = 100000;

    for (int i = 0; i < n; i++)
        if (arr[i] < min)
        {
            if (arr[i] != 0)
            {
                min = arr[i];
                pos = i;
            }
        }

    return pos;
}

int main()
{
    int n;
    cout << "Enter the number of processes: " << endl;
    cin >> n;
    int time = 0;
    int waitingTime = 0;
    int prev = 0;
    int burst[n];
    ofstream output("output.txt");
    string seq = "";
    cout << "Enter the burst time of the processes: " << endl;
    for (int i = 0; i < n; i++)
    {
        cin >> burst[i];
    }
    output << "processId startTime endTime\n";
    for (int i = 0; i < n; i++)
    {

        output << nextShortest(burst, n) + 1 << "\t";
        output << time << "\t";
        waitingTime += time;
        time += burst[nextShortest(burst, n)];
        output << time << "\n";
        burst[nextShortest(burst, n)] = 0;
        prev = nextShortest(burst, n);
    }
    cout << "Total Time: " << time << endl;
    cout << "Average waiting Time: " << (float)waitingTime / n << endl;
    cout << "Throughput: " << (float)n / time << endl;
    return 0;
}