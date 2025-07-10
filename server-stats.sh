#!/bin/bash
top -b -n 1 | grep %Cpu | awk '{print 100 - $8}'
