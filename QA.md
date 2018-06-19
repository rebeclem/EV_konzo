# Working Pipeline for Vilain's group
# Part 2 : QA with FastQC

__*This step is assessing the quality of your raw NGS sequencing reads.*__

<br />

You need to be within the Analysis folder. 
```
cd Analysis
```

Call fastqc on the raw sequence files.
```
module load fastqc
for f in Konzo*; do
    fastqc -o $f -f fastq ${f}_R1.fastq.gz ${f}_R2.fastq.gz
done
```

You will get two output files for each fastq files (total of 4 files):
1.  `Konzo1_R1_fastqc.html`
2.  `Konzo1_R1_fastqc.zip`
3.  `Konzo1_R2_fastqc.html`
4.  `Konzo1_R2_fastqc.zip`

<br />

The `html` files are the ones that we are interested in. We're going to move all the `html` files into a directory so we can look at all the files at the same time.
```
# remember we're still in the Analysis folder
mkdir -p fastqc_raw
mv Konzo*/Konzo*.html fastqc_raw/
```
Now download that folder to your computer with the command:
```
```
All of the files can be opened up through Safari/Chrome/etc. (whatever internet browser you use). If you open the downloaded folder in your Finder (if on mac), you can select a file (so it is highlighted) and press the *space* button. A temporary window should show up with your results. Now you can press the *down arrow* and scroll through all the files relatively quickly.

See this [PDF]() explaining the FastQC results or this [website by the creators of FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) that also has explaination of the resuts. 

<br />

Removed unncessary files:
```
rm Konzo*/Konzo*_R?_fastqc.zip
```

<br />

---
---
# Part 4 : QA with FastQC
