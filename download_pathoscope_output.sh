mkdir -p pathoscope_output
while read k; do
    scp your_username@login.colonialone.edu:path/to/Analysis/${k}/pathoid-sam-report.tsv pathoscope_output/${k}_pathoid-sam-report.tsv
done <samps.txt
