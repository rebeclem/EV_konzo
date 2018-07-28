# EV_konzo
This is for Eric Vilain's lab group on their Konzo project.

Below are the list of steps taken to analyze the NGS data starting from raw sequence data through visualization of PathoScope results in R. 

<br />

---
---
---

## Part 1 : Setup
Follow [`Setup.md`](https://github.com/kmgibson/EV_konzo/blob/master/Setup.md) instructions.
<br />
These are the bash scripts I used to set up the directories and working structure. 

---
## Part 2 : QA with FastQC
Follow [`QA.md`](https://github.com/kmgibson/EV_konzo/blob/master/QA.md) instructions.
<br />

Here, we will be checking the quality of the *raw* reads, i.e. the reads coming off the sequencer. We want to look at the quality of the begining nucleotides (10bp) and the ending nucleotides, if any samples failed*, duplication level (which should be low in metagenomic samples), and anything else that needs to be addressed in Part 3 with Flexbar. The results from this first run with FastQC will provide us with the trimming parameters we need to use in Part 3. 

For helpful resources in understanding the output from FastQC, see this helpful [PDF](https://github.com/kmgibson/EV_konzo/blob/master/FastQC_Manual.pdf) provided by the [University of Missouri](https://dnacore.missouri.edu) or see the [creators of FastQC's website](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/).

>*This is important for this project, because you'll see that samples 54 and 88 failed. Their quality charts were all over the place, and you'll notice at the top that they both had <500 reads total. 


---
## Part 3 : QC with Flexbar
Follow [`QC.md`](https://github.com/kmgibson/EV_konzo/blob/master/QC.md) instructions.
<br />

Before we can use PathoScope to map our reads to genomes, we first need to "clean" our reads. Now, we call it cleaning because here we remove low quality reads, low quality nucleotides, and any adapter sequences that were left behind by the Illumina processing software. This step is also referred to as trimming our reads.


---
## Part 4 : QA with FastQC
Basically repeat part 2 with [`QA.md`](https://github.com/kmgibson/EV_konzo/blob/master/QA.md) instructions.
<br />
This time you will be checking the quality *after* trimming (cleaning) the reads.

This step is to make sure that the reads are cleaned sufficiently. Check that your trimming options didn't take off too much from the ends or was too strigent. Check that the trimming options did indeed remove the low quality reads, low quality nucleotides, adapters. 

_**This step assesses how successful you were on Part 3 with flexbar.**_

---
## Part 5 : Count number of raw and cleaned reads
Follow [`Count_sequencing_reads.md`](https://github.com/kmgibson/EV_konzo/blob/master/Count_sequencing_reads.md) instructions.
<br />
Here you are assessing how many reads you started with (raw read count) and how many reads remained after cleaning.


>The read count file needs to be formatted a certain way before it can be visualized. It should be in this format:
>
>| Samp | Reads | Status | Group |
>|------|-------|--------|-------|
>|Konzo01 | 5652615 | raw | Kinshasa Control |
>|Konzo50 | 4949863 | clean | Kahemba Control |
>
>See the file [`EVKonzo_readcount.csv`](https://github.com/kmgibson/EV_konzo/blob/master/EVKonzo_readcount.csv) for an example of how the file needs to be set up before taking it into R.

---
## Part 6 : PathoScope

Follow [`Pathoscope.md`](https://github.com/kmgibson/EV_konzo/blob/master/Pathoscope.md) instructions.

Now we're getting to the fun part where we map the sample reads against databases. 
To see a list of all the available databases we can map to go to [CBI's reference databses](https://github.com/gwcbi/cbi_reference_databases).

See the github page for [`Pathoscope`](https://github.com/PathoScope/PathoScope) for more information as well. We will only be using the `MAP` and `ID` modules.

---
## Part 7 : Count number of mapped reads

Follow [`Counting_PS_reads.md`](https://github.com/kmgibson/EV_konzo/blob/master/Counting_PS_reads.md) instructions.

Here we are counting the number of reads that mapped to the human genome and the number of reads that mapped to the bacterial databases we used. This will give us our read ratio between human : bacteria. This will also give us the number of reads that were unmapped, i.e. reads that did not map to any genome in our database set. 

> *Unmapped Reads* <br/>
> Unmapped reads can mean a couple of things:
> 1)  Reads do indeed belong to a genome, however, the genome is not in our database. Therefore, the read is unmapped because it cannot be mapped back to its genome, which isn't part of our database. This means the read is known, but unmapped in this case.
> 2)  Reads belong to yet-to-be-identified genomes. Therefore, the reads are unmapped and are unknown at the moment. <br />
>  -- These are the reads that you can *de novo* assemble into contigs (longer sequences made of overlapping reads) that could belong to new genomes.


----
## Part 8 : Visualizing Results with R.


This is where the exciting part comes! Follow [`R_analysis.md`](https://github.com/kmgibson/EV_konzo/blob/master/R_analysis.md) instructions.

Here we will visualize the results from Flexbar and PathoScope. We will also complete some statistics.


----
## Part 9 : Functional Analysis with HuMANN2

Follow [`humann2.md`](https://github.com/kmgibson/EV_konzo/blob/master/humann2.md) instructions.

Here we will complete functional analysis on the whole shotgun metagenomic reads. We will get a list of pathways and GO terms.


HUMAnN2: The HMP Unified Metabolic Analysis Network 2
<br/>
See [general overview here](http://huttenhower.sph.harvard.edu/humann2), [manual here](https://bitbucket.org/biobakery/humann2/wiki/Home) and a [tutorial here](https://bitbucket.org/biobakery/biobakery/wiki/humann2).

