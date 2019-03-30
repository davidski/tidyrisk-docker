all:
  collector evaluator tidyrisk noLD

collector:
  docker build -t davidski/collector:latest .

evaluator:
  docker build -t davidski/evaluator:latest .

tidyrisk:
  docker build -t davidski/tidyrisk:latest .

noLD:
  make -C noLD/ latest

clean:
  make -C collector/ clean
  make -C evaluator/ clean
  make -C tidyrisk/ clean
  make -C noLD/ clean
