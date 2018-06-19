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

---
## Part 3 : QC with Flexbar
Follow [`QC.md`](https://github.com/kmgibson/EV_konzo/blob/master/QC.md) instructions.
<br />

---
## Part 4 : QA with FastQC
Repeat part 2 with [`QA.md`](https://github.com/kmgibson/EV_konzo/blob/master/QA.md) instructions.
<br />
This time you will be checking the quality *after* trimming (cleaning) the reads.

This step is to make sure that the reads are cleaned sufficiently. Check that your trimming options didn't take off too much from the ends or was too strigent. Check that the trimming options did indeed remove the low quality reads, low quality nucleotides, adapters. 

_**This step assesses how successful you were on Part 3 with flexbar.**_

---
## Part 5 : Count number of raw and cleaned reads
Follow [`Count_reads.md`](https://github.com/kmgibson/EV_konzo/blob/master/Count_reads.md) instructions.
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


---
## Part 7 : Count number of mapped reads
Follow [`Counting_PS_reads.md`](https://github.com/kmgibson/EV_konzo/blob/master/Count_sequencing_reads.md) instructions.

Here we are counting the number of reads that mapped to the human genome and the number of reads that mapped to the bacterial databases we used. This will give us our read ratio between human : bacteria. This will also give us the number of reads that were unmapped, i.e. reads that did not map to any genome in our database set. 

> *Unmapped Reads* <br/>
> Unmapped reads can mean a couple of things:
> 1)  Reads do indeed belong to a genome, however, the genome is not in our database. Therefore, the read is unmapped because it cannot be mapped back to its genome, which isn't part of our database. This means the read is known, but unmapped in this case.
> 2)  Reads belong to yet-to-be-identified genomes. Therefore, the reads are unmapped and are unknown at the moment. <br />
>  -- These are the reads that you can *de novo* assemble into contigs (longer sequences made of overlapping reads) that could belong to new genomes.


----
## Part  : Visualizing Results with R.