micromamba activate viralflow
micromamba install -c conda-forge openjdk=17
curl -s https://get.nextflow.io | bash
chmod +x nextflow
mkdir -p $HOME/.local/bin/
mv nextflow $HOME/.local/bin/