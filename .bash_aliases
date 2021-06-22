
export	PS1="[\[\e[0;36m\]\u - \[\e[0;37m\]\D{%Y.%m.%d} \t\[\e[0;39m\]]\n\[\e[0;31m\]\${PWD}: \[\e[0;39m\]"

alias	src='source ~/.bashrc'
alias	g='gvim -p > /dev/null'
alias	t='dbus-launch gnome-terminal'
alias	ju='jupyter lab --no-browser'
alias	gitpush='git add .; git commit -m 'comment'; git push -u origin master;'

function	cd	{ if (( $#==0 )); then builtin cd ~ && ls; else builtin cd "$@" && ls; fi }
cd		.
