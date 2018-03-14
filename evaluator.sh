#!/usr/bin/with-contenv bash

EVALUATOR=${EVALUATOR:=none}

## A script to run Evaluator commands

if [ "$EVALUATOR" == "init" ]; then
  echo "Creating templates..."	
  r --verbose -e 'library(evaluator);create_templates("/data")'
  cd /
  #s6-svc -pt -wU /etc/services.d/rstudio
fi

if [ "$EVALUATOR" == "run" ]; then
  echo "Running analysis..."	
  r --verbose -e 'base_dir <- "/data";source("/data/run_analysis.R", echo=TRUE)'
  cd /
fi

if [ $"$EVALUATOR" == "none" ]; then
  echo "No Evaluator commands to run"
fi

