all: compile FCFS SJF-Preemptive SJF-Non-Preemptive Priority-preemptive Priority-non-preemptive Round-Robin

execute: FCFS SJF-Preemptive SJF-Non-Preemptive Priority-preemptive Priority-non-preemptive Round-Robin

compile:
	g++ ./src/first-come-first-serve.cpp -o ./bin/first-come-first-serve.out
	g++ ./src/shortest-job-first-preemptive.cpp -o ./bin/shortest-job-first-preemptive.out
	g++ ./src/shortest-job-first-non-preemptive.cpp -o ./bin/shortest-job-first-non-preemptive.out
	g++ ./src/preemptive-priority.cpp -o ./bin/preemptive-priority.out
	g++ ./src/non-preemptive-priority.cpp -o ./bin/non-preemptive-priority.out
	g++ ./src/round-robin.cpp -o ./bin/round-robin.out

	g++ ./inputGenerator/fcfs.cpp -o ./inputGenerator/fcfs
	g++ ./inputGenerator/priority-preemptive.cpp -o ./inputGenerator/priority-preemptive
	g++ ./inputGenerator/priority-non-preemptive.cpp -o ./inputGenerator/priority-non-preemptive
	g++ ./inputGenerator/sjf-preemptive.cpp -o ./inputGenerator/sjf-preemptive
	g++ ./inputGenerator/sjf-non-preemptive.cpp -o ./inputGenerator/sjf-non-preemptive
	g++ ./inputGenerator/round-robin.cpp -o ./inputGenerator/round-robin

FCFS:
	@echo "FCFS"
	@echo "Number 1:"
	@./bin/first-come-first-serve.out < ./data/first-come-first-serve/inputs/1.txt
	@mv ./output.txt ./data/first-come-first-serve/outputs/1.txt 
	@./Grapher.py -s ./data/first-come-first-serve/outputs/1.txt ./data/first-come-first-serve/outputs/1.png
	@echo ""
	@echo ""

	@echo "Number 2:"
	@./bin/first-come-first-serve.out < ./data/first-come-first-serve/inputs/2.txt 
	@mv ./output.txt ./data/first-come-first-serve/outputs/2.txt 
	@./Grapher.py -s ./data/first-come-first-serve/outputs/2.txt ./data/first-come-first-serve/outputs/2.png
	@echo ""
	@echo ""

	@echo "Number 3:"
	@./bin/first-come-first-serve.out < ./data/first-come-first-serve/inputs/3.txt 
	@mv ./output.txt ./data/first-come-first-serve/outputs/3.txt 
	@./Grapher.py -s ./data/first-come-first-serve/outputs/3.txt ./data/first-come-first-serve/outputs/3.png
	@echo ""
	@echo ""

	@echo "Number 4:"
	@./bin/first-come-first-serve.out < ./data/first-come-first-serve/inputs/4.txt 
	@mv ./output.txt ./data/first-come-first-serve/outputs/4.txt 
	@./Grapher.py -s ./data/first-come-first-serve/outputs/4.txt ./data/first-come-first-serve/outputs/4.png
	@echo ""
	@echo ""

	@echo "Number 5:"
	@./bin/first-come-first-serve.out < ./data/first-come-first-serve/inputs/5.txt 
	@mv ./output.txt ./data/first-come-first-serve/outputs/5.txt 
	@./Grapher.py -s ./data/first-come-first-serve/outputs/5.txt ./data/first-come-first-serve/outputs/5.png
	@echo ""
	@echo ""

