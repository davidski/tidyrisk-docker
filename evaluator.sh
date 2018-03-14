#!/usr/bin/with-contenv bash

EVALUATOR=${EVALUATOR:=none}

## A script to run Evaluator commands

if [ "$EVALUATOR" == "init" ]; then
  echo "Creating templates..."	
    r --verbose -e 'library(evaluator);create_templates("/data")' &
    cd /
fi

if [ "$EVALUATOR" == "run" ]; then
  echo "Running analysis..."	
    Rscript -e 'base_dir <- "/data";source("/data/run_analysis.R")' &
    cd /
fi

if [ $"$EVALUATOR" == "none" ]; then
  echo "No Evaluator commands to run"
fi

