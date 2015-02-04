# Global
alias simpser='python -m SimpleHTTPServer'
alias freakout='git commit -am "Quick push. No time for messages. This is an alias." && git push'
alias server="ssh kevin@10.32.196.96"
alias ll='ls -al'
alias ls='ls -l'
alias ltr='ls -l -t -r' # ls command: long, sort by mod date, rev order

# For goodness
alias o='open ./'
alias s='subl ./'

case "$OSTYPE" in
  solaris*)
    echo "SOLARIS"
    ;;
  darwin*)
    ## OSX
    alias xmysql='/Applications/XAMPP/xamppfiles/bin/mysql'
    
    # For looks
    alias hidedesktop='defaults write com.apple.finder CreateDesktop false; killall Finder'
    alias showdesktop='defaults write com.apple.finder CreateDesktop true; killall Finder'
    
    # For killing and recovering the dock
    alias hidedock='defaults write com.apple.Dock autohide-delay -float 1000 && killall Dock'
    alias showdock='defaults delete com.apple.Dock autohide-delay && killall Dock'
    ;; 
  linux*)
    echo "LINUX"
    ;;
  bsd*)
    echo "BSD"
    ;;
  *)   
    echo "unknown: $OSTYPE"
    ;;
esac