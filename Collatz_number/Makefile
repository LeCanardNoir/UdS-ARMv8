AS = as
LD = ld


ARMV8:	collatz.o
	@echo
	@echo ------------------
	@echo Edition des liens
	@echo ------------------
	@echo

	$(LD) -e Main collatz.o  -o collatz -lc



collatz.o: collatz.as
	@echo
	@echo ---------------------------------------------
	@echo Compilation du programme principal, fib.as
	@echo ---------------------------------------------
	@echo

	$(AS) --gstabs collatz.as -o collatz.o
