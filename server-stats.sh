#!/bin/bash
echo "==================="
echo "Server Info Utility"
echo "==================="
echo "\n"
echo "CPU usage:"
top -b -n 1 | grep %Cpu | awk '{gsub(/,/, ", ");print 100 - $8}'
echo "\n"
echo "Memory usage:"
free -h | awk 'NR==2 {print "Free Mem: "$7", Used Mem: "$3" Usage percent: "$3/$2*100"%"}'
echo "\n"
echo "Disk usage:"
df -h
echo "\n"
echo "Processes using most CPU:"
ps -eo pid,%cpu,cmd --sort=-%cpu | head -n 6 | awk '{sub(/CMD/,"Command")}1'
echo "\n"
echo "Processes using most memory:"
ps -eo pid,%mem,cmd --sort=-%mem | head -n 6 | awk '{sub(/CMD/,"Command")}1'
