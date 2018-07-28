#!/bin/bash
#SBATCH -N 1
#SBATCH -t 01:00:00
#SBATCH -J HUMAnN2
#SBATCH -p defq,short
#SBATCH -o h2a_%A.out
#SBATCH -e h2a_%A.err


module load python/2.7.6
module load metaPhlAn/2.0
module load minpath/1.2

#--- Start the timer
t1=$(date +"%s")


cd humann2_results

OUTPUT_DIR=$(pwd)

humann2_associate --input edited_humann2_pathabundance.tsv \
 --last-metadatum STATUS \
 --focal-metadatum STATUS \
 --focal-type categorical \
 --output stats_pathabun_test.txt


humann2_associate --input edited_humann2_genefamilies.tsv \
 --last-metadatum STATUS \
 --focal-metadatum STATUS \
 --focal-type categorical \
 --output stats_genefamilies_test.txt


humann2_associate --input edited_humann2_pathcoverage.tsv \
 --last-metadatum STATUS \
 --focal-metadatum STATUS \
 --focal-type categorical \
 --output stats_pathcoverage_test.txt


#---Complete job
t2=$(date +"%s")
diff=$(($t2-$t1))
echo "[---$SN---] ($(date)) $(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed."
echo "[---$SN---] ($(date)) $SN COMPLETE."
