#include "Vgb.h"
#include "Vgb_gb.h"
#include "verilated.h"
#include <stdint.h>

int main (int argc, char** argv, char** env) {
	Verilated::commandArgs(argc, argv);

	Vgb* top = new Vgb;

	uint64_t clkCount = 0;

	top->clk = 0;
	top->eval();

	while (!Verilated::gotFinish()) {
		top->clk = !top->clk;
		top->eval();
		top->clk = !top->clk;
		top->eval();
		clkCount++;
		printf("[%lu] Toggle is now %i\n", clkCount, top->gb->toggled);
	}

	delete top;
	return 0;
}
