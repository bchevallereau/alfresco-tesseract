# save arguments to variables
SOURCE=$1
TARGET=$2
TMPDIR=/tmp/Tesseract
FILENAME=`basename $SOURCE`
OCRFILE=$FILENAME.tif
 
# Create temp directory if it doesn't exist
mkdir -p $TMPDIR

# to see what happens
#echo "from $SOURCE to $TARGET" >>/tmp/ocrtransform.log
 
cp -f $SOURCE $TMPDIR/$OCRFILE
 
# call tesseract and redirect output to $TARGET
cd $TMPDIR
tesseract $OCRFILE ${TARGET%\.*} -l eng
rm -f $TMPDIR/$OCRFILE
cd -