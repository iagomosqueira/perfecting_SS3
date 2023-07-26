# perfewct.R - DESC
# /home/mosqu003/Active/FLR/ss3_perfect_run/perfewct.R

# Copyright (c) WUR, 2023.
# Author: Iago MOSQUEIRA (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the EUPL-1.2


library(ss3om)
library(r4ss)

# LOAD data & output

dat <- SS_readdat_3.30("run/data.ss")
out <- SS_output("run")


# - BASE CASE

base <- readFLSss3("run")


# - SET perfect catch

# dat$catch: year seas fleet catch catch_se
#  


# - SET perfect index

# dat$CPUE: year seas index *obs* se_log
# out$cpue: Fleet Yr [...] *Obs*

dat$CPUE[, 'obs'] <- out$cpue[, 'Exp']

copy_SS_inputs("run", "perfect_cpue")
SS_writedat(dat, outfile=file.path("perfect_cpue", "data.ss"), overwrite=TRUE)

per_cpue <- readFLSss3("perfect_cpue")

plot(base, per_cpue)


