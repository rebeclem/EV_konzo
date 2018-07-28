#!/bin/bash
#SBATCH -N 1
#SBATCH -t 00:30:00
#SBATCH -J HUMAnN2
#SBATCH -p defq,short,gpu
#SBATCH -o h2j_%A.out
#SBATCH -e h2j_%A.err

module load python/2.7.6
module load metaPhlAn/2.0
module load minpath/1.2

#--- Start the timer
t1=$(date +"%s")

cd humann2_results


OUTPUT_DIR=$(pwd)

humann2_join_tables --input $OUTPUT_DIR \
 --output humann2_genefamilies.tsv \
 --file_name genefamilies_relab


humann2_join_tables --input $OUTPUT_DIR \
 --output humann2_pathcoverage.tsv \
 --file_name pathcoverage


humann2_join_tables --input $OUTPUT_DIR \
 --output humann2_pathabundance.tsv \
 --file_name pathabundance_relab



#---Complete job
t2=$(date +"%s")
diff=$(($t2-$t1))
echo "[---$SN---] ($(date)) $(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed."
echo "[---$SN---] ($(date)) $SN COMPLETE."
