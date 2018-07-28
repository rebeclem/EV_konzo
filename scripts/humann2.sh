#!/bin/bash
#SBATCH -N 1
#SBATCH -t 2-00:00:00
#SBATCH -J HUMAnN2
#SBATCH -p defq,short,gpu
#SBATCH --array=1-88
#SBATCH -o h2_%A_%a.out
#SBATCH -e h2_%A_%a.err

name=$(sed -n "$SLURM_ARRAY_TASK_ID"p ../humann_list.txt)

########################
#Run the scripts in the following order
#humann2.sh
#h2_renorm.sh
#h2_join_tab.sh
#h2_associate.sh
#h2_regroup_go.sh
#h2_go_associate.sh
########################

module load python/2.7.6
module load metaPhlAn/2.0
module load minpath/1.2

#--- Start the timer
t1=$(date +"%s")

echo ${name}

cd ${name}

cat flexcleaned_1.fastq flexcleaned_2.fastq > combined_flex.fastq
humann2 --threads $(nproc) \
 --input combined_flex.fastq \
 --output humann2_full \
 --output-basename ${name} \
 --nucleotide-database /groups/cbi/shared/References/chocophlan/chocophlan \
 --protein-database /groups/cbi/shared/References/uniref90/uniref


#---Complete job
t2=$(date +"%s")
diff=$(($t2-$t1))
echo "[---$SN---] ($(date)) $(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed."
echo "[---$SN---] ($(date)) $SN COMPLETE."

