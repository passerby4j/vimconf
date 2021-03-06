# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Custom plugins and themes may be added to ~/.oh-my-fish/custom
# Plugins and themes can be found at https://github.com/oh-my-fish/
Theme 'robbyrussell'
Plugin 'theme'
Plugin "brew"
Plugin "git-flow"
Plugin "gi"

# Alias
alias gitlog "git log --graph --pretty=format:'%C(yellow)%h%Creset%C(blue)%d%Creset %C(white bold)%s%Creset %C(white dim)(by %an %ar)%Creset'"
alias gits "git status"
alias goget "gopm get -g -v"
alias gitref "git remote update origin --prune"

# for c/c++ build env
# set -x CXX /usr/local/bin/g++-4.9
# set -x CC /usr/local/bin/gcc-4.9
# set -x CPP /usr/local/bin/cpp-4.9

# Set PATH with /usr/local at first place
set -x PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin

# for golang env
set -x GOPATH /Users/zippo/develop/GO
set -x GOBIN $GOPATH/bin
set -x GOROOT /usr/local/Cellar/go/1.4.2/libexec
set -x PATH $GOROOT/bin $GOBIN $PATH

# Set git_editor as the private vim
set -x GIT_EDITOR /usr/local/bin/vim

# for docker env
# set -x ALL_PROXY socks5://127.0.0.1:1080
# set -x DOCKER_HOST tcp://192.168.59.103:2376
# set -x DOCKER_CERT_PATH /Users/zippo/.boot2docker/certs/boot2docker-vm
# set -x DOCKER_TLS_VERIFY 1

# Load autojump configuration.
. /usr/local/share/autojump/autojump.fish

# Functions for the fuck
function __thefuck_repl -d 'Replace operators into fish-compatible'
    set -l tmp (echo $argv | sed 's/ && / ; and /g')
    echo $tmp | sed 's/ || / ; or /g'
end

function fuck -d 'Correct your previous console command'
    set -l eval_script (mktemp 2>/dev/null ; or mktemp -t 'thefuck')
    thefuck $history[1] > $eval_script
    eval (__thefuck_repl (cat $eval_script))
    rm $eval_script
end


