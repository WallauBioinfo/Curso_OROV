mkdir teste_fastp
cd teste_fastp
fastp -i ../inputs/ART1_R1.fastq.gz -I ../inputs/ART1_R2.fastq.gz --detect_adapter_for_pe --thread 1 -o ART1.fastp.R1.fq.gz -O ART1.fastp.R2.fq.gz -h ART1.fastp.html -j ART1.fastp.json -l 75 --qualified_quality_phred 20
