#!/usr/bin/env bash
path="$1"
type_list="$2"
save_file="$3"

usage(){
	echo "Usage: $0 path file_type"
	echo "Usage: $0 path png,jpg,gif"
	echo "Usage: $0 path file_type json_file"
	exit 1
}

[[ $# -lt 2 ]] && usage

if [[ ! -z "$save_file" ]]; then
    echo "$0 $path $type_list > $save_file";
    $0 $path $type_list > $save_file;
else
    type_list="$(echo $type_list | sed 's#,# #g')"
    d=''
    s='{'
    for type in $type_list ; do
        for image in `ls $path/*.$type` ; do
            s="$s$d"
            s="$s\"$(echo $image | sed "s#$path/##")\"":
            ext="$(echo $image | sed "s#$path/##" | sed "s#.*\.##")"
            IMAGE_BASE64="data:image/$ext;base64,"$(base64 $image)
            s="$s\"$IMAGE_BASE64\"";
        d=','
        done
    done
    s=$s'}'
    echo $s
fi