F90=gfortran -Jlib -Ilib
debug: F90 += -g
imem_test: F90 += -O3
#-fopenmp

#SRCS=operators.f90 sorting.f90 IMFutils.f90
SRCS=operators.f90 qsort.f90 IMFutils.f90
OBJS=$(SRCS:%.f90=lib/%.o)

IMF: IMFtest.f90 $(SRCS) $(OBJS)
	$(F90) -o IMFtest IMFtest.f90 $(OBJS)

IMF2: IMFtest2.f90 $(SRCS) $(OBJS)
	$(F90) -o IMFtest2 IMFtest2.f90 $(OBJS)

IMF3: IMFtest3.f90 $(SRCS) $(OBJS)
	$(F90) -o IMFtest3 IMFtest3.f90 $(OBJS)

all: IMFtest.f90 IMFtest2.f90 IMFtest3.f90 $(SRCS) $(OBJS)
	$(F90) -o IMFtest3 IMFtest3.f90 $(OBJS)
	$(F90) -o IMFtest2 IMFtest2.f90 $(OBJS)
	$(F90) -o IMFtest IMFtest.f90 $(OBJS)


lib/%.o: %.f90
	$(F90) -c -o $@ $?

# This entry allows you to type " make clean " to get rid of
# all object and module files
clean:
	 rm -f -r f_{files,modd}* *.o *.mod *.M *.d V*.inc *.vo  V*.f *.dbg album F.err
