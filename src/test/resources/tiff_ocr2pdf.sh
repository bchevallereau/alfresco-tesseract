#!/bin/bash
#############################################################
# tiff_ocr2pdf.sh
# TIF-Datei in durchsuchbares PDF umwandeln
#############################################################
# 31.10.2011 ml - neu erstellt
#############################################################
SOURCE=$1
TARGET=$2
TEMP=`mktemp -t tiffocrXXXXXXXX`
TEMP="${TEMP}_"

tiffsplit $1 "${TEMP}"

for TIFF in ${TEMP}*
do
# segmentation fault bei --denoise!
optimize2bw --dpi 300 -i ${TIFF} -o ${TIFF}opt.tif
tesseract ${TIFF}opt.tif ${TIFF}tmp hocr
hocr2pdf -s -i ${TIFF} -o ${TIFF}.pdf < ${TIFF}tmp.html
done
# PDFs zusammenfassen
pdftk ${TEMP}*.pdf output $2
#############################################################
# aufraeumen
rm ${TEMP}*