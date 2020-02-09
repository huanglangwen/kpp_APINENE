#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# User: Set here the F90 compiler and options
#       Pedefined compilers: INTEL, PGF, HPUX, LAHEY
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#COMPILER = G95
#COMPILER = LAHEY
#COMPILER = INTEL
#COMPILER = PGF
#COMPILER = HPUX
COMPILER = GFORTRAN

FC_G95     = g95
FOPT_G95   = -cpp -O -pg -fbounds-check -fimplicit-none  -Wall -ftrace=full

FC_LAHEY   = lf95
# More aggressive for production runs:
#FOPT_LAHEY = -Cpp --pca -O
# More checking for debugging:
FOPT_LAHEY = -Cpp --chk a,e,s,u --pca --ap -O0 -g --trap --trace --chkglobal

FC_INTEL   = ifort 
# More aggressive for production runs:
#FOPT_INTEL = -cpp -O -fp-model precise -pc80 -prec_div
# More checking for debugging:
FOPT_INTEL = -cpp -O0 -fp-model strict -implicitnone -ftrapuv \
              -debug all -check all -warn all

FC_PGF     = pgf90
# More aggressive for production runs:
FOPT_PGF   = -Mpreprocess -O -fast -pc 80 -Kieee
# More checking for debugging:
#FOPT_PGF   = -Mpreprocess -O0 -Mbounds -Mchkfpstk -Mchkptr -Mchkstk \
#             -Ktrap=fp -pc 80 -Kieee

FC_HPUX    = f90
FOPT_HPUX  = -O -u +Oall +check=on

FC_GFORTRAN     = gfortran
FOPT_GFORTRAN   = -cpp -O3 -march=native -mavx

# define FULL_ALGEBRA for non-sparse integration
FC   = $(FC_$(COMPILER))
FOPT = $(FOPT_$(COMPILER)) # -DFULL_ALGEBRA

LIBS =
#LIBS = -llapack -lblas

# Command to create Matlab mex gateway routines 
# Note: use $(FC) as the mex Fortran compiler
MEX  = mex

GENSRC = mcm_subset2_Precision.f90  \
	 mcm_subset2_Parameters.f90     \
	 mcm_subset2_Global.f90  

GENOBJ = mcm_subset2_Precision.o    \
	 mcm_subset2_Parameters.o       \
	 mcm_subset2_Global.o     

FUNSRC = mcm_subset2_Function.f90 
FUNOBJ = mcm_subset2_Function.o 

JACSRC = mcm_subset2_JacobianSP.f90  mcm_subset2_Jacobian.f90
JACOBJ = mcm_subset2_JacobianSP.o    mcm_subset2_Jacobian.o

HESSRC = mcm_subset2_HessianSP.f90   mcm_subset2_Hessian.f90
HESOBJ = mcm_subset2_HessianSP.o     mcm_subset2_Hessian.o

STMSRC = mcm_subset2_StoichiomSP.f90 mcm_subset2_Stoichiom.f90 
STMOBJ = mcm_subset2_StoichiomSP.o   mcm_subset2_Stoichiom.o

UTLSRC = mcm_subset2_Rates.f90 mcm_subset2_Util.f90 mcm_subset2_Monitor.f90
UTLOBJ = mcm_subset2_Rates.o   mcm_subset2_Util.o   mcm_subset2_Monitor.o

LASRC  = mcm_subset2_LinearAlgebra.f90 
LAOBJ  = mcm_subset2_LinearAlgebra.o   

STOCHSRC = mcm_subset2_Stochastic.f90 
STOCHOBJ = mcm_subset2_Stochastic.o 

MAINSRC = mcm_subset2_Main.f90   mcm_subset2_Initialize.f90   mcm_subset2_Integrator.f90 mcm_subset2_Model.f90
MAINOBJ = mcm_subset2_Main.o     mcm_subset2_Initialize.o     mcm_subset2_Integrator.o   mcm_subset2_Model.o 

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# User: modify the line below to include only the
#       objects needed by your application
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ALLOBJ = $(GENOBJ) mcm_constants.o $(FUNOBJ) $(JACOBJ) \
	 $(UTLOBJ) $(LAOBJ)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# User: modify the line below to include only the
#       executables needed by your application
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
all:    exe

