! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! Auxiliary Routines File
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
! File                 : mcm_subset2_Util.f90
! Time                 : Thu Feb  6 22:50:59 2020
! Working directory    : /mnt/c/Users/huang/Desktop/Model/kpp-2.2.3_Nov.2012/kpp-2.2.3/examples/MCM
! Equation file        : mcm_subset2.kpp
! Output root filename : mcm_subset2
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



MODULE mcm_subset2_Util

  USE mcm_subset2_Parameters
  IMPLICIT NONE

CONTAINS



! User INLINED Utility Functions

! End INLINED Utility Functions

! Utility Functions from KPP_HOME/util/util
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! UTIL - Utility functions
!   Arguments :
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

! ****************************************************************
!                            
! InitSaveData - Opens the data file for writing
!   Parameters :                                                  
!
! ****************************************************************

      SUBROUTINE InitSaveData ()

      USE mcm_subset2_Parameters

      open(10, file='mcm_subset2.dat')

      END SUBROUTINE InitSaveData

! End of InitSaveData function
! ****************************************************************

! ****************************************************************
!                            
! SaveData - Write LOOKAT species in the data file 
!   Parameters :                                                  
!
! ****************************************************************

      SUBROUTINE SaveData ()

      USE mcm_subset2_Global
      USE mcm_subset2_Monitor

      INTEGER i

      WRITE(10,999) (TIME-TSTART)/3600.D0,  &
                   (C(LOOKAT(i))/CFACTOR, i=1,NLOOKAT)
999   FORMAT(E24.16,100(1X,E24.16))

      END SUBROUTINE SaveData

! End of SaveData function
! ****************************************************************

! ****************************************************************
!                            
! CloseSaveData - Close the data file 
!   Parameters :                                                  
!
! ****************************************************************

      SUBROUTINE CloseSaveData ()

      USE mcm_subset2_Parameters

      CLOSE(10)

      END SUBROUTINE CloseSaveData

! End of CloseSaveData function
! ****************************************************************

! ****************************************************************
!                            
! GenerateMatlab - Generates MATLAB file to load the data file 
!   Parameters : 
!                It will have a character string to prefix each 
!                species name with.                                                 
!
! ****************************************************************

      SUBROUTINE GenerateMatlab ( PREFIX )

      USE mcm_subset2_Parameters
      USE mcm_subset2_Global
      USE mcm_subset2_Monitor

      
      CHARACTER(LEN=8) PREFIX 
      INTEGER i

      open(20, file='mcm_subset2.m')
      write(20,*) 'load mcm_subset2.dat;'
      write(20,990) PREFIX
990   FORMAT(A1,'c = mcm_subset2;')
      write(20,*) 'clear mcm_subset2;'
      write(20,991) PREFIX, PREFIX
991   FORMAT(A1,'t=',A1,'c(:,1);')
      write(20,992) PREFIX
992   FORMAT(A1,'c(:,1)=[];')

      do i=1,NLOOKAT
        write(20,993) PREFIX, SPC_NAMES(LOOKAT(i)), PREFIX, i
993     FORMAT(A1,A6,' = ',A1,'c(:,',I2,');')
      end do
      
      CLOSE(20)

      END SUBROUTINE GenerateMatlab

! End of GenerateMatlab function
! ****************************************************************


! End Utility Functions from KPP_HOME/util/util
! End of UTIL function
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! Shuffle_user2kpp - function to copy concentrations from USER to KPP
!   Arguments :
!      V_USER    - Concentration of variable species in USER's order
!      V         - Concentrations of variable species (local)
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SUBROUTINE Shuffle_user2kpp ( V_USER, V )

! V_USER - Concentration of variable species in USER's order
  REAL(kind=dp) :: V_USER(NVAR)
