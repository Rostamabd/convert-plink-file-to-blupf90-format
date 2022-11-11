# convert-plink-file-to-blupf90-format
if you are working with a genotype data in Plink format (binary) or txt format, you might want to use blupf90 for genomic prediction or ssGBLUP GWAS,
In this case, the shell script provided here can be useful for you

The defalut here is that your plink file is in binary format and the name of plink file is "QC_gens.*"
Make sure all your plink files are located in the current working directory along with this shell script

Run it as following:

bash convert_2_blupf90.sh