exe:	$(ALLOBJ) $(MAINOBJ) 
	$(FC) $(FOPT) $(ALLOBJ) $(MAINOBJ) $(LIBS) -o mcm_subset2.exe

stochastic:$(ALLOBJ) $(STOCHOBJ) $(MAINOBJ)
	$(FC) $(FOPT) $(ALLOBJ) $(STOCHOBJ) $(MAINOBJ) $(LIBS) \
	-o mcm_subset2_stochastic.exe

mex:    $(ALLOBJ)
	$(MEX) FC#$(FC) -fortran -O mcm_subset2_mex_Fun.f90     $(ALLOBJ)
	$(MEX) FC#$(FC) -fortran -O mcm_subset2_mex_Jac_SP.f90  $(ALLOBJ)
	$(MEX) FC#$(FC) -fortran -O mcm_subset2_mex_Hessian.f90 $(ALLOBJ)

clean:
	rm -f mcm_subset2*.o mcm_subset2*.mod \
	mcm_subset2*.dat mcm_subset2.exe mcm_subset2*.mexglx \
	mcm_subset2.map

distclean:
	rm -f mcm_subset2*.o mcm_subset2*.mod \
	mcm_subset2*.dat mcm_subset2.exe mcm_subset2.map \
	mcm_subset2*.f90 mcm_subset2_*.mexglx

mcm_subset2_Precision.o: mcm_subset2_Precision.f90 
	$(FC) $(FOPT) -c $<

mcm_subset2_Parameters.o: mcm_subset2_Parameters.f90 \
	            mcm_subset2_Precision.o
	$(FC) $(FOPT) -c $<

mcm_subset2_Monitor.o: mcm_subset2_Monitor.f90 \
	             mcm_subset2_Precision.o
	$(FC) $(FOPT) -c $<

mcm_subset2_Global.o: mcm_subset2_Global.f90 \
	            mcm_subset2_Parameters.o mcm_subset2_Precision.o
	$(FC) $(FOPT) -c $<

mcm_subset2_Initialize.o: mcm_subset2_Initialize.f90  $(GENOBJ) 
	$(FC) $(FOPT) -c $<
	
mcm_constants.o: mcm_constants.f90  $(GENOBJ) 
	$(FC) $(FOPT) -c $<

mcm_subset2_Function.o: mcm_subset2_Function.f90  $(GENOBJ) 
	$(FC) $(FOPT) -c $<

mcm_subset2_Stochastic.o: mcm_subset2_Stochastic.f90  $(GENOBJ) 
	$(FC) $(FOPT) -c $<

mcm_subset2_JacobianSP.o: mcm_subset2_JacobianSP.f90 $(GENOBJ)
	$(FC) $(FOPT) -c $<

mcm_subset2_Jacobian.o: mcm_subset2_Jacobian.f90  $(GENOBJ) mcm_subset2_JacobianSP.o
	$(FC) $(FOPT) -c $<

mcm_subset2_LinearAlgebra.o: mcm_subset2_LinearAlgebra.f90 $(GENOBJ) mcm_subset2_JacobianSP.o
	$(FC) $(FOPT) -c $<

mcm_subset2_Rates.o: mcm_subset2_Rates.f90  $(GENOBJ) 
	$(FC) $(FOPT) -c $<

mcm_subset2_StoichiomSP.o: mcm_subset2_StoichiomSP.f90 $(GENOBJ)
	$(FC) $(FOPT) -c $<

mcm_subset2_Stoichiom.o: mcm_subset2_Stoichiom.f90  $(GENOBJ) mcm_subset2_StoichiomSP.o
	$(FC) $(FOPT) -c $<

mcm_subset2_Util.o: mcm_subset2_Util.f90  $(GENOBJ) mcm_subset2_Monitor.o
	$(FC) $(FOPT) -c $<

mcm_subset2_Main.o: mcm_subset2_Main.f90  $(ALLOBJ) mcm_subset2_Initialize.o mcm_subset2_Model.o mcm_subset2_Integrator.o
	$(FC) $(FOPT) -c $<

mcm_subset2_Model.o: mcm_subset2_Model.f90  $(ALLOBJ) mcm_subset2_Integrator.o
	$(FC) $(FOPT) -c $<

mcm_subset2_Integrator.o: mcm_subset2_Integrator.f90  $(ALLOBJ)
	$(FC) $(FOPT) -c $<