SJF-Preemptive:
	@echo "SJF-Preemptive"
	@echo "Number 1:"
	@./bin/shortest-job-first-preemptive.out < ./data/shortest-job-first-preemptive/inputs/1.txt
	@mv ./output.txt ./data/shortest-job-first-preemptive/outputs/1.txt 
	@./Grapher.py -s ./data/shortest-job-first-preemptive/outputs/1.txt ./data/shortest-job-first-preemptive/outputs/1.png
	@echo ""
	@echo ""

	@echo "Number 2:"
	@./bin/shortest-job-first-preemptive.out < ./data/shortest-job-first-preemptive/inputs/2.txt 
	@mv ./output.txt ./data/shortest-job-first-preemptive/outputs/2.txt 
	@./Grapher.py -s ./data/shortest-job-first-preemptive/outputs/2.txt ./data/shortest-job-first-preemptive/outputs/2.png
	@echo ""
	@echo ""

	@echo "Number 3:"
	@./bin/shortest-job-first-preemptive.out < ./data/shortest-job-first-preemptive/inputs/3.txt 
	@mv ./output.txt ./data/shortest-job-first-preemptive/outputs/3.txt 
	@./Grapher.py -s ./data/shortest-job-first-preemptive/outputs/3.txt ./data/shortest-job-first-preemptive/outputs/3.png
	@echo ""
	@echo ""

	@echo "Number 4:"
	@./bin/shortest-job-first-preemptive.out < ./data/shortest-job-first-preemptive/inputs/4.txt 
	@mv ./output.txt ./data/shortest-job-first-preemptive/outputs/4.txt 
	@./Grapher.py -s ./data/shortest-job-first-preemptive/outputs/4.txt ./data/shortest-job-first-preemptive/outputs/4.png
	@echo ""
	@echo ""

	@echo "Number 5:"
	@./bin/shortest-job-first-preemptive.out < ./data/shortest-job-first-preemptive/inputs/5.txt 
	@mv ./output.txt ./data/shortest-job-first-preemptive/outputs/5.txt 
	@./Grapher.py -s ./data/shortest-job-first-preemptive/outputs/5.txt ./data/shortest-job-first-preemptive/outputs/5.png
	@echo ""
	@echo ""

SJF-Non-Preemptive:
	@echo "SJF-Non-Preemptive"
	@echo "Number 1:"
	@./bin/shortest-job-first-non-preemptive.out < ./data/shortest-job-first-non-preemptive/inputs/1.txt
	@mv ./output.txt ./data/shortest-job-first-non-preemptive/outputs/1.txt 
	@./Grapher.py -s ./data/shortest-job-first-non-preemptive/outputs/1.txt ./data/shortest-job-first-non-preemptive/outputs/1.png
	@echo ""
	@echo ""

	@echo "Number 2:"
	@./bin/shortest-job-first-non-preemptive.out < ./data/shortest-job-first-non-preemptive/inputs/2.txt 
	@mv ./output.txt ./data/shortest-job-first-non-preemptive/outputs/2.txt 
	@./Grapher.py -s ./data/shortest-job-first-non-preemptive/outputs/2.txt ./data/shortest-job-first-non-preemptive/outputs/2.png
	@echo ""
	@echo ""

	@echo "Number 3:"
	@./bin/shortest-job-first-non-preemptive.out < ./data/shortest-job-first-non-preemptive/inputs/3.txt 
	@mv ./output.txt ./data/shortest-job-first-non-preemptive/outputs/3.txt 
	@./Grapher.py -s ./data/shortest-job-first-non-preemptive/outputs/3.txt ./data/shortest-job-first-non-preemptive/outputs/3.png
	@echo ""
	@echo ""

	@echo "Number 4:"
	@./bin/shortest-job-first-non-preemptive.out < ./data/shortest-job-first-non-preemptive/inputs/4.txt 
	@mv ./output.txt ./data/shortest-job-first-non-preemptive/outputs/4.txt 
	@./Grapher.py -s ./data/shortest-job-first-non-preemptive/outputs/4.txt ./data/shortest-job-first-non-preemptive/outputs/4.png
	@echo ""
	@echo ""

	@echo "Number 5:"
	@./bin/shortest-job-first-non-preemptive.out < ./data/shortest-job-first-non-preemptive/inputs/5.txt 
	@mv ./output.txt ./data/shortest-job-first-non-preemptive/outputs/5.txt 
	@./Grapher.py -s ./data/shortest-job-first-non-preemptive/outputs/5.txt ./data/shortest-job-first-non-preemptive/outputs/5.png
	@echo ""
	@echo ""

