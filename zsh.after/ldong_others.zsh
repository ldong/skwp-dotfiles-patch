# ============================ Other Stuff =====================================
# ranger, vifm
# DEB for browser
# Htop, better than top
# z, fasd, better than autojump
# colors.sh
# spectacle, mac app

# SVN
# svn add all
function svn-addall(){
  svn st | grep '^?' | sed 's/^[? ]*/"/' | sed 's/$/"/' | xargs svn add
  svn status;
}

# svn stash current working directory to a patch
function svn-stash(){
  svn diff > $1.patch; svn revert -R .
}

# revert patch to current working directory
function svn-stash-apply(){
  patch -p0 < $1.patch
}


alias findFileByFileName="find . -type f -name "
alias cleanSwpFile="find . -name '*.swp' -type f -delete"
alias cleanDSFile="find . -name '*.DS_Store' -type f -delete"

alias ssldump="sudo /usr/local/Cellar/ssldump/0.9b3/sbin/ssldump "

# check ports
# lsof -i -P | grep 8090
# lsof -i :8080

# Delete folder
# ls | grep -E ^.{8}$ | xargs rmtrash


alias fuck='$(thefuck $(fc -ln -1))'
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'
alias FUCK='fuck'

function zss() {
  cd /Users/ldong/zscaler/ui/userinterface/zmanage/web/scss;
  sass --watch app.scss:/Users/ldong/zscaler/ui/userinterface/zmanage/build/css/app.css;
}

