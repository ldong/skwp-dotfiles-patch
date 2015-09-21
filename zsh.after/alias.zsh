# ======================== Customized Alias ===================
alias cd..="cd .."
alias cd...="cd ../.."
alias cd....="cd ../../.."
alias cd.....="cd ../../../.."
alias cd......="cd ../../../../.."

alias v='vim'

# Find out my ip, http://ifconfig.me
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
# alias lanip="ifconfig | sed -n 's/.*inet addr:\([0-9.]\+\)\s.*/\1/p'"
alias lanip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
# alias showip="ifconfig | grep 'inet ' | grep -v 127.0.0.1"
alias showip="ifconfig | egrep -o '([[:digit:]]{1,3}\.){3}[[:digit:]]{1,3}'"
# ipconfig getifaddr en1

# Kill process of retaining port
#sudo lsof -i :9000
#sudo kill -9 61342

# display the colors
alias colors='bash ~/.dotfiles/color.sh'
alias color256='python ~/.dotfiles/checkColor.py'

# remove vim cache files
alias rmswp='find . -name \*.swp -type f -delete'

# remove python pyc files
alias rmpyc='find . -name \*.pyc -type f -delete'

# echo "text" | rot13
alias rot13="tr '[A-Za-z]' '[N-ZA-Mn-za-m]'"

# Count files
alias countCurrentFiles='ls -1 | wc -l'
alias countTotalFiles='find . -type f | wc -l'

# download uses aria2
alias download='aria2c -s 10 '
alias downloadDirectory='wget -r -np '

# git push and pull
# git checkout --orphan gh-pages
alias gpushPages='git push origin gh-pages'
alias gpush='git push origin master'
alias gpull='git pull origin master'
alias gitname='git config --global user.name "Lin Dong"'
alias gitemail='git config --global user.email "ldong@ldong.org"'
alias gclean='git reset --hard && git clean -dfx'
alias gitcopy='git clone --depth 1 '
alias giturl='git remote show origin'
alias gitroot='git rev-parse --show-toplevel'
alias gitreset='git rm --cached '
alias gitrmcache=gitreset
alias gittree='git log --graph --decorate --pretty=oneline --abbrev-commit'

# Rails
alias railsUP='rails s -b 0.0.0.0'

# local http servers use python
function httphere {
  httpherePort=$((((RANDOM + RANDOM) % 1000) + 8000))
  echo $httpherePort
  python -m SimpleHTTPServer $httpherePort
  # python -m SimpleHTTPServer $1
}

alias httphere8080='python -m SimpleHTTPServer 8080'
alias httphereWithUpload='python ~/.dotfiles/SimpleHTTPServerWithUpload.py 8080'

alias cls='clear'
alias ll='ls -l'
alias la='ls -a'

if [ "$(uname -s)" '==' "Darwin" ]; then
  alias ls='ls -F -G'
else
  alias ls='ls -F --color=auto'
fi

alias vi='vim'
alias javac="javac -J-Dfile.encoding=utf8"
alias grep="grep --color=auto"
alias -s html=vi  # open files in vim
alias -s rb=vi
alias -s py=vi
alias -s js=vi
alias -s c=vi
alias -s java=vi
alias -s txt=vi
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
