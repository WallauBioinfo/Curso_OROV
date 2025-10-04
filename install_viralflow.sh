git clone -b lite https://github.com/WallauBioinfo/ViralFlow
cd ViralFlow/
micromamba env create -f envs/env.yml
micromamba activate viralflow
pip install -e .

sudo ln -s /usr/bin/unsquashfs /usr/local/bin/unsquashfs