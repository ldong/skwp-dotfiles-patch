# ========================= Python Only =======================
# sudo easy_install pip
alias ipy='ipython'
alias ipython3='python3 -m IPython'


# execute virtualenv wrapper
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  source /usr/local/bin/virtualenvwrapper.sh
fi
# source /usr/bin/virtualenvwrapper.sh
# export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python

# set where virutal environments will live
# export WORKON_HOME=$HOME/.virtualenvs
# ensure all new environments are isolated from the site-packages directory
# export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
# use the same directory for virtualenvs as virtualenvwrapper
# export PIP_VIRTUALENV_BASE=$WORKON_HOME
# makes pip detect an active virtualenv and install to it
# export PIP_RESPECT_VIRTUALENV=true

# if [[ -r ~/.dotfiles/virtualenvwrapper.sh  ]]; then
#   source ~/.dotfiles/virtualenvwrapper.sh
# else
#   echo "WARNING: Can't find virtualenvwrapper.sh"
# fi

# pyenv
# eval "$(pyenv init -)"
# export VIRTUALENVWRAPPER_PYTHON=/Users/ldong/.pyenv/shims/python
# Add auto complete to python
export PYTHONPATH=$PYTHONPATH:$(which python)
# export PYTHONPATH=$PYTHONPATH:/Users/ldong/.pyenv/shims/python
# export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python3.4/site-packages
# export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages
# export PYTHONSTARTUP=~/.pythonrc
export PYTHONPATH=$PYTHONPATH:/Users/ldong/.local/lib/python2.7/site-packages/
