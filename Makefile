
.PHONY: pkg inst remove aareload

pkg: cat sc *.R
	(rm PhyloSimSource.R;true)
	cp PAMLdat/*.dat inst/extdata/
	cp RData/* data/
	R CMD build --compact-vignettes=both .
inst: pkg
	R CMD INSTALL .
remove:
	R CMD REMOVE phylosim
aareload: cat
	(rm RData/*;true)
	R --vanilla < misc/recreate_aamodels.R
	R --vanilla < misc/recreate_codonmodels.R

