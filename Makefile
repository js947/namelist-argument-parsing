FC := gfortran
FFLAGS := -g -std=f2008 -ffree-form

parseargs : parseargs.f
	$(FC) $(FFLAGS) $< -o $@
