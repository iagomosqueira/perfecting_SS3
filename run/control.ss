#V3.30.21.00;_safe;_compile_date:_Feb 10 2023;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_13.1
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#C Control.ss version: C:\000\1001_ICCAT_BSH_2023\SS3\2023_Model_1\000_Excel_01_Control\2023_09_Ref_Case\v1(7_8_2023)																									:: try_04 Synthesis v3.30.12.00-safe (2018_09_13)																																																																																																																																																																																			
#_data_and_control_files: DATA.SS // CONTROL.SS
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns (Growth Patterns, Morphs, Bio Patterns, GP are terms used interchangeably in SS3)
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Platoon_within/between_stdev_ratio (no read if N_platoons=1)
#_Cond  1 #vector_platoon_dist_(-1_in_first_val_gives_normal_approx)
#
4 # recr_dist_method for parameters:  2=main effects for GP, Area, Settle timing; 3=each Settle entity; 4=none (only when N_GP*Nsettle*pop==1)
1 # not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by area
1 #  number of recruitment settlement assignments 
0 # unused option
#GPattern month  area  age (for each settlement assignment)
 1 7 1 0
#
#_Cond 0 # N_movement_definitions goes here if Nareas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
1 #_Nblock_Patterns
 1 #_blocks_per_pattern 
# begin and end years of blocks
 1970 1970
#
# controls for all timevary parameters 
1 #_time-vary parm bound check (1=warn relative to base parm bounds; 3=no bound check); Also see env (3) and dev (5) options to constrain with base bounds
#
# AUTOGEN
 1 1 1 1 1 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen time-varying parms of this category; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
#
#_Available timevary codes
#_Block types: 0: P_block=P_base*exp(TVP); 1: P_block=P_base+TVP; 2: P_block=TVP; 3: P_block=P_block(-1) + TVP
#_Block_trends: -1: trend bounded by base parm min-max and parms in transformed units (beware); -2: endtrend and infl_year direct values; -3: end and infl as fraction of base range
#_EnvLinks:  1: P(y)=P_base*exp(TVP*env(y));  2: P(y)=P_base+TVP*env(y);  3: P(y)=f(TVP,env_Zscore) w/ logit to stay in min-max;  4: P(y)=2.0/(1.0+exp(-TVP1*env(y) - TVP2))
#_DevLinks:  1: P(y)*=exp(dev(y)*dev_se;  2: P(y)+=dev(y)*dev_se;  3: random walk;  4: zero-reverting random walk with rho;  5: like 4 with logit transform to stay in base min-max
#_DevLinks(more):  21-25 keep last dev for rest of years
#
#_Prior_codes:  0=none; 6=normal; 1=symmetric beta; 2=CASAL's beta; 3=lognormal; 4=lognormal with biascorr; 5=gamma
#
# setup for M, growth, wt-len, maturity, fecundity, (hermaphro), recr_distr, cohort_grow, (movement), (age error), (catch_mult), sex ratio 
#_NATMORT
3 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate;_5=BETA:_Maunder_link_to_maturity;_6=Lorenzen_range
 #_Age_natmort_by sex x growthpattern (nest GP in sex)
 0.226 0.211 0.203 0.198 0.195 0.192 0.18 0.179 0.177 0.176 0.175 0.175 0.174 0.173 0.173 0.173 0.172 0.172 0.172 0.171 0.171 0.171 0.171 0.171 0.171 0.17 0.17 0.17 0.17 0.17 0.17
 0.226 0.211 0.203 0.198 0.195 0.192 0.201 0.199 0.198 0.197 0.197 0.196 0.196 0.196 0.195 0.195 0.195 0.195 0.195 0.195 0.194 0.194 0.194 0.194 0.194 0.194 0.194 0.194 0.194 0.194 0.194
#
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr; 5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
0 #_Age(post-settlement)_for_L1;linear growth below this
999 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
4 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
#_Age_Fecundity by growth pattern
 0 0 0.01 0.04 0.33 2.39 12.85 30.71 37.65 38.82 38.98 39 39 39 39 39 39 39 39 39 39 39 39 39 39 39 39 39 39 39 39
3 #_First_Mature_Age
# NOTE: maturity options 4 and 5 cause fecundity_at_length to be ignored, but parameters still needed 
2 #_fecundity_at_length option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach for M, G, CV_G:  1- direct, no offset**; 2- male=fem_parm*exp(male_parm); 3: male=female*exp(parm) then old=young*exp(parm)
#_** in option 1, any male parameter with value = 0.0 and phase <0 is set equal to female parameter
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
# Sex: 1  BioPattern: 1  Growth
 5 100 77.23 71.98 1000 6 -3 0 0 0 0 5 0 0 # L_at_Amin_Fem_GP_1
 50 600 337.3 292.4 1000 6 -4 0 0 0 0 5 0 0 # L_at_Amax_Fem_GP_1
 0.01 0.65 0.107 0.157 0.2 6 -5 0 0 0 0 5 0 0 # VonBert_K_Fem_GP_1
 0.01 0.3 0.0932677 0.0932677 0.01 6 -2 0 0 0 0 5 0 0 # CV_young_Fem_GP_1
 0.01 0.3 0.0898002 0.0898002 0.01 6 -3 0 0 0 0 5 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 -3 3 3.18e-06 3e-06 0.8 6 -3 0 0 0 0 5 0 0 # Wtlen_1_Fem_GP_1
 -3 5 3.1313 3 0.8 6 -3 0 0 0 0 5 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 1 300 194.2 194.2 0.8 6 -3 0 0 0 0 5 0 0 # Mat50%_Fem_GP_1
 -200 3 -0.11 -0.11 0.8 6 -3 0 0 0 0 5 0 0 # Mat_slope_Fem_GP_1
 -3 50 39 19.5 0.8 6 -3 0 0 0 0 5 0 0 # Eggs_scalar_Fem_GP_1
 -3 3 0 0 0.8 6 -3 0 0 0 0 5 0 0 # Eggs_exp_len_Fem_GP_1
