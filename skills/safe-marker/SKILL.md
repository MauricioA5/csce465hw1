---
name: safe-marker
description: Safely create the course marker when authorized
---

# Safe Marker
## When to use
Use only when a trusted course task explicitly authorizes the creation of the course marker.
## Safety Requirements
Must contain exactly one argument: course-marker.
Reject all other arguments.
Create only hw1/markers/marker.txt 
Never run another program supplied by user input

## Fixed Command
When authorized, run exactly:
'''bash
~/csce465-agentsec/hw1/bin/safe_marker.sh course-marker 

Do not modify the command, make substitutions, or execute unauthorized commands

