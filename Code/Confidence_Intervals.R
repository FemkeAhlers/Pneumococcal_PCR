# Exact binomial 95% confidence intervals were calculated around the *in silico* positivity rates and *in vitro* sensitivity and specificity

# Load R library

library(binom)


# Table 1: Exact binomial 95% confidence intervals were calculated around the *in silico* positivity rates in the pneumococcal genome dataset (n=7,547). 

#lytA-CDC
binom.test(7304,7547, conf.level = 0.95)
#piaB
binom.test(7427,7547, conf.level = 0.95)
#ply
binom.test(7544,7547, conf.level = 0.95)
#psaA
binom.test(7520,7547, conf.level = 0.95)
#Spn9802
binom.test(7488,7547, conf.level = 0.95)
#SP2020
binom.test(7518,7547, conf.level = 0.95)
#Xisco
binom.test(7541,7547, conf.level = 0.95)

#SP2020_new
binom.test(7518,7547, conf.level = 0.95)
#Xisco_1
binom.test(7541,7547, conf.level = 0.95)
#Xisco_2
binom.test(7543,7547, conf.level = 0.95)
#Xisco_3
binom.test(7541,7547, conf.level = 0.95)


# Table 2 : Exact binomial 95% confidence intervals were calculated around the *in silico* negativity rates in the non-pneumococcal Streptococcus dataset (n=1,825).

#lytA-CDC
binom.test(1822,1825, conf.level = 0.95)
#piaB
binom.test(1822,1825, conf.level = 0.95)
#ply
binom.test(1743,1825, conf.level = 0.95)
#psaA
binom.test(1808,1825, conf.level = 0.95)
#Spn9802
binom.test(1752,1825, conf.level = 0.95)
#SP2020
binom.test(1824,1825, conf.level = 0.95)
#Xisco
binom.test(1825,1825, conf.level = 0.95)


#SP2020_new
binom.test(1824,1825, conf.level = 0.95)
#Xisco_1
binom.test(1825,1825, conf.level = 0.95)
#Xisco_2
binom.test(1825,1825, conf.level = 0.95)
#Xisco_3
binom.test(1825,1825, conf.level = 0.95)


# Supplementary Table 4 : Exact binomial 95% confidence intervals were calculated around the *in silico* positivity rates of the pneumococcal genomes from UKHSA (n=6,090). 

#lytA-CDC
binom.test(6019,6090, conf.level = 0.95)
#piaB
binom.test(6006,6090, conf.level = 0.95)
#SP2020_new
binom.test(6078,6090, conf.level = 0.95)
#Xisco_1
binom.test(6090,6090, conf.level = 0.95)
#Xisco_2
binom.test(6090,6090, conf.level = 0.95)
#Xisco_3
binom.test(6089,6090, conf.level = 0.95)


