# $OpenBSD: dot.profile,v 1.9 2010/12/13 12:54:31 millert Exp $
#
# sh/ksh initialization

PATH=/sbin:/usr/sbin:/bin:/usr/bin:/usr/X11R6/bin:/usr/local/sbin:/usr/local/bin
export PATH
: ${HOME='/root'}
export HOME
umask 022

case "$-" in
*i*)    # interactive shell
	if [ -x /usr/bin/tset ]; then
		if [ X"$XTERM_VERSION" = X"" ]; then
			eval `/usr/bin/tset -sQ '-munknown:?vt220' $TERM`
		else
			eval `/usr/bin/tset -IsQ '-munknown:?vt220' $TERM`
		fi
	fi
	;;
esac

#############

#export PKG_PATH=ftp://ftp.ulak.net.tr/OpenBSD/snapshots/packages/`machine -a`/
#export PKG_PATH=ftp://ftp.openbsd.org/pub/OpenBSD/snapshots/packages/`machine -a`/
export PKG_PATH=ftp://ftp.openbsd.org/pub/`uname -s`/`uname -r`/packages/`machine -a`/
#tets# PKG_PATH=ftp://ftp.eu.openbsd.org/pub/OpenBSD/`uname -r`/packages/`uname -m`/
export PKG_CACHE="$HOME/PKG_Downloads"

alias pstree="pstree -w"
alias s=clear
alias pfedit="vim /etc/pf.conf"
alias sockstat="netstat -an | grep *."
alias ll="ls -Alh"


####### Colored Shell #######
e=`printf "\033"`
end="$e[0m"
red="$e[1;31m"
green="$e[1;32m"
yellow="$e[1;33m"
blue="$e[1;34m"
magenta="$e[1;35m"
darkcyan="$e[36m"
unset e
PS1='${red}$(jot -s "" -b "." ${COLUMNS})${end}
${yellow}$(id -un)@$(hostname)${end}: ${green}${PWD}${end} $(date "+%F %T")
# '

