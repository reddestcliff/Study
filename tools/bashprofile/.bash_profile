# Enable tab completion
source ~/git-completion.bash
export PATH=/c/Anaconda2:/c/Anaconda2/Scripts:$PATH

# colors!
green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"

# Change command prompt
source ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
export PS1="$purple\u$green\$(__git_ps1)$blue \W $ $reset"

alias ul='source ~/.bash_profile'

####################
# software related
####################
alias python='winpty python.exe'
alias smac='~/emacs/bin/runemacs.exe --inscure'
alias winmerge='/C/Program\ Files\ \(x86\)/WinMerge/WinMergeU'
alias dfxy="'C:\Program Files (x86)\WinMerge\WinMergeU' 'pathx' 'pathy' "



####################
# path related
####################
alias hub='cd /d/Cloud/Box\ Sync/Github'
alias mypy='cd /d/Cloud/Box\ Sync/Github/Study/scripts/python'
alias npp="'C:/Program Files (x86)/Notepad++/notepad++.exe'"

####################
# open network path
####################
alias opnet='start file://192.168.0.1'


#################
# matlab
##################
alias recovermatlab='cp ~/AppData/Roaming/MathWorks/MATLAB/R2016a/MATLABDesktop.xml.prev ~/AppData/Roaming/MathWorks/MATLAB/R2016a/MATLABDesktop.xml'