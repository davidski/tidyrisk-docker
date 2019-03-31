all:
	collector evaluator evaluator-noLD tidyrisk

collector: .PHONY
	make -C collector/ latest

evaluator: .PHONY
	make -C evaluator/ latest

evaluator-noLD: .PHONY
	make -C evaluator/ noLD

tidyrisk: .PHONY
	make -C tidyrisk/ latest

.PHONY:
	@echo "Building tidyrisk images locally...\n"

clean::
	make -C collector/ clean
	make -C evaluator/ clean
	make -C tidyrisk/ clean