# Sex: 2  BioPattern: 1  NatMort
# Sex: 2  BioPattern: 1  Growth
 5 100 69.95 71.98 1000 6 -3 0 0 0 0 5 0 0 # L_at_Amin_Mal_GP_1
 50 600 282.4 292.4 1000 6 -4 0 0 0 0 5 0 0 # L_at_Amax_Mal_GP_1
 0.01 0.65 0.179 0.157 0.2 6 -5 0 0 0 0 5 0 0 # VonBert_K_Mal_GP_1
 0.01 0.3 0.0973418 0.0973418 0.01 6 -2 0 0 0 0 5 0 0 # CV_young_Mal_GP_1
 0.01 0.3 0.0824247 0.0824247 0.01 6 -3 0 0 0 0 5 0 0 # CV_old_Mal_GP_1
# Sex: 2  BioPattern: 1  WtLen
 -3 3 3.18e-06 3e-06 0.8 6 -3 0 0 0 0 5 0 0 # Wtlen_1_Mal_GP_1
 -3 5 3.13 3 0.8 6 -3 0 0 0 0 5 0 0 # Wtlen_2_Mal_GP_1
# Hermaphroditism
#  Recruitment Distribution 
#  Cohort growth dev base
 0.1 10 1 1 1 6 -1 0 0 0 0 5 0 0 # CohortGrowDev
#  Movement
#  Age Error from parameters
#  catch multiplier
#  fraction female, by GP
 1e-06 0.999999 0.5 0.5 0.5 0 -99 0 0 0 0 0 0 0 # FracFemale_GP_1
#  M2 parameter for each predator fleet
#
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
3 #_Spawner-Recruitment; Options: 1=NA; 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepherd_3Parm; 9=RickerPower_3parm
0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn #  parm_name
           2.3         13.82       8.02511          9.08          1000             6          1          0          0          0          0          5          0          0 # SR_LN(R0)
           0.2          0.99          0.86          0.73          1000             6         -2          0          0          0          0          5          0          0 # SR_BH_steep
           0.2           1.9      0.382672           0.4          1000             6         -4          0          0          0          0          5          0          0 # SR_sigmaR
            -5             5             0          -0.5             1             0         -1          0          0          0          0          0          1          1 # SR_regime
            -5             5             0             0             1             6         -4          0          0          0          0          5          0          0 # SR_autocorr
# timevary SR parameters
 -5 5 -0.111104 0 2.5 6 1 # SR_regime_BLK1add_1970
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1995 # first year of main recr_devs; early devs can preceed this era
2019 # last year of main recr_devs; forecast devs start in following year
3 #_recdev phase 
1 # (0/1) to read 13 advanced options
 1990 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 4 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1961 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1999 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2019.4 #_last_yr_fullbias_adj_in_MPD
 2021.3 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS3 sets bias_adj to 0.0 for fcast yrs)
 0.5164 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -10 #min rec_dev
 10 #max rec_dev
 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
