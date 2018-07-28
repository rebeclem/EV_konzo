#!/bin/bash
#SBATCH -N 1
#SBATCH -t 10:00:00
#SBATCH -J HUMAnN2
#SBATCH -p defq,short,gpu
#SBATCH --array=1-88
#SBATCH -o h2rn_%A_%a.out
#SBATCH -e h2rn_%A_%a.err

name=$(sed -n "$SLURM_ARRAY_TASK_ID"p ../humann_list.txt)

module load python/2.7.6
module load metaPhlAn/2.0
module load minpath/1.2

#--- Start the timer
t1=$(date +"%s")

echo ${name}
cd ${name}/humann2_full

humann2_renorm_table --input ${name}_genefamilies.tsv \
 --output ${name}_genefamilies_relab.tsv \
 --units relab

humann2_renorm_table --input ${name}_pathabundance.tsv \
 --output ${name}_pathabundance_relab.tsv \
 --units relab

cp *.tsv ../../humann2_results

#---Complete job
t2=$(date +"%s")
diff=$(($t2-$t1))
echo "[---$SN---] ($(date)) $(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed."
echo "[---$SN---] ($(date)) $SN COMPLETE."
