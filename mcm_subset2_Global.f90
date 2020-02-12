! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! Global Data Module File
! 
! Generated by KPP-2.2.3 symbolic chemistry Kinetics PreProcessor
!       (http://www.cs.vt.edu/~asandu/Software/KPP)
! KPP is distributed under GPL, the general public licence
!       (http://www.gnu.org/copyleft/gpl.html)
! (C) 1995-1997, V. Damian & A. Sandu, CGRER, Univ. Iowa
! (C) 1997-2005, A. Sandu, Michigan Tech, Virginia Tech
!     With important contributions from:
!        M. Damian, Villanova University, USA
!        R. Sander, Max-Planck Institute for Chemistry, Mainz, Germany
! 
! File                 : mcm_subset2_Global.f90
! Time                 : Thu Feb  6 22:50:59 2020
! Working directory    : /mnt/c/Users/huang/Desktop/Model/kpp-2.2.3_Nov.2012/kpp-2.2.3/examples/MCM
! Equation file        : mcm_subset2.kpp
! Output root filename : mcm_subset2
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



MODULE mcm_subset2_Global

  USE mcm_subset2_Parameters, ONLY: dp, NSPEC, NVAR, NFIX, NREACT
  PUBLIC
  SAVE


! Declaration of global variables

! C - Concentration of all species
  REAL(kind=dp) :: C(NSPEC)
! VAR - Concentrations of variable species (global)
  REAL(kind=dp) :: VAR(NVAR)
! FIX - Concentrations of fixed species (global)
  REAL(kind=dp) :: FIX(NFIX)
! VAR, FIX are chunks of array C
      EQUIVALENCE( C(1),VAR(1) )
! RCONST - Rate constants (global)
  REAL(kind=dp) :: RCONST(NREACT)
! TIME - Current integration time
  REAL(kind=dp) :: TIME=43200.0!=12*60*60
! SUN - Sunlight intensity between [0,1]
  REAL(kind=dp) :: SUN=1.0
! TEMP - Temperature
  REAL(kind=dp) :: TEMP=298.15
! RTOLS - (scalar) Relative tolerance
  REAL(kind=dp) :: RTOLS = 1E-8
! TSTART - Integration start time
  REAL(kind=dp) :: TSTART = 0.0
! TEND - Integration end time
  REAL(kind=dp) :: TEND = 10800.0
! DT - Integration step
  REAL(kind=dp) :: DT = 100.0
! ATOL - Absolute tolerance
  REAL(kind=dp) :: ATOL(NVAR) = 1E-3
! RTOL - Relative tolerance
  REAL(kind=dp) :: RTOL(NVAR) = 1E-6
! STEPMIN - Lower bound for integration step
  REAL(kind=dp) :: STEPMIN = 1E-8
! STEPMAX - Upper bound for integration step
  REAL(kind=dp) :: STEPMAX = 10.0
! CFACTOR - Conversion factor for concentration units
  REAL(kind=dp) :: CFACTOR = 2.55E10

! INLINED global variable declarations
 
 REAL(dp)::M, N2, O2, RO2, H2O 
 
! INLINED global variable declarations


END MODULE mcm_subset2_Global

