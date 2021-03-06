#!/usr/bin/env zsh
alias pull_notes='cd $HOME/Documents/code/tasking && ./pullscript.sh'
alias t='task'
alias to='taskopen -A'
alias to1='taskopen -A -c $HOME/.taskopenrc1'
alias ta='task attach'
alias active='task +ACTIVE'
book=4e09bbe4-eff4-4ae2-bd1e-2c82394be509
alias buzz='task +alarm status:pending'
alias abst='task context abstract'
alias work='task context work'
alias none='task context none'
alias due='t due:today status:pending'
alias tsum='timew summary'

function te ()
{
	task "$*" edit
}
function dance(){
	bf=$HOME/Documents/code/tasking/.tasknotes.d/2896ed34-be60-4650-84b8-f7240ad6e871.txt
	logf=$HOME/.dance-log
	ue=$(sed '1q;d' $bf)
	na=$(sed '2q;d' $bf)
	de=$(sed '3q;d' $bf)
	sp=$(sed '4q;d' $bf)
	ra=$(sed '5q;d' $bf)

	tot=$(echo "scale=3; $ue*$ra+$na-$de" | bc)
	echo "----------" | tee -a $logf | cat -
	echo "totals: $tot" | tee -a $logf | cat -
	le=$(echo "scale=3; $tot/$sp*30" | bc)
	echo "days: $le" | tee -a $logf | cat -
	cu=$(date -u '+%F %T')
	cur=$(date -u '+%F %T.%N %Z')
	echo $cu | tee -a $logf | cat -
	ro=$(echo "($le+0.5)/1" | bc)
	ne=$(date -d"$cur +$ro days" '+%F %T');
	echo | tee -a $logf | cat -
	echo "eow: $ne" | tee -a $logf | cat -
	echo -e "----------\n" | tee -a $logf | cat -

}

funciton addtt () {
	addTextFromFile $HOME/Documents/code/tasking/.tasknotes.d/snippets/tt.snip
}
zle -N addtt

funciton addtsuids () {
	addTextFromFile $HOME/Documents/code/tasking/.tasknotes.d/snippets/task_search_by_uuids.snip
}
zle -N addtsuids
funciton addts () {
	addTextFromFile $HOME/Documents/code/tasking/.tasknotes.d/snippets/task_search.snip
}
zle -N addts

funciton opentst () {
	addTextFromFile $HOME/Documents/code/tasking/.tasknotes.d/snippets/task_open_search_template.snip
}
zle -N opentst
funciton edittt () {
	addTextFromFile $HOME/Documents/code/tasking/.tasknotes.d/snippets/task_edit_search_template.snip
}
zle -N edittt
funciton addtsw () {
	addTextFromFile $HOME/Documents/code/tasking/.tasknotes.d/snippets/stopwatch_template.snip
}
zle -N addtsw

multi_bind '\et' addtt
multi_bind '\e]' addts
multi_bind '\eu' addtsuids
multi_bind '\e`' addtsw
#multi_bind '\eo' opentst
multi_bind '\e\\' edittt
 
function createNote () {
	EX_USAGE=64
	if [ -z "$1" ]; then
		echo 'usage: createNote ${new_filename}'
		return $EX_USAGE
	fi
	note_name="$1"
	if [[ "$note_name" =~ _.* ]];
	then
		suff="${note_name#*.}"
		note_name=$(mktemp -u XXXXXXXXXXX)."$suff"
	fi
	if [ -n "$2" ];
	then
		descri="$(t _get $2.description)"
		if [ -n "$descri" ];
		then
			echo "# $descri" > $note_name
		else
			echo '# annotation' > $note_name
		fi
                echo "# vim: foldmethod=marker" >> $note_name

	else
		echo '# annotation' > $note_name
	fi
	vim $note_name
	destd=$HOME/Documents/code/tasking/.tasknotes.d/snippets
	mv $note_name $destd
	if [ -z "$2" ]; then
		attach_vifm -f $destd/$note_name
	else
		attach_vifm -f $destd/$note_name -t "$2"
	fi
}
alias cn='createNote'
alias update_ttags='python $HOME/Documents/.conf/system_after_brick_wizard/resources/var-scripts/get_color_taskwar_tags.py'
function supert {
	tcchoose rc.context=none rc.defaultwidth=300 link 2>/dev/null | fzf --ansi | awk '{ print $1}'
}

