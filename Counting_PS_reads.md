# Working Pipeline for Vilain's group
# Part 7 - Count number of mapped reads

module load samtools


#### Counting the number of __HUMAN__ mapped reads.

1st, convert the `sam` file to a `bam` file.
```
for d in Konzo*; do 
    samtools view -b $d/human/outalign.sam > $d/human/outalign.bam && echo "Converted $d/outalign.sam" &
done & 
```

2nd, pull all the mapped read names from the `bam` file.
```
for d in Konzo*; do 
    samtools view -F 4 $d/human/outalign.bam | cut -f1 > $d/human/tmp.txt && echo $d &
done
```

3rd, count unique reads.
This is counting the number of *unique* reads that mapped to the human database and writes the number of unique reads and sample name to a file.
```
echo -e "Samp\tReads"
for d in Konzo*; do 
   readnum=$(cat $d/bac/tmp.txt | python ../scripts/count_uniq.py)
   echo -e "${d}\t${readnum} >> reads_hg.txt
   echo $d
done & 
```

---
---
---



#### Counting the number of __BACTERIA__ mapped reads.

1st, convert the `sam` file to a `bam` file.
```
for d in Konzo*; do 
    samtools view -b $d/bac/outalign.sam > $d/bac/outalign.bam && echo "Converted $d/outalign.sam" &
done & 
```

2nd, pull all the mapped read names from the `bam` file.
```
for d in Konzo*; do 
    samtools view -F 4 $d/bac/outalign.bam | cut -f1 > $d/bac/tmp.txt && echo $d &
done
```

3rd, count unique reads.
This is counting the number of *unique* reads that mapped to the bacteria databases and writes the number of unique reads and sample name to a file.
```
echo -e "Samp\tReads" >> reads_bac.txt
for d in Konzo*; do 
   readnum=$(cat $d/bac/tmp.txt | python ../scripts/count_uniq.py)
   echo -e "${d}\t${readnum}" >> reads_bac.txt
   echo $d
done & 
```

