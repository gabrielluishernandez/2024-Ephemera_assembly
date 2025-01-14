
module load anaconda3
conda activate flye_assembler
flye --nano-hq input/2022-06-01-concatenated_all.fastq --scaffold  --out-dir tmp --threads 20

# BUSCO

conda deactivate 
#conda create -n busco_5 -c conda-forge -c bioconda busco=5.2.2
conda activate busco_5
busco -f -i tmp/assembly.fasta --cpu 10 -o tmp_busco --mode genome --lineage_dataset insecta_odb10

# Quast
conda deactivate
module load quast
quast.py -o tmp_quast tmp/assembly.fasta
