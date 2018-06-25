# Working Pipeline for Vilain's group
# Part 2 : QA with FastQC

### __This step is assessing the quality of your raw NGS sequencing reads.__
<br />

You need to be within the Analysis folder. 
```
cd Analysis
```

Call FastQC on the raw sequence files.
```
module use /groups/cbi/shared/modulefiles
module load fastqc
for f in Konzo*; do
    fastqc -o $f -f $f/fastq ${f}_R1.fastq.gz $f/${f}_R2.fastq.gz
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
Now download that folder to your computer with this command. This command needs to be excuted on your local computer (not within colonial one). I recommend opening up another tab on your terminal and then executing this command:
```
scp your_username@login.colonialone.edu:path/to/Analysis/fastqc_raw /local/dir
```
>You will need to replace a few things. As an example for you, I have used my path and username.
>
>| your_username | path/to/Analysis | local/dir |
>| --- | --- | --- |
>| kmgibson | /lustre/EV_konzo/Analysis | ~/Documents/EVKonzo |
>

<br />
<br />

All of the files can be opened up through Safari/Chrome/etc. (whatever internet browser you use). If you open the downloaded folder in your Finder (if on mac), you can select a file (so it is highlighted) and press the *space* button. A temporary window should show up with your results. Now you can press the *down arrow* and scroll through all the files relatively quickly.

See this [PDF](https://github.com/kmgibson/EV_konzo/blob/master/FastQC_Manual.pdf) explaining the FastQC results or this [website by the creators of FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) that also has explaination of the results. 
- The PDF was downloaded from the [University of Missouri sequencing core](https://dnacore.missouri.edu).

<br />

Finally, we need to remove unncessary files:
```
rm Konzo*/Konzo*_R?_fastqc.zip
```

<br />

---
---
# Part 4 : QA with FastQC

## __This step is assessing the quality of your cleaned NGS sequencing reads.__
### Instead of looking at what we need to trim, we need to see if what we did trim was enough and that we weren't too greedy.
<br />

This is pretty similar to the above step, the first time we did FastQC.


You need to be within the Analysis folder. 
```
cd Analysis
```

Call FastQC on the cleaned sequence files.
```
module use /groups/cbi/shared/modulefiles
module load fastqc
for f in Konzo*; do
    fastqc -o $f -f fastq $f/flexcleaned_1.fastq $f/flexcleaned_2.fastq
done
```

You will get two output files for each fastq files (total of 4 files):
1.  `flexcleaned_1_fastqc.html`
2.  `flexcleaned_1_fastqc.zip`
3.  `flexcleaned_2_fastqc.html`
4.  `flexcleaned_2_fastqc.zip`

<br />

Again, the `html` files are the ones that we are interested in. We're going to move all the `html` files into a directory so we can look at all the files at the same time.
```
# remember we're still in the Analysis folder
mkdir -p fastqc_cleaned
mv Konzo*/flexcleaned*.html fastqc_cleaned/
```
Now download that folder to your computer with this command. This command needs to be excuted on your local computer (not within colonial one). I recommend opening up another tab on your terminal and then executing this command:
```
scp your_username@login.colonialone.edu:path/to/Analysis/fastqc_cleaned /local/dir
```
>You will need to replace a few things, same thing as above. As an example for you, I have used my path and username.
>
>| your_username | path/to/Analysis | local/dir |
>| --- | --- | --- |
>| kmgibson | /lustre/EV_konzo/Analysis | ~/Documents/EVKonzo |
>

<br />
<br />

All of the files can be opened up through Safari/Chrome/etc. (whatever internet browser you use). If you open the downloaded folder in your Finder (if on mac), you can select a file (so it is highlighted) and press the *space* button. A temporary window should show up with your results. Now you can press the *down arrow* and scroll through all the files relatively quickly.

See this [PDF](https://github.com/kmgibson/EV_konzo/blob/master/FastQC_Manual.pdf) explaining the FastQC results or this [website by the creators of FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) that also has explaination of the results. 
- The PDF was downloaded from the [University of Missouri sequencing core](https://dnacore.missouri.edu).

<br />

Finally, we need to remove unncessary files:
```
rm Konzo*/flexcleaned*fastqc.zip
```

<br />
