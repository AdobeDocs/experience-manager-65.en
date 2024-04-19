#!/bin/bash
set -e

# Analyse CQ access.log extrapolating various information and producing a MarkDown output on stdout
#
# usage: 
#    ./analyse-access.sh access.log.2013-*
#
# you can provide additional custom paths to analyse on the command line
#    ./analyse-access.sh access.log.2013-* /my/custom/path/1 /my/custom/path/2
#
# you can save the output by a simple piping
#    ./analyse-access.sh access.log.2013-* | tee yr2013.md

BN=`basename $0`

if [ $# -lt 1 ] 
then
	echo "Wrong comand line"
	exit 1
fi

echo "Log Analysis"
echo "============"

#listing files
echo 
echo "file(s)"
echo "-------"
echo
for f in $@
do
	if [ -f $f ]
	then
		echo "    $f"
	fi
done

#Computing overall requests
echo
echo "Overall requests"
echo "----------------"
echo
for f in $@
do
	if [ -f $f ]
	then
		b=`wc -l $f`
		echo "  $b"
	fi
done

#Potentially cachable in dispatcher
echo
echo "Potentially cachable in dispatcher"
echo "----------------------------------"
echo
echo "Overall"
echo
libs=0
apps=0
i=0
set +e
for f in $@
do
	if [ -f $f ]
	then
		b=`grep -c "GET /libs/[^?]* HTTP" $f`
		libs=$(($libs + $b))
		b=`grep -c "GET /apps/[^?]* HTTP" $f`
		apps=$(($apps + $b))
		b=`grep -c "GET /include/[^?]* HTTP" $f`
		i=$(($i + $b))
	fi
done
set -e
echo "    $libs /libs"
echo "    $apps /apps"
echo "    $i /include"

#GET vs POST
echo
echo "GET vs POST"
echo "-----------"
echo
echo "Overall"
echo
get=0
post=0
set +e
for f in $@
do
	if [ -f $f ]
	then
		b=`grep -c "GET /" $f`
		get=$(($get + $b))
		b=`grep -c "POST /" $f`
		post=$(($post + $b))
	fi
done
set -e
echo "    $get GET"
echo "    $post POST"
tot=$(($get + $post))
gp=$(($get * 100 / $tot))
pop=$(($post * 100 / $tot))
echo "    $gp% GET $pop% POST"

#Request distribution
echo
echo "Request distribution over time"
echo "------------------------------"
echo
echo "Hourly"
echo
tmp=`mktemp -t $BN`
for f in $@
do
	if [ -f $f ]
	then
		awk '{print substr($4,1,14)}' $f >> $tmp
	fi
done
cat "$tmp" | sort | uniq -c | awk '{print "    "$1" "$2}' #outputting data
#generating google chart URL
b=`cat "$tmp" | sort | uniq -c | awk 'BEGIN{chd="chd=t:"}{chd = chd $1 ","}END{print "https://chart.googleapis.com/chart?chxt=y&cht=bvs&chs=500x150&chds=a&chbh=a,2&"substr(chd,1,length(chd)-1)}'`
echo
echo "![chart]($b)"
rm $tmp

#Unique users
echo
echo "Unique users"
echo "------------"
echo
echo Overall
echo
tmp=`mktemp -t $BN`
for f in $@
do
	if [ -f $f ]
	then
		awk '{print $3}' $f >> $tmp
	fi
done
b=`cat $tmp | sort -u | wc -l`
echo "    $b"
rm $tmp
echo
echo "Daily"
echo
tmp=`mktemp -t $BN`
for f in $@
do
	if [ -f $f ]
	then
		awk '{print substr($4,0,11)" "$3}' $f >> $tmp
	fi
done
cat $tmp | sort | uniq | awk '{print $1}' | uniq -c | awk '{print "    "$1" "$2}'
rm $tmp

#Concurrent users
echo
echo "Concurrent users"
echo "----------------"
echo
echo over 1 minute
echo
tmp=`mktemp -t $BN`
tmp2=`mktemp -t $BN`
tmp3=`mktemp -t $BN`
for f in $@
do
	if [ -f $f ]
	then
		awk '{print substr($4,1,17), $3}' $f >> $tmp
	fi
done
cat $tmp | sort | uniq | awk '{print $1}' | uniq -c | sort -r > $tmp2
head -n 1 $tmp2 | awk '{print "    peak: "$1" "$2}'
tail -n 1 $tmp2 | awk '{print "    min : "$1" "$2}'
awk '{print $1}' $tmp2 > $tmp3
t=0
s=0
for c in `cat $tmp3`
do
	s=$(($s + $c))
	t=$(($t + 1))
done
avg=$(($s / $t))
echo "    avg: $avg"
echo
echo "Wighted distribution over 1 minute"
echo
sort $tmp | uniq | awk '{print $1}' | uniq -c | sort | awk '{print $1}' | uniq -c | sort -r | awk '{print "    times="$1 ", users="$2}'
rm $tmp
rm $tmp2
rm $tmp3
echo
echo "Over 10 minutes"
echo
tmp=`mktemp -t $BN`
tmp2=`mktemp -t $BN`
tmp3=`mktemp -t $BN`
for f in $@
do
	if [ -f $f ]
	then
		awk '{print substr($4,1,16), $3}' $f >> $tmp
	fi
done
cat $tmp | sort | uniq | awk '{print $1}' | uniq -c | sort -r > $tmp2
head -n 1 $tmp2 | awk '{print "    peak: "$1" "$2}'
tail -n 1 $tmp2 | awk '{print "    min : "$1" "$2}'
awk '{print $1}' $tmp2 > $tmp3
t=0
s=0
for c in `cat $tmp3`
do
	s=$(($s + $c))
	t=$(($t + 1))
done
avg=$(($s / $t))
echo "    avg: $avg"
echo
echo "Wighted distribution over 10 minute"
echo
sort $tmp | uniq | awk '{print $1}' | uniq -c | sort | awk '{print $1}' | uniq -c | sort -r | awk '{print "    times="$1 ", users="$2}'
rm $tmp
rm $tmp2
rm $tmp3

#Top hits
echo
echo "20 Top hits"
echo "-----------"
echo
echo overall
echo
tmp=`mktemp -t $BN`
for f in $@
do
	if [ -f $f ]
	then
		awk '{print $7}' $f | sed 's/\?.*//' >> $tmp
	fi
done
sort $tmp | uniq -c | sort -nr | head -n 20 | awk '{print "    "$0}'
rm $tmp

#Additional paths of interest
tmp=`mktemp -t $BN`
tmp2=`mktemp -t $BN`
for p in $@
do
	if [ ! -f $p ]
	then
		#if it is not a valid file it should be a path to be analysed out of the logs
		echo
		echo "$p"
		echo "------"
		echo
		cat /dev/null > $tmp
		set +e
		for f in $@
		do
			if [ -f $f ]
			then
				grep "$p" $f | awk '{print $7}' | sed 's/\?.*//' >> $tmp
			fi
		done
		set -e
		lines=`wc -l $tmp | awk '{print $1}'`
		if [ $lines -gt 0 ]
		then
			echo "Overall"
			echo
			sort $tmp | uniq -c | awk '{print "    "$0}'
			echo
			echo "Over 1 minute"
			echo
			cat /dev/null > $tmp
			set +e
			for f in $@
			do
				if [ -f $f ]
				then
					grep "$p" $f | awk '{print substr($4,1,17)" "$7}' | sed 's/\?.*//' >> $tmp
				fi
			done
			set -e
			sort $tmp | uniq -c | sort -nr > $tmp2
			head -n 1 $tmp2 | awk '{print "    peak: "$1}'
			tail -n 1 $tmp2 | awk '{print "    min: "$1}'
			s=0
			t=0
			for i in `awk '{print $1}' $tmp2`
			do
				s=$(($s + $i))
				t=$(($t + 1))
			done
			avg=$(($s / $t))
			echo "    avg: $avg"
			echo
			echo "Weighted distribution over 1 minute"
			echo
			sort $tmp | uniq -c | awk '{print $1" "$3}' | sort -n | uniq -c | sort -nr | awk '{print "    times="$1", occurencies="$2" "$3}'
		else
			echo "    No match"
		fi
	fi
done
rm $tmp
rm $tmp2