#!/bin/bash

if [ -z "$1" -o -z "$2" -o -z "$3" ];
then
    echo "no arg"
    exit 3
fi

if [ "$2" -gt "$3" ]
then
    echo "2-nd arg $2 greter than 3rd $3"
fi

start="$2"
end="$3"

for((i=$start; i <= $end; i++));
do
    name="$1$i.sh"
    touch $name
    (cat <<'HERE_DOC'
#!/bin/bash
whoami>> $SCR_SAVE_FILE    # User invoking the script.
echo $PWD/`basename $0`>> $SCR_SAVE_FILE   # Script name.
date>> $SCR_SAVE_FILE      # Date and time.
echo>> $SCR_SAVE_FILE      # Blank line as separator.'
HERE_DOC
)  > $name
done
chmod +x *.sh
