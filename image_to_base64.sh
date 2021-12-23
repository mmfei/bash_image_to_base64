#!/usr/bin/env bash
path="$1"
type="$2"
save_file="$3"

usage(){
	echo "Usage: $0 path file_type"
	echo "Usage: $0 path file_type json_file"
	exit 1
}

[[ $# -lt 3 ]] && usage

if [[ ! -z "$save_file" ]]; then
    echo "$0 $path $type > $save_file";
    $0 $path $type > $save_file;
else
    d=''
    s='{'
    for image in `ls $path/*` ; do
        s="$s$d"
        s="$s\"$(echo $image | sed "s#$path/##")\"":
        IMAGE_BASE64="data:image/$type;base64,$(base64 $image)"
        s="$s\"$IMAGE_BASE64\"";
       d=','
    done
    s=$s'}'
    echo $s
fi