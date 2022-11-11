
### convert to blupf90 format

### 1) convert to 0. 1 and 2 format (Additive coding)

plink1 --bfile QC_gens --allow-extra-chr --chr-set 40 --allow-no-sex --nonfounders --recodeA --out gens

### move headers 9SNP names) t a new file
sed -n '1p' gens.raw |fmt -1 > header.txt

### Delete the first line which is header here from the genotype data
sed -i 1d gens.raw

### remove the space between columns and create the new genotype format

paste -d' ' <(cut -d' ' -f2 gens.raw) <(cut -d' ' -f7- gens.raw |sed 's/ //g'|sed 's/9/5/g') >  gens.txt

###Replace NA with 5
sed -i 's/NA/5/g' gens.txt

### extract the pedigree from plink genotype file, (You might not  need this pedigree file and you have a deeper and more complete pedigree file) 
cut -d' ' -f2-4 gens.raw > pedig.txt

### convert map file to blupf90 format
awk -F' '  '{print NR,$1,$4}' QC_gens.bim > mapfile.txt

#Add header to the mapfile
echo "SNP_ID" "CHR" "POS" >> mapcolname.txt
cat mapfile.txt >>  mapcolname.txt
mv mapcolname.txt mapfile.txt

### remove chr 0
awk '$2==0 {$2=40}1' mapfile.txt > dd
mv dd mapfile.txt

## prepare data file and run blupf90 family programs

### do housekeeping, such as removing redundant files or moving files to local computer or vise versa
