#!/bin/bash

echo "Use get-ego-vendor instead of this PoS >:("

# EGO_SUM needs something else
# awk '{print "\"" $1 " " $2 "\""}' go.sum | nvim

#go list -m all | sed '1d' | while read -r line ; do
#    # out=$(echo $line | sed 's/v0\.0\.0-[0-9]\{14\}-//g; s/\+incompatible//')
#    
#    #out=$line
#    if [[ "${line}" =~ .*=\>.* ]] ; then
#        out=$(echo $line | awk '{print $1, $5}')
#        end=$(echo $line | awk '{print $4}')
#    else
#        out=$(echo $line | awk '{print $1, $2}')
#        end=$(echo $line | awk '{print $1}')
#    fi
#    out="$out $(echo $end | sed -e 's/[A-Z]/!\L&/g')"
#
#    # "https:\/\/github.com\/[A-Za-z0-9_.-]*\/[A-Za-z0-9_.-]*\/"
#
#    #if [[ ! "${line}" =~ .*git.* ]] && [[ ! "${line}" =~ .*bitbucket.* ]]; then
#    #    link=$(echo $out | awk '{print "https://"((length($3) == 0)? $1 : $3)"?go-get=1"}' | xargs -n 1 curl -s -L | grep -m 1 " git " | grep -P -o -m 1 'https:.*(?=")' | head -1 | sed 's/^https:\/\///; s/\/$//' )
#    #    #echo $link
#    #    #echo $out | awk '{print "https://"((length($3) == 0)? $1 : $3)"?go-get=1"}'
#    #    out="$out $link"
#    #fi
#    
#    echo "\"$out\""
#done
