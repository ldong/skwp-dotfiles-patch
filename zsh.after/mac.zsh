# =============================== Mac Only =====================================
# Set Solarized color
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad

# Specify your defaults in this environment variable for brew cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# kill docks
alias killdock='killall -KILL Dock'

# hide apps, i.e. sudo chflags hidden /Applications/Game\ Center.app
alias hideapp='sudo chflags hidden '

# edit host
alias edithosts='sudo vim /private/etc/hosts'

# pdf_join merged.pdf 1.pdf 2.pdf
function pdf_join {
  join_py="/System/Library/Automator/Combine PDF Pages.action/Contents/Resources/join.py"
  read "output_file?Name of output file > "
  "$join_py" -o $output_file $@ && open $output_file
}

alias rm='rmtrash'

# whatis $(ls /bin | gshuf -n 1)

alias cleanDNS='sudo discoveryutil udnsflushcaches'

alias resetSparkInspector="rm '~/Library/Application Support/.spark_settings'"

alias iPadOn='defaults write com.apple.PowerChime ChimeOnAllHardware -bool true; open /System/Library/CoreServices/PowerChime.app & '
alias iPadOff='defaults write com.apple.PowerChime ChimeOnAllHardware -bool false;killall PowerChime '

alias brewup='brew update && brew upgrade && brew cleanup'
alias bbb=brewup

function mvimp(){
  mvim --remote-tab-silent $@
}

callFromiPhone () {
  open "tel://"$1
}
