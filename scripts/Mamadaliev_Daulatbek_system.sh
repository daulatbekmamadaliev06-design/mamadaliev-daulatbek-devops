#!/bin/bash

echo "=============================="
echo "Student Information"
echo "=============================="
echo "Name: Daulatbek"
echo "Surname: Mamadaliev"
echo "Group: IT-2 2309"
echo "Student ID: 123456"

echo ""
echo "=============================="
echo "System Information"
echo "=============================="

echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date)"
echo "Operating System: $(uname -a)"

echo ""
echo "Disk Usage:"
df -h | head -2

echo ""
echo "Memory Usage:"
free -h

echo ""
if [ -f "Mamadaliev_Daulatbek_info.txt" ]; then
    echo "Student information file exists."
else
    echo "Student information file does not exist."
fi