function superxt {
	tcchoose rc.context=none rc.defaultwidth=300 link 2>/dev/null | fzf  --ansi | awk '{ print $1}' | xcat
}

function supertask {
	tcchoose rc.context=none rc.defaultwidth=300 status:pending all 2>/dev/null | fzf  --ansi | awk '{ print $1}'
}

function tags_list {
	t _unique tag  |  tr "," " " | tr " " "\n" | sort -u | tr "\n" " "
}

function tags_list_choose {
	tc _unique tag  |  tr "," " " | tr " " "\n" | sort -u | fzf --ansi
}

function ttag {
        task "$@" mod +$(tags_list_choose)

}

alias tsup='to $(supert)'
alias tsupx='to1 $(supert)'
alias tsuper='to1 $(supertask)'
alias tl='to -r $(supert)'
function tc () {
        task "$@" | clog -f $HOME/.config/.taskwcolorrc task
}

function tcc () {
        task rc.context=none "$@" | clog -f $HOME/.config/.taskwcolorrc task
}

function tcchoose () {
        task "$@" | clog -f $HOME/Documents/.conf/base_color_rules task
}

function treal () {
	cat $HOME/Documents/code/tasking/notes-org/real_life.org | multicolor $HOME/.config/.org_modenotesrc 2>/dev/null
}

function launch ()
{
	cd $HOME/Documents/code/tasking
	find .tasknotes.d/snippets -type f -exec chmod 400 {} \;
	update_ttags
	gitpush
}

function inter_task_yet ()
{
	if [ -n "$1" ];
	then
		local dup_target=$1
	else
		local dup_target=96bbde84
	fi

	local id=$(task $dup_target duplicate | grep 'Created task' \
		| awk 'match($0, /[0-9]+/) {print substr($0, RSTART, RLENGTH)}')
	te $id
	local full_uuid=$(task $id uuids)
	echo "Full ref uuid: $full_uuid"
	echo $full_uuid | xclip -sel clip -i
}

function inter_task ()
{
	if [ -n "$1" ];
	then
		local dup_target=$1
	else
		local dup_target=96bbde84
	fi

	local id=$(task $dup_target duplicate | grep 'Created task' \
		| awk 'match($0, /[0-9]+/) {print substr($0, RSTART, RLENGTH)}')
	te $id
	local uuid=$(task $id done | grep 'Completed task' \
		| awk '{print $3}')
	echo "Created ref uuid: $uuid"
	local full_uuid=$(task $uuid uuids)
	echo "Full ref uuid: $full_uuid"
	echo $full_uuid | xclip -sel clip -i
}

function id_validate ()
{
	EX_DATAERR=65
	local match=$(echo "$1" | gawk --re-interval '/^[0-9]{1,3}$/')
	if [ -n "$match" ];
	then
		return 0
	else
		return $EX_DATAERR
	fi
}

function uuid_validate ()
{
	EX_DATAERR=65
	local match=$(echo "$1" | gawk '/^[a-fA-F0-9]+(-[a-fA-F0-9]+)*$/')
	if [ -n "$match" ];
	then
		return 0
	else
		return $EX_DATAERR
	fi
}

function tyan()
{
	EX_DATAERR=65
	EX_NOINPUT=66
	local attach_to="$1"
	id_validate "$attach_to" && attach_to="$(task $attach_to uuids)"
	if uuid_validate "$attach_to";
	then
		local desc=$(task _get "$attach_to.description")
		if task _get "$attach_to.description";
		then
			echo "linking to task: $desc" 1>&2
		else
			echo "task doesn't exist: $attach_to" 1>&2
			return $EX_NOINPUT
		fi
	else
		echo "invalid id format: $attach_to" 1>&2
		return $EX_DATAERR
	fi
	shift;
	task "$attach_to" annotate "$@"
}
