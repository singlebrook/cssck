#!/bin/bash

# configuration
tmpdirname="cssck" # will be created in /tmp

# arguments
cssfile=$1
if [ ! -f $cssfile ]; then echo "File not found: $cssfile"; exit 1; fi
codedir=$2
if [ ! -d $codedir ]; then echo "Directory not found: $codedir"; exit 1; fi
filefilter=$3

# create temp working dir, replacing extant temp dir if necc.
if [ ! -w /tmp ]; then echo "Cannot write to /tmp"; exit 1; fi
tmpdir="/tmp/$tmpdirname"
if [ -d $tmpdir ]; then rm -r "$tmpdir"; fi
if [ -e $tmpdir ]; then echo "Please delete obstructing file: $tmpdir"; exit 1; fi
mkdir "$tmpdir"

# find unique class names
egrep -o '\.[-]?[_a-zA-Z]+[_a-zA-Z0-9-]*' $cssfile | tr -d '.' | sort | uniq > "$tmpdir/classes"
echo `wc -l "$tmpdir/classes" | awk '{print $1}'` "classes found"

# make a list of all code files
find "$codedir" -name "$filefilter" > $tmpdir/codefiles
echo `wc -l "$tmpdir/codefiles" | awk '{print $1}'` "files to search"

# find occurances
for c in `cat "$tmpdir/classes"`
do
	for f in `cat "$tmpdir/codefiles"`
	do
		grep -n $c $f >> $tmpdir/occurrences
	done
	count=`wc -l $tmpdir/occurrences | awk '{print $1}'`
	echo "$count $c"
	rm "$tmpdir/occurrences"
done

