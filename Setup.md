# Working Pipeline for Vilain's group
# Part 1 - Setup

## Setting up Samples in Colonial one
You will start with your raw sequence files. These are the bash scripts I used to set up the directory and samples. 
<br />

#### *Creating a directory for each sample.*
```
for f in Konzo*L001_R1*.gz; do 
    samp=${f%%_*}
    echo $samp
    mkdir -p $samp
done
```
#### *Moving all sequence files into sample directory.*
```
for f in Konzo*.gz; do 
    samp=${f%%_*}
    mv $f $samp
done
```

#### *Combining all NextSeq sequencing runs into a single fastq file*
```
for d in Konzo*; do
    samp=${d%%_*}
    cat $d/*R1*.fastq.gz > $d/${samp}_R1.fastq.gz
    cat $d/*R2*.fastq.gz > $d/${samp}_R2.fastq.gz
    echo $samp
done

# removes all the extra fastq files
rm Konzo*/*L00?_R1*.gz
```

<br />

## Setting up workspace
This is where we will set up our working structure. We will make a list of all the samples that will be analyzed.

```
mkdir -p Analysis
mv Konzo* Analysis

mkdir -p refs
mkdir -p scripts

cd Analysis
ls -d Konzo* > ../samps.txt
```

#### *Setting up reference databases*
```
cd refs 

# Human reference
for f in /lustre/groups/cbi/shared/References/Homo_sapiens/UCSC/hg38full/Sequence/Bowtie2Index/*.bt2; do
    ln -s $f
done

# Bacteria references
for f in /lustre/groups/cbi/shared/Databases/NCBI_rep_genomes/latest/*.bt2; do
    ln -s $f
done
```