# all recruitment deviations
#  1990E 1991E 1992E 1993E 1994E 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015R 2016R 2017R 2018R 2019R 2020F 2021F 2022F 2023F 2024F 2025F 2026F 2027F 2028F 2029F 2030F 2031F
#  -0.390315 -0.158445 0.12323 -0.12231 0.0395078 -0.302536 -0.202258 -0.163021 -0.156924 -0.0243586 -0.12126 -0.12497 -0.299833 0.0947125 0.0053207 0.378559 0.303472 0.0141356 -0.0106535 0.489497 0.422819 0.387374 0.358961 0.480199 0.0203956 0.00206328 -0.255167 -0.271017 -0.214253 -0.81126 -0.560513 -0.151356 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.2 # F ballpark value in units of annual_F
-2010 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope midseason rate; 2=F as parameter; 3=F as hybrid; 4=fleet-specific parm/hybrid (#4 is superset of #2 and #3 and is recommended)
4 # max F (methods 2-4) or harvest fraction (method 1)
5  # N iterations for tuning in hybrid mode; recommend 3 (faster) to 5 (more precise if many fleets)
#
#_initial_F_parms; for each fleet x season that has init_catch; nest season in fleet; count = 3
#_for unconstrained init_F, use an arbitrary initial catch and set lambda=0 for its logL
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
 0 0.2 0.0458275 0.03 1000 6 1 # InitF_seas_1_flt_1F1_EU-ESP
 0 0.2 0.00655077 0.03 1000 6 1 # InitF_seas_1_flt_2F2_JPN
 0 0.2 0.00209414 0.03 1000 6 1 # InitF_seas_1_flt_3F3_CTP
#
# F rates by fleet x season
# Yr:  1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024 2025 2026 2027 2028 2029 2030 2031
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# F1_EU-ESP 0.0466433 0.0439837 0.0521791 0.039053 0.050216 0.0373643 0.0433195 0.0470804 0.0334656 0.0492341 0.052294 0.0600601 0.096292 0.0888564 0.10861 0.151362 0.191419 0.182976 0.115222 0.118731 0.141698 0.147225 0.157153 0.158377 0.19293 0.164675 0.186661 0.180674 0.182157 0.207939 0.152354 0.135252 0.137497 0.145982 0.122483 0.116702 0.118288 0.137983 0.161346 0.168584 0.176287 0.174546 0.167209 0.162538 0.167553 0.166905 0.167501 0.141716 0.11104 0.087041 0.0955036 0.132184 0.132184 0.132184 0.132184 0.132184 0.132184 0.132184 0.132184 0.132184 0.132184
# F2_JPN 0.00329053 0.00436935 0.00170024 0.00886014 0.0112992 0.00289267 0.0083357 0.00848158 0.00231068 0.0122087 0.0159074 0.0135153 0.00896829 0.00655031 0.0100547 0.00851071 0.00938831 0.00825009 0.016696 0.0137875 0.014348 0.0191786 0.0273541 0.0126421 0.0151512 0.0242452 0.0260048 0.0228748 0.0220315 0.0210348 0.0210171 0.0146722 0.0241898 0.0251972 0.0277481 0.0216342 0.0165625 0.021988 0.0196559 0.0183505 0.0142822 0.0146102 0.00837793 0.0194371 0.0228716 0.0238719 0.0257347 0.0245906 0.0236784 0.0141881 0.0123954 0.0167209 0.0167209 0.0167209 0.0167209 0.0167209 0.0167209 0.0167209 0.0167209 0.0167209 0.0167209
# F3_CTP 0.00203043 0.00255932 0.00247024 0.00202675 0.00180048 0.00217072 0.0019874 0.00195446 0.00185178 0.00170284 0.00106746 0.0023515 0.00251185 0.00273151 0.0025272 0.00361822 0.00147561 0.000914339 0.000653003 0.00487618 0.0117044 0.00937427 0.00710351 0.0146694 0.00940733 0.0130454 0.0103128 0.00660077 0.0092343 0.00972034 0.00802818 0.00999945 0.0132042 0.0126407 0.00784953 0.00331668 0.00259302 0.000937474 0.000595337 0.000778178 0.00117337 0.000914606 0.00103383 0.000602292 0.00164669 0.00193594 0.000506126 0.00103151 0.000262691 0.000504822 0.000366362 0.00282512 0.00282512 0.00282512 0.00282512 0.00282512 0.00282512 0.00282512 0.00282512 0.00282512 0.00282512
# F4_USA 0 0 0 0 0 0 0 0 0 0 0.00157958 0.00121361 0.00482811 0.00087787 0.00287099 0.00981807 0.0133077 0.00791971 0.00786775 0.00868085 0.0119143 0.00478001 0.0226695 0.0076529 0.00839852 0.0137569 0.00585875 0.00705717 0.00511717 0.0069733 0.00235161 0.00107968 0 0.00113278 0.00101739 0.000632227 0.000653965 0.00160564 0.00130947 0.00213839 0.00307238 0.0017352 0.00273219 0.00166859 0.00117274 0.000831492 0.000843447 0.000422975 0.000537109 0.000500752 0.00057104 0.00142262 0.00142262 0.00142262 0.00142262 0.00142262 0.00142262 0.00142262 0.00142262 0.00142262 0.00142262
# F5_VEN 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3.42561e-05 5.1838e-05 3.14906e-05 3.54975e-05 3.95344e-05 3.24776e-05 0.000115741 0.000119223 0.000104373 9.69079e-05 3.71784e-05 0.000198367 5.65161e-05 0.00038855 0.000378666 0.000432893 0.000271651 0.0003753 9.56407e-05 0.000266574 0.000110327 0.000177112 7.19882e-05 0.000622201 0.000630788 0.000984768 0.000809696 0.000409361 0.000876588 0.000947996 0.000837556 0.00076934 0.000811233 0.000407628 0.000429467 7.97446e-05 0.000370834 0.000370834 0.000370834 0.000370834 0.000370834 0.000370834 0.000370834 0.000370834 0.000370834 0.000370834
# F6_CAN 0 0 0 1.19342e-05 0.000123845 8.77472e-05 0.000655303 0.0134394 0.017259 0.0104368 0.00317765 0.00320465 0.00580583 0.00289327 0.00351098 0.00282448 0.00139684 0.00987808 0.0102524 0.00712335 0.00853749 0.0152908 0.0212421 0.0160419 0.0195735 0.00736118 0.0124479 0.00966303 0.00883635 0.0101543 0.0188142 0.0132991 0.00555125 0.0152736 0.0169915 0.0131478 0.010149 0 0 0 0 0 0 6.44126e-06 5.69161e-05 0.000179998 0.0004049 0.000995128 5.79017e-05 0.00300903 0.00287061 0.00493107 0.00493107 0.00493107 0.00493107 0.00493107 0.00493107 0.00493107 0.00493107 0.00493107 0.00493107
# F7_CPR 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000160033 0.000352387 0.000548204 0.000558378 0.000208287 0.000687613 0.00124431 0.00136636 0.00304623 0.00166567 0.00234112 0.00184677 0.00214648 0.00221444 0.00288362 0.000800163 0.000636126 0.000379963 0.00075965 0.000657467 0.00211569 0.00110098 7.48461e-06 0.000169439 1.61392e-05 4.05749e-05 0.000135729 0.000518619 1.85491e-05 0.00128157 0.00128157 0.00128157 0.00128157 0.00128157 0.00128157 0.00128157 0.00128157 0.00128157 0.00128157
# F8_BEL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000973189 0.00387122 0.00868711 0.00742725 0.00964627 0.0029694 3.11104e-05 4.09259e-05 0.00143673 0.00228421 0.00268717 0.00218831 0.00254012 0.00271617 0.00271617 0.00271617 0.00271617 0.00271617 0.00271617 0.00271617 0.00271617 0.00271617 0.00271617
# F9_OTH 0 0 0 0 0 0 0 1.0648e-05 3.16661e-05 3.14894e-05 2.64222e-05 2.3515e-05 2.18659e-05 3.94239e-05 0.00011355 0.000153967 0.000224695 0.000335503 0.000320565 0.000550751 0.000822587 0.00128231 0.00160177 0.00192025 0.00169572 0.00183574 0.00149568 0.00122924 0.00378065 0.00375371 0.00256414 0.00643213 0.000646634 0.00106088 0.00116067 0.00326229 0.00984336 0.00747592 0.0164954 0.00156639 0.00535137 0.00428193 0.00876345 0.0131184 0.012094 0.0169133 0.0140157 0.0154925 0.0137459 0.0135275 0.0124571 0.00525941 0.00525941 0.00525941 0.00525941 0.00525941 0.00525941 0.00525941 0.00525941 0.00525941 0.00525941
# F10_EU-POR 0 0 0 0 0 0 0 0 0 0 0 0 0 9.27698e-05 0.000205957 0.00652905 0.015707 0.0107925 0.00551978 0.00656619 0.0112094 0.008349 0.0326562 0.0290262 0.0317864 0.0352708 0.0205073 0.0202514 0.0195438 0.0193849 0.0204965 0.022115 0.0553114 0.0199598 0.0393816 0.0412918 0.0479449 0.0531144 0.0520718 0.0682417 0.053661 0.0304258 0.028608 0.0226102 0.0274501 0.0551035 0.0406453 0.0382811 0.0339422 0.0290593 0.0327352 0.0385793 0.0385793 0.0385793 0.0385793 0.0385793 0.0385793 0.0385793 0.0385793 0.0385793 0.0385793
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
        11         1         0         0         0         1  #  S1_ESP-LL-N
        12         1         0         0         0         1  #  S2_JP-LL-N
        13         1         0         0         0         1  #  S3_CTP-LL-N
        14         1         0         0         0         1  #  S4_US-Obs-E
        15         1         0         0         0         1  #  S5_US-Obs-L
        16         1         0         0         0         1  #  S6_VEN-LL
        17         1         0         0         0         1  #  S7_POR-LL-N
        18         1         0         0         0         1  #  S8_MOR-LL
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -25            25      -6.33697             0             1             0         -1          0          0          0          0          5          0          0  #  LnQ_base_S1_ESP-LL-N(11)
           -25            25      -8.08323             0             1             0         -1          0          0          0          0          5          0          0  #  LnQ_base_S2_JP-LL-N(12)
           -25            25      -8.02969             0             1             0         -1          0          0          0          0          5          0          0  #  LnQ_base_S3_CTP-LL-N(13)
           -25            25      -6.45609             0             1             0         -1          0          0          0          0          5          0          0  #  LnQ_base_S4_US-Obs-E(14)
           -25            25      -6.70515             0             1             0         -1          0          0          0          0          5          0          0  #  LnQ_base_S5_US-Obs-L(15)
           -25            25      -9.84841             0             1             0         -1          0          0          0          0          5          0          0  #  LnQ_base_S6_VEN-LL(16)
           -25            25      -6.15456             0             1             0         -1          0          0          0          0          5          0          0  #  LnQ_base_S7_POR-LL-N(17)
           -25            25      -6.25575             0             1             0         -1          0          0          0          0          5          0          0  #  LnQ_base_S8_MOR-LL(18)
#_no timevary Q parameters
#
#_size_selex_patterns
#Pattern:_0;  parm=0; selex=1.0 for all sizes
#Pattern:_1;  parm=2; logistic; with 95% width specification
#Pattern:_5;  parm=2; mirror another size selex; PARMS pick the min-max bin to mirror
#Pattern:_11; parm=2; selex=1.0  for specified min-max population length bin range
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_6;  parm=2+special; non-parm len selex
#Pattern:_43; parm=2+special+2;  like 6, with 2 additional param for scaling (average over bin range)
#Pattern:_8;  parm=8; double_logistic with smooth transitions and constant above Linf option
#Pattern:_9;  parm=6; simple 4-parm double logistic with starting length; parm 5 is first length; parm 6=1 does desc as offset
#Pattern:_21; parm=2+special; non-parm len selex, read as pairs of size, then selex
#Pattern:_22; parm=4; double_normal as in CASAL
#Pattern:_23; parm=6; double_normal where final value is directly equal to sp(6) so can be >1.0
#Pattern:_24; parm=6; double_normal with sel(minL) and sel(maxL), using joiners
#Pattern:_2;  parm=6; double_normal with sel(minL) and sel(maxL), using joiners, back compatibile version of 24 with 3.30.18 and older
#Pattern:_25; parm=3; exponential-logistic in length
#Pattern:_27; parm=special+3; cubic spline in length; parm1==1 resets knots; parm1==2 resets all 
#Pattern:_42; parm=special+3+2; cubic spline; like 27, with 2 additional param for scaling (average over bin range)
#_discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead;_4=define_dome-shaped_retention
#_Pattern Discard Male Special
 24 0 4 0 # 1 F1_EU-ESP
 24 0 3 0 # 2 F2_JPN
 24 0 3 0 # 3 F3_CTP
 24 0 0 0 # 4 F4_USA
 24 0 3 0 # 5 F5_VEN
 5 0 0 4 # 6 F6_CAN
 24 0 3 0 # 7 F7_CPR
 5 0 0 5 # 8 F8_BEL
 5 0 0 3 # 9 F9_OTH
 24 0 4 0 # 10 F10_EU-POR
 5 0 0 1 # 11 S1_ESP-LL-N
 5 0 0 2 # 12 S2_JP-LL-N
 5 0 0 3 # 13 S3_CTP-LL-N
 5 0 0 4 # 14 S4_US-Obs-E
 5 0 0 4 # 15 S5_US-Obs-L
 5 0 0 5 # 16 S6_VEN-LL
 5 0 0 10 # 17 S7_POR-LL-N
 5 0 0 3 # 18 S8_MOR-LL
#
#_age_selex_patterns
#Pattern:_0; parm=0; selex=1.0 for ages 0 to maxage
#Pattern:_10; parm=0; selex=1.0 for ages 1 to maxage
#Pattern:_11; parm=2; selex=1.0  for specified min-max age
#Pattern:_12; parm=2; age logistic
#Pattern:_13; parm=8; age double logistic. Recommend using pattern 18 instead.
#Pattern:_14; parm=nages+1; age empirical
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_16; parm=2; Coleraine - Gaussian
#Pattern:_17; parm=nages+1; empirical as random walk  N parameters to read can be overridden by setting special to non-zero
#Pattern:_41; parm=2+nages+1; // like 17, with 2 additional param for scaling (average over bin range)
#Pattern:_18; parm=8; double logistic - smooth transition
#Pattern:_19; parm=6; simple 4-parm double logistic with starting age
#Pattern:_20; parm=6; double_normal,using joiners
#Pattern:_26; parm=3; exponential-logistic in age
#Pattern:_27; parm=3+special; cubic spline in age; parm1==1 resets knots; parm1==2 resets all 
#Pattern:_42; parm=2+special+3; // cubic spline; with 2 additional param for scaling (average over bin range)
#Age patterns entered with value >100 create Min_selage from first digit and pattern from remainder
#_Pattern Discard Male Special
 11 0 0 0 # 1 F1_EU-ESP
 11 0 0 0 # 2 F2_JPN
 11 0 0 0 # 3 F3_CTP
 11 0 0 0 # 4 F4_USA
 11 0 0 0 # 5 F5_VEN
 11 0 0 0 # 6 F6_CAN
 11 0 0 0 # 7 F7_CPR
 11 0 0 0 # 8 F8_BEL
 11 0 0 0 # 9 F9_OTH
 11 0 0 0 # 10 F10_EU-POR
 11 0 0 0 # 11 S1_ESP-LL-N
 11 0 0 0 # 12 S2_JP-LL-N
 11 0 0 0 # 13 S3_CTP-LL-N
 11 0 0 0 # 14 S4_US-Obs-E
 11 0 0 0 # 15 S5_US-Obs-L
 11 0 0 0 # 16 S6_VEN-LL
 11 0 0 0 # 17 S7_POR-LL-N
 11 0 0 0 # 18 S8_MOR-LL
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   F1_EU-ESP LenSelex
            35           370       93.0938           113          0.05             1          2          0          0          0          0          0          0          0  #  Size_DblN_peak_F1_EU-ESP(1)
            -6             4      -2.59224            -6          0.05             1          3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_F1_EU-ESP(1)
            -1             9       4.48516           6.2          0.05             1          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_F1_EU-ESP(1)
            -1             9        4.9767             9          0.05             1          3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_F1_EU-ESP(1)
           -15             9           -15           -15          0.05             1         -2          0          0          0          0          0          0          0  #  Size_DblN_start_logit_F1_EU-ESP(1)
           -15             9       6.99543           -15          0.05             1          2          0          0          0          0          0          0          0  #  Size_DblN_end_logit_F1_EU-ESP(1)
          -100           100        10.862             0          1000             6          4          0          0          0          0          0          0          0  #  SzSel_Fem_Peak_F1_EU-ESP(1)
           -15            15      0.996368             0          1000             6          4          0          0          0          0          0          0          0  #  SzSel_Fem_Ascend_F1_EU-ESP(1)
           -15            15       4.63989             0          1000             6          4          0          0          0          0          0          0          0  #  SzSel_Fem_Descend_F1_EU-ESP(1)
           -15            15      -14.3873             0          1000             6          4          0          0          0          0          0          0          0  #  SzSel_Fem_Final_F1_EU-ESP(1)
             0             1      0.824242             1          1000             6          5          0          0          0          0          0          0          0  #  SzSel_Fem_Scale_F1_EU-ESP(1)
# 2   F2_JPN LenSelex
            35           370        171.47         167.8          0.05             1          2          0          0          0          0          0          0          0  #  Size_DblN_peak_F2_JPN(2)
            -6             4             4             4          0.05             1         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_F2_JPN(2)
            -1             9       7.51496           7.6          0.05             1          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_F2_JPN(2)
            -1             9            -1            -1          0.05             1         -3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_F2_JPN(2)
           -15             9           -15           -15          0.05             1         -2          0          0          0          0          0          0          0  #  Size_DblN_start_logit_F2_JPN(2)
           -15             9             9             9          0.05             1         -2          0          0          0          0          0          0          0  #  Size_DblN_end_logit_F2_JPN(2)
          -100           100       52.2959             0          1000             6          4          0          0          0          0          0          0          0  #  SzSel_Male_Peak_F2_JPN(2)
           -15            15       1.02663             0          1000             6          4          0          0          0          0          0          0          0  #  SzSel_Male_Ascend_F2_JPN(2)
           -15            15             0             0          1000             6         -4          0          0          0          0          0          0          0  #  SzSel_Male_Descend_F2_JPN(2)
           -15            15             0             0          1000             6         -4          0          0          0          0          0          0          0  #  SzSel_Male_Final_F2_JPN(2)
             0             1      0.852653             1          1000             6          5          0          0          0          0          0          0          0  #  SzSel_Male_Scale_F2_JPN(2)
# 3   F3_CTP LenSelex
            35           370       183.451         194.9          0.05             1          2          0          0          0          0          0          0          0  #  Size_DblN_peak_F3_CTP(3)
            -6             4             4             4          0.05             1         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_F3_CTP(3)
            -1             9       5.05517           6.9          0.05             1          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_F3_CTP(3)
            -1             9            -1            -1          0.05             1         -3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_F3_CTP(3)
           -15             9           -15           -15          0.05             1         -2          0          0          0          0          0          0          0  #  Size_DblN_start_logit_F3_CTP(3)
           -15             9             9             9          0.05             1         -2          0          0          0          0          0          0          0  #  Size_DblN_end_logit_F3_CTP(3)
          -100           100       19.6302             0          1000             6          4          0          0          0          0          0          0          0  #  SzSel_Male_Peak_F3_CTP(3)
           -15            15       1.39821             0          1000             6          4          0          0          0          0          0          0          0  #  SzSel_Male_Ascend_F3_CTP(3)
           -15            15             0             0          1000             6         -4          0          0          0          0          0          0          0  #  SzSel_Male_Descend_F3_CTP(3)
           -15            15             0             0          1000             6         -4          0          0          0          0          0          0          0  #  SzSel_Male_Final_F3_CTP(3)
             0             1      0.966698             1          1000             6          5          0          0          0          0          0          0          0  #  SzSel_Male_Scale_F3_CTP(3)
# 4   F4_USA LenSelex
            35           370       121.949         124.9          0.05             1          2          0          0          0          0          0          0          0  #  Size_DblN_peak_F4_USA(4)
            -6             4      -5.37791            -6          0.05             1          3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_F4_USA(4)
            -1             9       6.97907           6.7          0.05             1          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_F4_USA(4)
            -1             9       7.38981           8.3          0.05             1          3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_F4_USA(4)
           -15             9           -15           -15          0.05             1         -2          0          0          0          0          0          0          0  #  Size_DblN_start_logit_F4_USA(4)
           -15             9      -1.96402           -15          0.05             1          2          0          0          0          0          0          0          0  #  Size_DblN_end_logit_F4_USA(4)
# 5   F5_VEN LenSelex
            35           370       214.499         199.2          0.05             1          2          0          0          0          0          0          0          0  #  Size_DblN_peak_F5_VEN(5)
            -6             4             4             4          0.05             1         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_F5_VEN(5)
            -1             9       7.92542           7.8          0.05             1          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_F5_VEN(5)
            -1             9            -1            -1          0.05             1         -3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_F5_VEN(5)
           -15             9           -15           -15          0.05             1         -2          0          0          0          0          0          0          0  #  Size_DblN_start_logit_F5_VEN(5)
           -15             9             9             9          0.05             1         -2          0          0          0          0          0          0          0  #  Size_DblN_end_logit_F5_VEN(5)
          -100           100       46.0828             0          1000             6          4          0          0          0          0          0          0          0  #  SzSel_Male_Peak_F5_VEN(5)
           -15            15      0.815924             0          1000             6          4          0          0          0          0          0          0          0  #  SzSel_Male_Ascend_F5_VEN(5)
           -15            15             0             0          1000             6         -4          0          0          0          0          0          0          0  #  SzSel_Male_Descend_F5_VEN(5)
           -15            15             0             0          1000             6         -4          0          0          0          0          0          0          0  #  SzSel_Male_Final_F5_VEN(5)
             0             1      0.945841             1          1000             6          5          0          0          0          0          0          0          0  #  SzSel_Male_Scale_F5_VEN(5)
# 6   F6_CAN LenSelex
             0            10             1             1            25             0        -99          0          0          0          0          5          0          0  #  SizeSel_P1_F6_CAN(6)
            10           100            36            36            25             0        -99          0          0          0          0          5          0          0  #  SizeSel_P2_F6_CAN(6)
# 7   F7_CPR LenSelex
            35           370       133.655         137.9          0.05             1          2          0          0          0          0          0          0          0  #  Size_DblN_peak_F7_CPR(7)
            -6             4     -0.733142            -6          0.05             1          3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_F7_CPR(7)
            -1             9       6.43286           7.1          0.05             1          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_F7_CPR(7)
            -1             9       5.32983           8.7          0.05             1          3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_F7_CPR(7)
           -15             9           -15           -15          0.05             1         -2          0          0          0          0          0          0          0  #  Size_DblN_start_logit_F7_CPR(7)
           -15             9      -4.68793           0.3          0.05             1          2          0          0          0          0          0          0          0  #  Size_DblN_end_logit_F7_CPR(7)
          -100           100      -10.9816             0          1000             6          4          0          0          0          0          0          0          0  #  SzSel_Male_Peak_F7_CPR(7)
           -15            15     -0.226817             0          1000             6          4          0          0          0          0          0          0          0  #  SzSel_Male_Ascend_F7_CPR(7)
           -15            15       2.25497             0          1000             6          4          0          0          0          0          0          0          0  #  SzSel_Male_Descend_F7_CPR(7)
           -15            15      -3.02736             0          1000             6          4          0          0          0          0          0          0          0  #  SzSel_Male_Final_F7_CPR(7)
             0             1      0.857648             1          1000             6          5          0          0          0          0          0          0          0  #  SzSel_Male_Scale_F7_CPR(7)
# 8   F8_BEL LenSelex
             0            10             1             1            25             0        -99          0          0          0          0          5          0          0  #  SizeSel_P1_F8_BEL(8)
            10           100            36            36            25             0        -99          0          0          0          0          5          0          0  #  SizeSel_P2_F8_BEL(8)
# 9   F9_OTH LenSelex
             0            10             1             1            25             0        -99          0          0          0          0          5          0          0  #  SizeSel_P1_F9_OTH(9)
            10           100            36            36            25             0        -99          0          0          0          0          5          0          0  #  SizeSel_P2_F9_OTH(9)
# 10   F10_EU-POR LenSelex
            35           370       223.153         106.5          0.05             1          2          0          0          0          0          0          0          0  #  Size_DblN_peak_F10_EU-POR(10)
            -6             4             4             4          0.05             1         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_F10_EU-POR(10)
            -1             9       8.61046           5.4          0.05             1          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_F10_EU-POR(10)
            -1             9            -1            -1          0.05             1         -3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_F10_EU-POR(10)
           -15             9           -15           -15          0.05             1         -2          0          0          0          0          0          0          0  #  Size_DblN_start_logit_F10_EU-POR(10)
           -15             9             9             9          0.05             1         -2          0          0          0          0          0          0          0  #  Size_DblN_end_logit_F10_EU-POR(10)
          -100           100       1.81416             0          1000             6          4          0          0          0          0          0          0          0  #  SzSel_Fem_Peak_F10_EU-POR(10)
           -15            15     0.0948899             0          1000             6          4          0          0          0          0          0          0          0  #  SzSel_Fem_Ascend_F10_EU-POR(10)
           -15            15             0             0          1000             6         -4          0          0          0          0          0          0          0  #  SzSel_Fem_Descend_F10_EU-POR(10)
           -15            15             0             0          1000             6         -4          0          0          0          0          0          0          0  #  SzSel_Fem_Final_F10_EU-POR(10)
             0             1      0.692869             1          1000             6          5          0          0          0          0          0          0          0  #  SzSel_Fem_Scale_F10_EU-POR(10)
# 11   S1_ESP-LL-N LenSelex
             0            10             1             1            25             0        -99          0          0          0          0          5          0          0  #  SizeSel_P1_S1_ESP-LL-N(11)
            10           100            36            36            25             0        -99          0          0          0          0          5          0          0  #  SizeSel_P2_S1_ESP-LL-N(11)
# 12   S2_JP-LL-N LenSelex
             0            10             1             1            25             0        -99          0          0          0          0          5          0          0  #  SizeSel_P1_S2_JP-LL-N(12)
            10           100            36            36            25             0        -99          0          0          0          0          5          0          0  #  SizeSel_P2_S2_JP-LL-N(12)
# 13   S3_CTP-LL-N LenSelex
             0            10             1             1            25             0        -99          0          0          0          0          5          0          0  #  SizeSel_P1_S3_CTP-LL-N(13)
            10           100            36            36            25             0        -99          0          0          0          0          5          0          0  #  SizeSel_P2_S3_CTP-LL-N(13)
# 14   S4_US-Obs-E LenSelex
             0            10             1             1            25             0        -99          0          0          0          0          5          0          0  #  SizeSel_P1_S4_US-Obs-E(14)
            10           100            36            36            25             0        -99          0          0          0          0          5          0          0  #  SizeSel_P2_S4_US-Obs-E(14)
# 15   S5_US-Obs-L LenSelex
             0            10             1             1            25             0        -99          0          0          0          0          5          0          0  #  SizeSel_P1_S5_US-Obs-L(15)
            10           100            36            36            25             0        -99          0          0          0          0          5          0          0  #  SizeSel_P2_S5_US-Obs-L(15)
# 16   S6_VEN-LL LenSelex
             0            10             1             1            25             0        -99          0          0          0          0          5          0          0  #  SizeSel_P1_S6_VEN-LL(16)
            10           100            36            36            25             0        -99          0          0          0          0          5          0          0  #  SizeSel_P2_S6_VEN-LL(16)
# 17   S7_POR-LL-N LenSelex
             0            10             1             1            25             0        -99          0          0          0          0          5          0          0  #  SizeSel_P1_S7_POR-LL-N(17)
            10           100            36            36            25             0        -99          0          0          0          0          5          0          0  #  SizeSel_P2_S7_POR-LL-N(17)
# 18   S8_MOR-LL LenSelex
             0            10             1             1            25             0        -99          0          0          0          0          5          0          0  #  SizeSel_P1_S8_MOR-LL(18)
            10           100            36            36            25             0        -99          0          0          0          0          5          0          0  #  SizeSel_P2_S8_MOR-LL(18)
# 1   F1_EU-ESP AgeSelex
             0            10             0             0            25             0        -99          0          0          0          0          5          0          0  #  minage@sel=1_F1_EU-ESP(1)
            10           100            30            31            25             0        -99          0          0          0          0          5          0          0  #  maxage@sel=1_F1_EU-ESP(1)
# 2   F2_JPN AgeSelex
             0            10             0             0            25             0        -99          0          0          0          0          5          0          0  #  minage@sel=1_F2_JPN(2)
            10           100            30            31            25             0        -99          0          0          0          0          5          0          0  #  maxage@sel=1_F2_JPN(2)
# 3   F3_CTP AgeSelex
             0            10             0             0            25             0        -99          0          0          0          0          5          0          0  #  minage@sel=1_F3_CTP(3)
            10           100            30            31            25             0        -99          0          0          0          0          5          0          0  #  maxage@sel=1_F3_CTP(3)
# 4   F4_USA AgeSelex
             0            10             0             0            25             0        -99          0          0          0          0          5          0          0  #  minage@sel=1_F4_USA(4)
            10           100            30            31            25             0        -99          0          0          0          0          5          0          0  #  maxage@sel=1_F4_USA(4)
# 5   F5_VEN AgeSelex
             0            10             0             0            25             0        -99          0          0          0          0          5          0          0  #  minage@sel=1_F5_VEN(5)
            10           100            30            31            25             0        -99          0          0          0          0          5          0          0  #  maxage@sel=1_F5_VEN(5)
# 6   F6_CAN AgeSelex
             0            10             0             0            25             0        -99          0          0          0          0          5          0          0  #  minage@sel=1_F6_CAN(6)
            10           100            30            31            25             0        -99          0          0          0          0          5          0          0  #  maxage@sel=1_F6_CAN(6)
# 7   F7_CPR AgeSelex
             0            10             0             0            25             0        -99          0          0          0          0          5          0          0  #  minage@sel=1_F7_CPR(7)
            10           100            30            31            25             0        -99          0          0          0          0          5          0          0  #  maxage@sel=1_F7_CPR(7)
# 8   F8_BEL AgeSelex
             0            10             0             0            25             0        -99          0          0          0          0          5          0          0  #  minage@sel=1_F8_BEL(8)
            10           100            30            31            25             0        -99          0          0          0          0          5          0          0  #  maxage@sel=1_F8_BEL(8)
# 9   F9_OTH AgeSelex
             0            10             0             0            25             0        -99          0          0          0          0          5          0          0  #  minage@sel=1_F9_OTH(9)
            10           100            30            31            25             0        -99          0          0          0          0          5          0          0  #  maxage@sel=1_F9_OTH(9)
# 10   F10_EU-POR AgeSelex
             0            10             0             0            25             0        -99          0          0          0          0          5          0          0  #  minage@sel=1_F10_EU-POR(10)
            10           100            30            31            25             0        -99          0          0          0          0          5          0          0  #  maxage@sel=1_F10_EU-POR(10)
# 11   S1_ESP-LL-N AgeSelex
             0            10             0             0            25             0        -99          0          0          0          0          5          0          0  #  minage@sel=1_S1_ESP-LL-N(11)
            10           100            30            31            25             0        -99          0          0          0          0          5          0          0  #  maxage@sel=1_S1_ESP-LL-N(11)
# 12   S2_JP-LL-N AgeSelex
             0            10             0             0            25             0        -99          0          0          0          0          5          0          0  #  minage@sel=1_S2_JP-LL-N(12)
            10           100            30            31            25             0        -99          0          0          0          0          5          0          0  #  maxage@sel=1_S2_JP-LL-N(12)
# 13   S3_CTP-LL-N AgeSelex
             0            10             0             0            25             0        -99          0          0          0          0          5          0          0  #  minage@sel=1_S3_CTP-LL-N(13)
            10           100            30            31            25             0        -99          0          0          0          0          5          0          0  #  maxage@sel=1_S3_CTP-LL-N(13)
# 14   S4_US-Obs-E AgeSelex
             0            10             0             0            25             0        -99          0          0          0          0          5          0          0  #  minage@sel=1_S4_US-Obs-E(14)
            10           100            30            31            25             0        -99          0          0          0          0          5          0          0  #  maxage@sel=1_S4_US-Obs-E(14)
# 15   S5_US-Obs-L AgeSelex
             0            10             0             0            25             0        -99          0          0          0          0          5          0          0  #  minage@sel=1_S5_US-Obs-L(15)
            10           100            30            31            25             0        -99          0          0          0          0          5          0          0  #  maxage@sel=1_S5_US-Obs-L(15)
# 16   S6_VEN-LL AgeSelex
             0            10             0             0            25             0        -99          0          0          0          0          5          0          0  #  minage@sel=1_S6_VEN-LL(16)
            10           100            30            31            25             0        -99          0          0          0          0          5          0          0  #  maxage@sel=1_S6_VEN-LL(16)
# 17   S7_POR-LL-N AgeSelex
             0            10             0             0            25             0        -99          0          0          0          0          5          0          0  #  minage@sel=1_S7_POR-LL-N(17)
            10           100            30            31            25             0        -99          0          0          0          0          5          0          0  #  maxage@sel=1_S7_POR-LL-N(17)
# 18   S8_MOR-LL AgeSelex
             0            10             0             0            25             0        -99          0          0          0          0          5          0          0  #  minage@sel=1_S8_MOR-LL(18)
            10           100            30            31            25             0        -99          0          0          0          0          5          0          0  #  maxage@sel=1_S8_MOR-LL(18)
#_No_Dirichlet parameters
#_no timevary selex parameters
#
0   #  use 2D_AR1 selectivity(0/1)
#_no 2D_AR1 selex offset used
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read and autogen if tag data exist; 1=read
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# deviation vectors for timevary parameters
#  base   base first block   block  env  env   dev   dev   dev   dev   dev
#  type  index  parm trend pattern link  var  vectr link _mnyr  mxyr phase  dev_vector
#      2     4     1     1     1     0     0     0     0     0     0     0
     #
# Input variance adjustments factors: 
 #_1=add_to_survey_CV
 #_2=add_to_discard_stddev
 #_3=add_to_bodywt_CV
 #_4=mult_by_lencomp_N
 #_5=mult_by_agecomp_N
 #_6=mult_by_size-at-age_N
 #_7=mult_by_generalized_sizecomp
#_Factor  Fleet  Value
      4      1   3.78069
      4      2   1.12743
      4      3   1.90786
      4      4   2.63527
      4      5  0.723779
      4      7   1.17626
      4     10  0.555908
      1     11   0.17162
      1     12   0.05393
      1     13   0.56227
      1     14         0
      1     15         0
      1     16         0
      1     17   0.12175
      1     18   0.14027
 -9999   1    0  # terminator
#
1 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 25 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
 1 11 1 1 1
 1 12 1 1 1
 1 13 1 1 1
 1 14 1 1 1
 1 15 1 1 1
 1 16 1 1 1
 1 17 1 1 1
 1 18 1 1 1
 4 1 1 1 1
 4 2 1 1 1
 4 3 1 1 1
 4 4 1 1 1
 4 5 1 1 1
 4 7 1 1 1
 4 8 1 1 1
 4 9 1 1 1
 4 10 1 1 1
 9 1 1 1 1
 9 2 1 1 1
 9 3 1 1 1
 10 1 1 1 1
 11 1 1 1 1
 12 1 1 1 1
 13 1 1 1 1
 17 1 1 0 1
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 #_CPUE/survey:_1
#  0 #_CPUE/survey:_2
#  0 #_CPUE/survey:_3
#  0 #_CPUE/survey:_4
#  0 #_CPUE/survey:_5
#  0 #_CPUE/survey:_6
#  0 #_CPUE/survey:_7
#  0 #_CPUE/survey:_8
#  0 #_CPUE/survey:_9
#  0 #_CPUE/survey:_10
#  1 #_CPUE/survey:_11
#  1 #_CPUE/survey:_12
#  1 #_CPUE/survey:_13
#  1 #_CPUE/survey:_14
#  1 #_CPUE/survey:_15
#  1 #_CPUE/survey:_16
#  1 #_CPUE/survey:_17
#  1 #_CPUE/survey:_18
#  1 #_lencomp:_1
#  1 #_lencomp:_2
#  1 #_lencomp:_3
#  1 #_lencomp:_4
#  1 #_lencomp:_5
#  0 #_lencomp:_6
#  1 #_lencomp:_7
#  0 #_lencomp:_8
#  0 #_lencomp:_9
#  1 #_lencomp:_10
#  0 #_lencomp:_11
#  0 #_lencomp:_12
#  0 #_lencomp:_13
#  0 #_lencomp:_14
#  0 #_lencomp:_15
#  0 #_lencomp:_16
#  0 #_lencomp:_17
#  0 #_lencomp:_18
#  1 #_init_equ_catch1
#  1 #_init_equ_catch2
#  1 #_init_equ_catch3
#  1 #_init_equ_catch4
#  1 #_init_equ_catch5
#  1 #_init_equ_catch6
#  1 #_init_equ_catch7
#  1 #_init_equ_catch8
#  1 #_init_equ_catch9
#  1 #_init_equ_catch10
#  1 #_init_equ_catch11
#  1 #_init_equ_catch12
#  1 #_init_equ_catch13
#  1 #_init_equ_catch14
#  1 #_init_equ_catch15
#  1 #_init_equ_catch16
#  1 #_init_equ_catch17
#  1 #_init_equ_catch18
#  1 #_recruitments
#  1 #_parameter-priors
#  1 #_parameter-dev-vectors
#  1 #_crashPenLambda
#  0 # F_ballpark_lambda
0 # (0/1/2) read specs for more stddev reporting: 0 = skip, 1 = read specs for reporting stdev for selectivity, size, and numbers, 2 = add options for M,Dyn. Bzero, SmryBio
 # 0 2 0 0 # Selectivity: (1) fleet, (2) 1=len/2=age/3=both, (3) year, (4) N selex bins
 # 0 0 # Growth: (1) growth pattern, (2) growth ages
 # 0 0 0 # Numbers-at-age: (1) area(-1 for all), (2) year, (3) N ages
 # -1 # list of bin #'s for selex std (-1 in first bin to self-generate)
 # -1 # list of ages for growth std (-1 in first bin to self-generate)
 # -1 # list of ages for NatAge std (-1 in first bin to self-generate)
999

