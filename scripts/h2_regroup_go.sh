#!/bin/bash
#SBATCH -N 1
#SBATCH -t 00:40:00
#SBATCH -J HUMAnN2
#SBATCH -p defq,short,gpu
#SBATCH -o h2rg_%A.out
#SBATCH -e h2rg_%A.err


module load python/2.7.6
module load metaPhlAn/2.0
module load minpath/1.2

#--- Start the timer
t1=$(date +"%s")

cd humann2_results


OUTPUT_DIR=$(pwd)
DB='/groups/cbi/shared/References/humann2_utility/utility_mapping/map_go_uniref90.txt.gz'


humann2_regroup_table --input ${OUTPUT_DIR}/humann2_pathabundance.tsv \
 -c $DB \
 --output humann2_pathabundance_go.tsv \
 --precision 8


humann2_regroup_table --input ${OUTPUT_DIR}/humann2_genefamilies.tsv \
 -c $DB \
 --output humann2_genefamilies_go.tsv \
 --precision 8



#---Complete job
t2=$(date +"%s")
diff=$(($t2-$t1))
echo "[---$SN---] ($(date)) $(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed."
echo "[---$SN---] ($(date)) $SN COMPLETE."
