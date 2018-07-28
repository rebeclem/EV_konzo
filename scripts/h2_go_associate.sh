#!/bin/bash
#SBATCH -N 1
#SBATCH -t 00:10:00
#SBATCH -J HUMAnN2
#SBATCH -p defq,short,gpu
#SBATCH -o h2go_%A.out
#SBATCH -e h2go_%A.err

module load python/2.7.6
module load metaPhlAn/2.0
module load minpath/1.2

#--- Start the timer
t1=$(date +"%s")

cd humann2_results

OUTPUT_DIR=$(pwd)

humann2_associate --input edited_humann2_pathabundance_go.tsv \
 --last-metadatum STATUS \
 --focal-metadatum STATUS \
 --focal-type categorical \
 --output stats_pathabun_go.txt



humann2_associate --input edited_humann2_genefamilies_go.tsv \
 --last-metadatum STATUS \
 --focal-metadatum STATUS \
 --focal-type categorical \
 --output stats_genefamilies_go.txt



#---Complete job
t2=$(date +"%s")
diff=$(($t2-$t1))
echo "[---$SN---] ($(date)) $(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed."
echo "[---$SN---] ($(date)) $SN COMPLETE."


