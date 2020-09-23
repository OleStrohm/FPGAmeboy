VERILOG_TOP = gb.v
VERILOGSOURCES = $(VERILOG_TOP)
CPPSOURCES = sim.cpp

all: $(VERILOGSOURCES) $(CPPSOURCES)
	verilator -Wall --cc $(VERILOG_TOP) --exe --build $(CPPSOURCES)

release: $(VERILOGSOURCES) $(CPPSOURCES)
	verilator -Wall -O3 --cc $(VERILOG_TOP) --exe --build $(CPPSOURCES)

test: all
	./obj_dir/Vgb

clean:
	rm -rf obj_dir/

.PHONY: test clean
