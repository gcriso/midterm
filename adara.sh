#! /bin/bash

# How to translate ADRA DNA sequence to amino acids using translate.py 
~/software/BIOL435/translate.py joinedADRA2.fas > joinedADRA2.aa.fas 

# How to do an alignment using MAFFT 
mafft joinedADRA2.aa.fas > joinedADRA2.aa.mafft.aln.fas 

#How to make a codon alignment using resverseTranslate.py
reverseTranslateAlignment.py joinedADRA2.aa.mafft.aln.fas joinedADRA2.fas > joinedADRA2.codon.aln.fas 

#How to make a tree using codon alignment using RAxML
raxmlHPC-PTHREADS -f a -p 12345 -x 12345 -s joinedADRA2.codon.aln.fas -n joinedADRA2codon -# 100 -m GTRGAMMA -T 4

#How to make a tree using amino acid alignment using RAxML 
raxmlHPC-PTHREADS -f a -p 12345 -x 12345 -s joinedADRA2.aa.mafft.aln.fas -n joinedADRA2aminoacid -# 100 -m PROTCATWAG -T 4 

#How to make to draw a tree for codon bipartition using drawTree.py 
xvfb-run python ~/software/BIOL435/drawTree.py RAxML_bipartitions.joinedADRA2codon adra_codon

#How to make to draw a tree for amino acid  bipartition using drawTree.py
xvfb-run python ~/software/BIOL435/drawTree.py RAxML_bipartitions.joinedADRA2aminoacid adra_aa

 
