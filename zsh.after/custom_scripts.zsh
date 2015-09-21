# ======================== Customized Scripts ==================================
# extract filename.zip
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# color man page
man() {
  /usr/bin/man $* | \
    col -b | \
    vim -R -c 'set ft=man nomod nolist' -
}

# find the name with regex
findi() {
  find . -iname $1;
}

findj() {
  find . -iname $1"*";
}


# json pretty print
alias json="python -mjson.tool"


