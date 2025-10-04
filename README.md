# Curso_OROV
Códigos e documentações atrelados ao curso de metagenomica guiada VSP IAM-IEC

## Preparando ambiente com micromamba

Para realizar alguma das etapas práticas deste curso, configure primeiramente o micromamba no ambiente.

```
source install_micromamba.sh
```

## 01 Prática QC

### Instalando multiqc

```bash
micromamba activate base
micromamba install -c conda-forge -c bioconda multiqc=1.31 fastp=0.23
```

#### OU

```bash
source 01_install_qc.sh
```

### Entendendo os parâmetros fastp

```bash
fastp --help
```

### Rodando fastp

```bash
mkdir teste_fastp
cd teste_fastp
fastp -i ../inputs/ART1_R1.fastq.gz \
    -I ../inputs/ART1_R2.fastq.gz \
    --detect_adapter_for_pe \
    --thread 1 \
    -o ART1.fastp.R1.fq.gz \
    -O ART1.fastp.R2.fq.gz \
    -h ART1.fastp.html \
    -j ART1.fastp.json \
    -l 75 \
    --qualified_quality_phred 20
```

#### OU

```bash
bash 02_fastp.sh
```

### Gerando relatório com multiQC

```bash
multiqc .
```

## 02 Prática Viralflow

### Preparando ambiente

```bash
source install_viralflow.sh
```

Após instalar as dependências, é necessário configurar os containers localmente (apenas 1 vez)

```bash
viralflow -build_containers
```

### Rodando ViralFlow

```bash
cd /workspaces/Curso_OROV
viralflow -run --params_file pratica_viralflow/orov_L.params
viralflow -run --params_file pratica_viralflow/orov_M.params
viralflow -run --params_file pratica_viralflow/orov_S.params
```

#### OU

```bash
bash 03_viralflow.sh
```

### Em casos de erro

```bash
micromamba activate viralflow
micromamba install -c conda-forge openjdk=17
curl -s https://get.nextflow.io | bash
chmod +x nextflow
mkdir -p $HOME/.local/bin/
mv nextflow $HOME/.local/bin/
```

#### OU

```bash
source 03.1_fix.sh
```

## 03 Análise evolutiva com nextstrain

Crie o ambiente para análise

```bash
micromamba create -n next
micromamba activate next
micromamba install -c conda-forge -c bioconda nextstrain-cli=8.5.4 augur=27.0.0
```

#### OU

```bash
source 04_install_next.sh
```

Cheque as instalações

```bash
nextstrain --version
augur --version
```

Rode a análise

```bash
cd pratica_nextstrain
cp Snakefile-L Snakefile
nextstrain build --cpus 2 .
```

#### OU

```bash
source 05_next.sh
```

Visualização dos resultados

```bash
micromamba create -c conda-forge -n auspice nodejs=16
micromamba activate auspice
npm install --global auspice
```

#### OU

```bash
cd /workspaces/Curso_OROV
source 06_install_auspice.sh
```

```
cd /workspaces/Curso_OROV/pratica_nextstrain/auspice
auspice view --datasetDir .
```