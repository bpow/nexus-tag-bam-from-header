#!/bin/bash
# tag-bam-from-header 0.0.1

set -x -e

main() {

    echo "Value of bamfile: '$bamfile'"

    # The following line(s) use the dx command-line tool to download your file
    # inputs to the local file system using variable names for the filenames. To
    # recover the original filenames, you can use the output of "dx describe
    # "$variable" --name".

    dx download "$bamfile" -o - | samtools view -H - > header

	PU=$(grep '^@RG' header | perl -ne 'print $1 if (/PU:([^\t]+)/)')
	SM=$(grep '^@RG' header | perl -ne 'print $1 if (/SM:([^\t]+)/)')
	LB=$(grep '^@RG' header | perl -ne 'print $1 if (/LB:([^\t]+)/)')

	dx set_properties "$bamfile" "SAMPLE_NAME=${SM}" "LIBRARY_NAME=${LB}" \
        "RG_PU_FIELD=${PU}"

}