! V - Concentrations of variable species (local)
  REAL(kind=dp) :: V(NVAR)

  V(191) = V_USER(1)
  V(192) = V_USER(2)
  V(209) = V_USER(3)
  V(15) = V_USER(4)
  V(158) = V_USER(5)
  V(150) = V_USER(6)
  V(51) = V_USER(7)
  V(171) = V_USER(8)
  V(220) = V_USER(9)
  V(31) = V_USER(10)
  V(286) = V_USER(11)
  V(157) = V_USER(12)
  V(159) = V_USER(13)
  V(110) = V_USER(14)
  V(164) = V_USER(15)
  V(297) = V_USER(16)
  V(240) = V_USER(17)
  V(179) = V_USER(18)
  V(114) = V_USER(19)
  V(70) = V_USER(20)
  V(295) = V_USER(21)
  V(198) = V_USER(22)
  V(80) = V_USER(23)
  V(82) = V_USER(24)
  V(229) = V_USER(25)
  V(132) = V_USER(26)
  V(194) = V_USER(27)
  V(138) = V_USER(28)
  V(250) = V_USER(29)
  V(139) = V_USER(30)
  V(97) = V_USER(31)
  V(6) = V_USER(32)
  V(18) = V_USER(33)
  V(169) = V_USER(34)
  V(239) = V_USER(35)
  V(280) = V_USER(36)
  V(246) = V_USER(37)
  V(288) = V_USER(38)
  V(163) = V_USER(39)
  V(241) = V_USER(40)
  V(115) = V_USER(41)
  V(273) = V_USER(42)
  V(184) = V_USER(43)
  V(16) = V_USER(44)
  V(1) = V_USER(45)
  V(200) = V_USER(46)
  V(40) = V_USER(47)
  V(19) = V_USER(48)
  V(89) = V_USER(49)
  V(135) = V_USER(50)
  V(41) = V_USER(51)
  V(141) = V_USER(52)
  V(142) = V_USER(53)
  V(116) = V_USER(54)
  V(223) = V_USER(55)
  V(210) = V_USER(56)
  V(152) = V_USER(57)
  V(181) = V_USER(58)
  V(186) = V_USER(59)
  V(299) = V_USER(60)
  V(190) = V_USER(61)
  V(252) = V_USER(62)
  V(147) = V_USER(63)
  V(122) = V_USER(64)
  V(127) = V_USER(65)
  V(61) = V_USER(66)
  V(37) = V_USER(67)
  V(255) = V_USER(68)
  V(62) = V_USER(69)
  V(274) = V_USER(70)
  V(187) = V_USER(71)
  V(189) = V_USER(72)
  V(234) = V_USER(73)
  V(161) = V_USER(74)
  V(285) = V_USER(75)
  V(264) = V_USER(76)
  V(120) = V_USER(77)
  V(121) = V_USER(78)
  V(63) = V_USER(79)
  V(64) = V_USER(80)
  V(196) = V_USER(81)
  V(65) = V_USER(82)
  V(253) = V_USER(83)
  V(129) = V_USER(84)
  V(131) = V_USER(85)
  V(66) = V_USER(86)
  V(228) = V_USER(87)
  V(276) = V_USER(88)
  V(294) = V_USER(89)
  V(289) = V_USER(90)
  V(137) = V_USER(91)
  V(249) = V_USER(92)
  V(237) = V_USER(93)
  V(67) = V_USER(94)
  V(303) = V_USER(95)
  V(298) = V_USER(96)
  V(42) = V_USER(97)
  V(2) = V_USER(98)
  V(68) = V_USER(99)
  V(238) = V_USER(100)
  V(151) = V_USER(101)
  V(178) = V_USER(102)
  V(183) = V_USER(103)
  V(208) = V_USER(104)
  V(43) = V_USER(105)
  V(69) = V_USER(106)
  V(20) = V_USER(107)
  V(71) = V_USER(108)
  V(231) = V_USER(109)
  V(72) = V_USER(110)
  V(73) = V_USER(111)
  V(258) = V_USER(112)
  V(293) = V_USER(113)
  V(268) = V_USER(114)
  V(283) = V_USER(115)
  V(166) = V_USER(116)
  V(170) = V_USER(117)
  V(174) = V_USER(118)
  V(290) = V_USER(119)
  V(74) = V_USER(120)
  V(212) = V_USER(121)
  V(44) = V_USER(122)
  V(119) = V_USER(123)
  V(75) = V_USER(124)
  V(34) = V_USER(125)
  V(112) = V_USER(126)
  V(277) = V_USER(127)
  V(76) = V_USER(128)
  V(282) = V_USER(129)
  V(224) = V_USER(130)
  V(211) = V_USER(131)
  V(3) = V_USER(132)
  V(77) = V_USER(133)
  V(266) = V_USER(134)
  V(243) = V_USER(135)
  V(45) = V_USER(136)
  V(78) = V_USER(137)
  V(21) = V_USER(138)
  V(270) = V_USER(139)
  V(123) = V_USER(140)
  V(22) = V_USER(141)
  V(125) = V_USER(142)
  V(126) = V_USER(143)
  V(79) = V_USER(144)
  V(173) = V_USER(145)
  V(23) = V_USER(146)
  V(81) = V_USER(147)
  V(207) = V_USER(148)
  V(300) = V_USER(149)
  V(128) = V_USER(150)
  V(272) = V_USER(151)
  V(24) = V_USER(152)
  V(83) = V_USER(153)
  V(296) = V_USER(154)
  V(130) = V_USER(155)
  V(263) = V_USER(156)
  V(226) = V_USER(157)
  V(25) = V_USER(158)
  V(46) = V_USER(159)
  V(84) = V_USER(160)
  V(214) = V_USER(161)
  V(205) = V_USER(162)
  V(26) = V_USER(163)
  V(133) = V_USER(164)
  V(85) = V_USER(165)
  V(267) = V_USER(166)
  V(222) = V_USER(167)
  V(27) = V_USER(168)
  V(217) = V_USER(169)
  V(86) = V_USER(170)
  V(301) = V_USER(171)
  V(165) = V_USER(172)
  V(113) = V_USER(173)
  V(218) = V_USER(174)
  V(47) = V_USER(175)
  V(167) = V_USER(176)
  V(87) = V_USER(177)
  V(88) = V_USER(178)
  V(168) = V_USER(179)
  V(134) = V_USER(180)
  V(48) = V_USER(181)
  V(49) = V_USER(182)
  V(136) = V_USER(183)
  V(90) = V_USER(184)
  V(28) = V_USER(185)
  V(287) = V_USER(186)
  V(91) = V_USER(187)
  V(29) = V_USER(188)
  V(230) = V_USER(189)
  V(92) = V_USER(190)
  V(292) = V_USER(191)
  V(305) = V_USER(192)
  V(30) = V_USER(193)
  V(50) = V_USER(194)
  V(124) = V_USER(195)
  V(256) = V_USER(196)
  V(93) = V_USER(197)
  V(251) = V_USER(198)
  V(221) = V_USER(199)
  V(213) = V_USER(200)
  V(140) = V_USER(201)
  V(215) = V_USER(202)
  V(94) = V_USER(203)
  V(260) = V_USER(204)
  V(7) = V_USER(205)
  V(216) = V_USER(206)
  V(206) = V_USER(207)
  V(8) = V_USER(208)
  V(172) = V_USER(209)
  V(193) = V_USER(210)
  V(52) = V_USER(211)
  V(143) = V_USER(212)
  V(202) = V_USER(213)
  V(247) = V_USER(214)
  V(144) = V_USER(215)
  V(145) = V_USER(216)
  V(269) = V_USER(217)
  V(53) = V_USER(218)
  V(232) = V_USER(219)
  V(254) = V_USER(220)
  V(95) = V_USER(221)
  V(279) = V_USER(222)
  V(17) = V_USER(223)
  V(175) = V_USER(224)
  V(96) = V_USER(225)
  V(9) = V_USER(226)
  V(146) = V_USER(227)
  V(176) = V_USER(228)
  V(248) = V_USER(229)
  V(54) = V_USER(230)
  V(10) = V_USER(231)
  V(177) = V_USER(232)
  V(148) = V_USER(233)
  V(265) = V_USER(234)
  V(149) = V_USER(235)
  V(55) = V_USER(236)
  V(11) = V_USER(237)
  V(32) = V_USER(238)
  V(98) = V_USER(239)
  V(99) = V_USER(240)
  V(100) = V_USER(241)
  V(33) = V_USER(242)
  V(180) = V_USER(243)
  V(56) = V_USER(244)
  V(57) = V_USER(245)
  V(197) = V_USER(246)
  V(257) = V_USER(247)
  V(182) = V_USER(248)
  V(284) = V_USER(249)
  V(235) = V_USER(250)
  V(225) = V_USER(251)
  V(154) = V_USER(252)
  V(101) = V_USER(253)
  V(35) = V_USER(254)
  V(227) = V_USER(255)
  V(271) = V_USER(256)
  V(102) = V_USER(257)
  V(262) = V_USER(258)
  V(103) = V_USER(259)
  V(155) = V_USER(260)
  V(304) = V_USER(261)
  V(185) = V_USER(262)
  V(195) = V_USER(263)
  V(58) = V_USER(264)
  V(104) = V_USER(265)
  V(156) = V_USER(266)
  V(278) = V_USER(267)
  V(302) = V_USER(268)
  V(281) = V_USER(269)
  V(117) = V_USER(270)
  V(261) = V_USER(271)
  V(105) = V_USER(272)
  V(259) = V_USER(273)
  V(12) = V_USER(274)
  V(188) = V_USER(275)
  V(106) = V_USER(276)
  V(59) = V_USER(277)
  V(107) = V_USER(278)
  V(118) = V_USER(279)
  V(4) = V_USER(280)
  V(5) = V_USER(281)
  V(199) = V_USER(282)
  V(291) = V_USER(283)
  V(203) = V_USER(284)
  V(36) = V_USER(285)
  V(204) = V_USER(286)
  V(275) = V_USER(287)
  V(242) = V_USER(288)
  V(153) = V_USER(289)
  V(233) = V_USER(290)
  V(108) = V_USER(291)
  V(60) = V_USER(292)
  V(13) = V_USER(293)
  V(160) = V_USER(294)
  V(244) = V_USER(295)
  V(109) = V_USER(296)
  V(219) = V_USER(297)
  V(201) = V_USER(298)
  V(14) = V_USER(299)
  V(38) = V_USER(300)
  V(236) = V_USER(301)
  V(245) = V_USER(302)
  V(162) = V_USER(303)
  V(111) = V_USER(304)
      