Priority-preemptive:
	@echo "Priority-Preemptive"
	@echo "Number 1:"
	@./bin/preemptive-priority.out < ./data/preemptive-priority/inputs/1.txt
	@mv ./output.txt ./data/preemptive-priority/outputs/1.txt 
	@./Grapher.py -s ./data/preemptive-priority/outputs/1.txt ./data/preemptive-priority/outputs/1.png
	@echo ""
	@echo ""

	@echo "Number 2:"
	@./bin/preemptive-priority.out < ./data/preemptive-priority/inputs/2.txt
	@mv ./output.txt ./data/preemptive-priority/outputs/2.txt 
	@./Grapher.py -s ./data/preemptive-priority/outputs/2.txt ./data/preemptive-priority/outputs/2.png
	@echo ""
	@echo ""

	@echo "Number 3:"
	@./bin/preemptive-priority.out < ./data/preemptive-priority/inputs/3.txt
	@mv ./output.txt ./data/preemptive-priority/outputs/3.txt 
	@./Grapher.py -s ./data/preemptive-priority/outputs/3.txt ./data/preemptive-priority/outputs/3.png
	@echo ""
	@echo ""

	@echo "Number 4:"
	@./bin/preemptive-priority.out < ./data/preemptive-priority/inputs/4.txt
	@mv ./output.txt ./data/preemptive-priority/outputs/4.txt 
	@./Grapher.py -s ./data/preemptive-priority/outputs/4.txt ./data/preemptive-priority/outputs/4.png
	@echo ""
	@echo ""

	@echo "Number 5:"
	@./bin/preemptive-priority.out < ./data/preemptive-priority/inputs/5.txt
	@mv ./output.txt ./data/preemptive-priority/outputs/5.txt 
	@./Grapher.py -s ./data/preemptive-priority/outputs/5.txt ./data/preemptive-priority/outputs/5.png
	@echo ""
	@echo ""

Priority-non-preemptive:
	@echo "Priority-Non-Preemptive"
	@echo "Number 1:"
	@./bin/non-preemptive-priority.out ./data/non-preemptive-priority/inputs/1.txt
	@mv ./output.txt ./data/non-preemptive-priority/outputs/1.txt 
	@./Grapher.py -s ./data/non-preemptive-priority/outputs/1.txt ./data/non-preemptive-priority/outputs/1.png
	@echo ""
	@echo ""

	@echo "Number 2:"
	@./bin/non-preemptive-priority.out ./data/non-preemptive-priority/inputs/2.txt
	@mv ./output.txt ./data/non-preemptive-priority/outputs/2.txt 
	@./Grapher.py -s ./data/non-preemptive-priority/outputs/2.txt ./data/non-preemptive-priority/outputs/2.png
	@echo ""
	@echo ""

	@echo "Number 3:"
	@./bin/non-preemptive-priority.out ./data/non-preemptive-priority/inputs/3.txt
	@mv ./output.txt ./data/non-preemptive-priority/outputs/3.txt 
	@./Grapher.py -s ./data/non-preemptive-priority/outputs/3.txt ./data/non-preemptive-priority/outputs/3.png
	@echo ""
	@echo ""

	@echo "Number 4:"
	@./bin/non-preemptive-priority.out ./data/non-preemptive-priority/inputs/4.txt
	@mv ./output.txt ./data/non-preemptive-priority/outputs/4.txt 
	@./Grapher.py -s ./data/non-preemptive-priority/outputs/4.txt ./data/non-preemptive-priority/outputs/4.png
	@echo ""
	@echo ""

	@echo "Number 5:"
	@./bin/non-preemptive-priority.out ./data/non-preemptive-priority/inputs/5.txt
	@mv ./output.txt ./data/non-preemptive-priority/outputs/5.txt 
	@./Grapher.py -s ./data/non-preemptive-priority/outputs/5.txt ./data/non-preemptive-priority/outputs/5.png
	@echo ""
	@echo ""

Round-Robin:
	@echo "Round-Robin"
	@echo "Number 1:"
	@./bin/round-robin.out ./data/round-robin/inputs/1.txt
	@mv ./output.txt ./data/round-robin/outputs/1.txt 
	@./Grapher.py -s ./data/round-robin/outputs/1.txt ./data/round-robin/outputs/1.png
	@echo ""
	@echo ""

	@echo "Number 2:"
	@./bin/round-robin.out ./data/round-robin/inputs/2.txt
	@mv ./output.txt ./data/round-robin/outputs/2.txt 
	@./Grapher.py -s ./data/round-robin/outputs/2.txt ./data/round-robin/outputs/2.png
	@echo ""
	@echo ""

	@echo "Number 3:"
	@./bin/round-robin.out ./data/round-robin/inputs/3.txt
	@mv ./output.txt ./data/round-robin/outputs/3.txt 
	@./Grapher.py -s ./data/round-robin/outputs/3.txt ./data/round-robin/outputs/3.png
	@echo ""
	@echo ""

	@echo "Number 4:"
	@./bin/round-robin.out ./data/round-robin/inputs/4.txt
	@mv ./output.txt ./data/round-robin/outputs/4.txt 
	@./Grapher.py -s ./data/round-robin/outputs/4.txt ./data/round-robin/outputs/4.png
	@echo ""
	@echo ""

	@echo "Number 5:"
	@./bin/round-robin.out ./data/round-robin/inputs/5.txt
	@mv ./output.txt ./data/round-robin/outputs/5.txt 
	@./Grapher.py -s ./data/round-robin/outputs/5.txt ./data/round-robin/outputs/5.png
	@echo ""
	@echo ""


