#!/bin/bash
curr_dir="$(dirname "$0")"
com1=$(awk '/^\[/ { } /=/ { print $0 }' config/pipeline.conf > $curr_dir/tmp.conf)
. $curr_dir/tmp.conf

echo "Converting to bedgraphFormat ..." >> $tmp_clog/meth-bedgraph.log;
Rscript ./src/bash/meth-bedgraph.R $result_pipeline --no-save --no-restore --verbose 
sed -i "s/st_bedgraph=.*/st_bedgraph=3/g" config/pipeline.conf

#download http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/

#chmod +x file 
#./bedGraphToBigWig methylome_Cvi-0-G4_L4-merged.txt.bedGraph ../rdata/TAIR10_chr_all.txt  test.bw





