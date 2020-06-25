# docker-kraken v2.0.9-beta

<a href="https://ccb.jhu.edu/software/kraken2/"><img src="https://ccb.jhu.edu/software/kraken2/kraken2-logo.png" alt="Kraken 2" height="48px"/></a> docker image based on <a href="https://hub.docker.com/_/ubuntu"><img src="https://d1q6f0aelx0por.cloudfront.net/product-logos/library-ubuntu-logo.png" alt="Ubuntu" height="48px"/></a>

ABOUT KRAKEN
---
Kraken is a system for assigning taxonomic labels to short DNA sequences, usually obtained through metagenomic studies. Previous attempts by other bioinformatics software to accomplish this task have often used sequence alignment or machine learning techniques that were quite slow, leading to the development of less sensitive but much faster abundance estimation programs. Kraken aims to achieve high sensitivity and high speed by utilizing exact alignments of k-mers and a novel classification algorithm.

## Base Image
 * [Ubuntu](https://hub.docker.com/_/ubuntu) ubuntu:20.04 LTS
  
## Installed
 * Kraken2 (2.0.9-beta)
 * MiniKraken2 DB (2_8GB_201904)

## Settings
	
    VOLUME /data/
    WORKDIR /data/

## Running

    docker run -it -v $(pwd):/data infotechsoft/kraken2
    # kraken --db ${KRAKEN_DB_VERSION} seqs.fa

# Maintainer 
<a href="http://www.infotechsoft.com">
<img src="http://infotechsoft.com/wp-content/uploads/2017/04/InfotechSoft_logo-small.png" alt="INFOTECH Soft"/>
</a>