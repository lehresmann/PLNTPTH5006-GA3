#!/bin/bash
set -euo pipefail

# Create output dir if needed
mkdir -p results/multiqc

# Placeholder variables
indir="$2"
outdir="$1"

# Run multiqc with its container
apptainer exec oras://community.wave.seqera.io/library/multiqc:1.35--562c547b518ebe20 multiqc -o "$outdir" "$indir"