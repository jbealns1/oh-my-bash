# This is combination of works from two different people which I combined for my requirement.
# Original PS1 was from reddit user /u/Allevil669 which I found in thread: https://www.reddit.com/r/linux/comments/1z33lj/linux_users_whats_your_favourite_bash_prompt/
# I used that PS1 to the bash-it theme 'morris', and customized it to my liking. All credits to /u/Allevil669 and morris.
#
# prompt theming

# added TITLEBAR for updating the tab and window titles with the pwd
case $TERM in
	xterm*)
		TITLEBAR=$(printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}")
		;;
	screen)
		TITLEBAR=$(printf "\033]0;%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}")
		;;
	*)
		TITLEBAR=""
		;;
esac
if [ "$?" == "0" ]
then
		SC="${green}^_^";
else
		SC="${red}T_T";
fi

function prompt_command() {
        PROMPT_DIRTRIM=4
	PS1="\n${cyan}┌─${bold_white}[\u@\h]${cyan}─${bold_orange}[$(kubectx --current):$(kubens --current)]${cyan}─${bold_yellow}(\w)$(scm_prompt_info)\n${cyan}└─${bold_green}[\A]${green}${bold_green}\$${white} "
}

# scm theming
SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓"
SCM_THEME_PROMPT_PREFIX="${bold_cyan}("
SCM_THEME_PROMPT_SUFFIX="${bold_cyan})${reset_color}"


safe_append_prompt_command prompt_command