Inputs:
#FCFS
	./inputGenerator/fcfs ./data/first-come-first-serve/inputs/1.txt
	./inputGenerator/fcfs ./data/first-come-first-serve/inputs/2.txt
	./inputGenerator/fcfs ./data/first-come-first-serve/inputs/3.txt
	./inputGenerator/fcfs ./data/first-come-first-serve/inputs/4.txt
	./inputGenerator/fcfs ./data/first-come-first-serve/inputs/5.txt

#SJF-P
	./inputGenerator/sjf-preemptive ./data/shortest-job-first-preemptive/inputs/1.txt
	./inputGenerator/sjf-preemptive ./data/shortest-job-first-preemptive/inputs/2.txt
	./inputGenerator/sjf-preemptive ./data/shortest-job-first-preemptive/inputs/3.txt
	./inputGenerator/sjf-preemptive ./data/shortest-job-first-preemptive/inputs/4.txt
	./inputGenerator/sjf-preemptive ./data/shortest-job-first-preemptive/inputs/5.txt

#SJF-NP
	./inputGenerator/sjf-non-preemptive ./data/shortest-job-first-non-preemptive/inputs/1.txt
	./inputGenerator/sjf-non-preemptive ./data/shortest-job-first-non-preemptive/inputs/2.txt
	./inputGenerator/sjf-non-preemptive ./data/shortest-job-first-non-preemptive/inputs/3.txt
	./inputGenerator/sjf-non-preemptive ./data/shortest-job-first-non-preemptive/inputs/4.txt
	./inputGenerator/sjf-non-preemptive ./data/shortest-job-first-non-preemptive/inputs/5.txt

#priority-preemptive
	./inputGenerator/priority-preemptive ./data/preemptive-priority/inputs/1.txt
	./inputGenerator/priority-preemptive ./data/preemptive-priority/inputs/2.txt
	./inputGenerator/priority-preemptive ./data/preemptive-priority/inputs/3.txt
	./inputGenerator/priority-preemptive ./data/preemptive-priority/inputs/4.txt
	./inputGenerator/priority-preemptive ./data/preemptive-priority/inputs/5.txt
	
#priority-non-preemptive
	./inputGenerator/priority-non-preemptive ./data/non-preemptive-priority/inputs/1.txt
	./inputGenerator/priority-non-preemptive ./data/non-preemptive-priority/inputs/2.txt
	./inputGenerator/priority-non-preemptive ./data/non-preemptive-priority/inputs/3.txt
	./inputGenerator/priority-non-preemptive ./data/non-preemptive-priority/inputs/4.txt
	./inputGenerator/priority-non-preemptive ./data/non-preemptive-priority/inputs/5.txt
	
#round-robin
	./inputGenerator/round-robin ./data/round-robin/inputs/1.txt
	./inputGenerator/round-robin ./data/round-robin/inputs/2.txt
	./inputGenerator/round-robin ./data/round-robin/inputs/3.txt
	./inputGenerator/round-robin ./data/round-robin/inputs/4.txt
	./inputGenerator/round-robin ./data/round-robin/inputs/5.txt
	
clean:
	rm -f ./bin/*
	rm -f ./data/*/outputs/*
	rm -f ./inputGenerator/fcfs
	rm -f ./inputGenerator/sjf-non-preemptive
	rm -f ./inputGenerator/sjf-preemptive
	rm -f ./inputGenerator/priority-preemptive
	rm -f ./inputGenerator/priority-non-preemptive
	rm -f ./inputGenerator/round-robin