END SUBROUTINE Shuffle_user2kpp

! End of Shuffle_user2kpp function
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! Shuffle_kpp2user - function to restore concentrations from KPP to USER
!   Arguments :
!      V         - Concentrations of variable species (local)
!      V_USER    - Concentration of variable species in USER's order
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SUBROUTINE Shuffle_kpp2user ( V, V_USER )

! V - Concentrations of variable species (local)
  REAL(kind=dp) :: V(NVAR)
! V_USER - Concentration of variable species in USER's order
  REAL(kind=dp) :: V_USER(NVAR)

  V_USER(1) = V(191)
  V_USER(2) = V(192)
  V_USER(3) = V(209)
  V_USER(4) = V(15)
  V_USER(5) = V(158)
  V_USER(6) = V(150)
  V_USER(7) = V(51)
  V_USER(8) = V(171)
  V_USER(9) = V(220)
  V_USER(10) = V(31)
  V_USER(11) = V(286)
  V_USER(12) = V(157)
  V_USER(13) = V(159)
  V_USER(14) = V(110)
  V_USER(15) = V(164)
  V_USER(16) = V(297)
  V_USER(17) = V(240)
  V_USER(18) = V(179)
  V_USER(19) = V(114)
  V_USER(20) = V(70)
  V_USER(21) = V(295)
  V_USER(22) = V(198)
  V_USER(23) = V(80)
  V_USER(24) = V(82)
  V_USER(25) = V(229)
  V_USER(26) = V(132)
  V_USER(27) = V(194)
  V_USER(28) = V(138)
  V_USER(29) = V(250)
  V_USER(30) = V(139)
  V_USER(31) = V(97)
  V_USER(32) = V(6)
  V_USER(33) = V(18)
  V_USER(34) = V(169)
  V_USER(35) = V(239)
  V_USER(36) = V(280)
  V_USER(37) = V(246)
  V_USER(38) = V(288)
  V_USER(39) = V(163)
  V_USER(40) = V(241)
  V_USER(41) = V(115)
  V_USER(42) = V(273)
  V_USER(43) = V(184)
  V_USER(44) = V(16)
  V_USER(45) = V(1)
  V_USER(46) = V(200)
  V_USER(47) = V(40)
  V_USER(48) = V(19)
  V_USER(49) = V(89)
  V_USER(50) = V(135)
  V_USER(51) = V(41)
  V_USER(52) = V(141)
  V_USER(53) = V(142)
  V_USER(54) = V(116)
  V_USER(55) = V(223)
  V_USER(56) = V(210)
  V_USER(57) = V(152)
  V_USER(58) = V(181)
  V_USER(59) = V(186)
  V_USER(60) = V(299)
  V_USER(61) = V(190)
  V_USER(62) = V(252)
  V_USER(63) = V(147)
  V_USER(64) = V(122)
  V_USER(65) = V(127)
  V_USER(66) = V(61)
  V_USER(67) = V(37)
  V_USER(68) = V(255)
  V_USER(69) = V(62)
  V_USER(70) = V(274)
  V_USER(71) = V(187)
  V_USER(72) = V(189)
  V_USER(73) = V(234)
  V_USER(74) = V(161)
  V_USER(75) = V(285)
  V_USER(76) = V(264)
  V_USER(77) = V(120)
  V_USER(78) = V(121)
  V_USER(79) = V(63)
  V_USER(80) = V(64)
  V_USER(81) = V(196)
  V_USER(82) = V(65)
  V_USER(83) = V(253)
  V_USER(84) = V(129)
  V_USER(85) = V(131)
  V_USER(86) = V(66)
  V_USER(87) = V(228)
  V_USER(88) = V(276)
  V_USER(89) = V(294)
  V_USER(90) = V(289)
  V_USER(91) = V(137)
  V_USER(92) = V(249)
  V_USER(93) = V(237)
  V_USER(94) = V(67)
  V_USER(95) = V(303)
  V_USER(96) = V(298)
  V_USER(97) = V(42)
  V_USER(98) = V(2)
  V_USER(99) = V(68)
  V_USER(100) = V(238)
  V_USER(101) = V(151)
  V_USER(102) = V(178)
  V_USER(103) = V(183)
  V_USER(104) = V(208)
  V_USER(105) = V(43)
  V_USER(106) = V(69)
  V_USER(107) = V(20)
  V_USER(108) = V(71)
  V_USER(109) = V(231)
  V_USER(110) = V(72)
  V_USER(111) = V(73)
  V_USER(112) = V(258)
  V_USER(113) = V(293)
  V_USER(114) = V(268)
  V_USER(115) = V(283)
  V_USER(116) = V(166)
  V_USER(117) = V(170)
  V_USER(118) = V(174)
  V_USER(119) = V(290)
  V_USER(120) = V(74)
  V_USER(121) = V(212)
  V_USER(122) = V(44)
  V_USER(123) = V(119)
  V_USER(124) = V(75)
  V_USER(125) = V(34)
  V_USER(126) = V(112)
  V_USER(127) = V(277)
  V_USER(128) = V(76)
  V_USER(129) = V(282)
  V_USER(130) = V(224)
  V_USER(131) = V(211)
  V_USER(132) = V(3)
  V_USER(133) = V(77)
  V_USER(134) = V(266)
  V_USER(135) = V(243)
  V_USER(136) = V(45)
  V_USER(137) = V(78)
  V_USER(138) = V(21)
  V_USER(139) = V(270)
  V_USER(140) = V(123)
  V_USER(141) = V(22)
  V_USER(142) = V(125)
  V_USER(143) = V(126)
  V_USER(144) = V(79)
  V_USER(145) = V(173)
  V_USER(146) = V(23)
  V_USER(147) = V(81)
  V_USER(148) = V(207)
  V_USER(149) = V(300)
  V_USER(150) = V(128)
  V_USER(151) = V(272)
  V_USER(152) = V(24)
  V_USER(153) = V(83)
  V_USER(154) = V(296)
  V_USER(155) = V(130)
  V_USER(156) = V(263)
  V_USER(157) = V(226)
  V_USER(158) = V(25)
  V_USER(159) = V(46)
  V_USER(160) = V(84)
  V_USER(161) = V(214)
  V_USER(162) = V(205)
  V_USER(163) = V(26)
  V_USER(164) = V(133)
  V_USER(165) = V(85)
  V_USER(166) = V(267)
  V_USER(167) = V(222)
  V_USER(168) = V(27)
  V_USER(169) = V(217)
  V_USER(170) = V(86)
  V_USER(171) = V(301)
  V_USER(172) = V(165)
  V_USER(173) = V(113)
  V_USER(174) = V(218)
  V_USER(175) = V(47)
  V_USER(176) = V(167)
  V_USER(177) = V(87)
  V_USER(178) = V(88)
  V_USER(179) = V(168)
  V_USER(180) = V(134)
  V_USER(181) = V(48)
  V_USER(182) = V(49)
  V_USER(183) = V(136)
  V_USER(184) = V(90)
  V_USER(185) = V(28)
  V_USER(186) = V(287)
  V_USER(187) = V(91)
  V_USER(188) = V(29)
  V_USER(189) = V(230)
  V_USER(190) = V(92)
  V_USER(191) = V(292)
  V_USER(192) = V(305)
  V_USER(193) = V(30)
  V_USER(194) = V(50)
  V_USER(195) = V(124)
  V_USER(196) = V(256)
  V_USER(197) = V(93)
  V_USER(198) = V(251)
  V_USER(199) = V(221)
  V_USER(200) = V(213)
  V_USER(201) = V(140)
  V_USER(202) = V(215)
  V_USER(203) = V(94)
  V_USER(204) = V(260)
  V_USER(205) = V(7)
  V_USER(206) = V(216)
  V_USER(207) = V(206)
  V_USER(208) = V(8)
  V_USER(209) = V(172)
  V_USER(210) = V(193)
  V_USER(211) = V(52)
  V_USER(212) = V(143)
  V_USER(213) = V(202)
  V_USER(214) = V(247)
  V_USER(215) = V(144)
  V_USER(216) = V(145)
  V_USER(217) = V(269)
  V_USER(218) = V(53)
  V_USER(219) = V(232)
  V_USER(220) = V(254)
  V_USER(221) = V(95)
  V_USER(222) = V(279)
  V_USER(223) = V(17)
  V_USER(224) = V(175)
  V_USER(225) = V(96)
  V_USER(226) = V(9)
  V_USER(227) = V(146)
  V_USER(228) = V(176)
  V_USER(229) = V(248)
  V_USER(230) = V(54)
  V_USER(231) = V(10)
  V_USER(232) = V(177)
  V_USER(233) = V(148)
  V_USER(234) = V(265)
  V_USER(235) = V(149)
  V_USER(236) = V(55)
  V_USER(237) = V(11)
  V_USER(238) = V(32)
  V_USER(239) = V(98)
  V_USER(240) = V(99)
  V_USER(241) = V(100)
  V_USER(242) = V(33)
  V_USER(243) = V(180)
  V_USER(244) = V(56)
  V_USER(245) = V(57)
  V_USER(246) = V(197)
  V_USER(247) = V(257)
  V_USER(248) = V(182)
  V_USER(249) = V(284)
  V_USER(250) = V(235)
  V_USER(251) = V(225)
  V_USER(252) = V(154)
  V_USER(253) = V(101)
  V_USER(254) = V(35)
  V_USER(255) = V(227)
  V_USER(256) = V(271)
  V_USER(257) = V(102)
  V_USER(258) = V(262)
  V_USER(259) = V(103)
  V_USER(260) = V(155)
  V_USER(261) = V(304)
  V_USER(262) = V(185)
  V_USER(263) = V(195)
  V_USER(264) = V(58)
  V_USER(265) = V(104)
  V_USER(266) = V(156)
  V_USER(267) = V(278)
  V_USER(268) = V(302)
  V_USER(269) = V(281)
  V_USER(270) = V(117)
  V_USER(271) = V(261)
  V_USER(272) = V(105)
  V_USER(273) = V(259)
  V_USER(274) = V(12)
  V_USER(275) = V(188)
  V_USER(276) = V(106)
  V_USER(277) = V(59)
  V_USER(278) = V(107)
  V_USER(279) = V(118)
  V_USER(280) = V(4)
  V_USER(281) = V(5)
  V_USER(282) = V(199)
  V_USER(283) = V(291)
  V_USER(284) = V(203)
  V_USER(285) = V(36)
  V_USER(286) = V(204)
  V_USER(287) = V(275)
  V_USER(288) = V(242)
  V_USER(289) = V(153)
  V_USER(290) = V(233)
  V_USER(291) = V(108)
  V_USER(292) = V(60)
  V_USER(293) = V(13)
  V_USER(294) = V(160)
  V_USER(295) = V(244)
  V_USER(296) = V(109)
  V_USER(297) = V(219)
  V_USER(298) = V(201)
  V_USER(299) = V(14)
  V_USER(300) = V(38)
  V_USER(301) = V(236)
  V_USER(302) = V(245)
  V_USER(303) = V(162)
  V_USER(304) = V(111)
      
END SUBROUTINE Shuffle_kpp2user

! End of Shuffle_kpp2user function
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! GetMass - compute total mass of selected atoms
!   Arguments :
!      CL        - Concentration of all species (local)
!      Mass      - value of mass balance
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SUBROUTINE GetMass ( CL, Mass )

! CL - Concentration of all species (local)
  REAL(kind=dp) :: CL(NSPEC)
! Mass - value of mass balance
  REAL(kind=dp) :: Mass(1)

      
END SUBROUTINE GetMass

! End of GetMass function
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



END MODULE mcm_subset2_Util
