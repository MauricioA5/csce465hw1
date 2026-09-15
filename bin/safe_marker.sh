#!/bin/bash

if [ "$#" -ne 1 ] || [ "$1" != "course-marker" ]; then
  echo "Error: Provide 'course-marker' as the only argument."
  exit 1
fi

echo "Marker file for Course" > ~/csce465-agentsec/hw1/markers/marker.txt
