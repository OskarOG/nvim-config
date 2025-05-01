# Linux

Install ZSH and Oh my zsh

## NVIM

### Install misc 
```
sudo apt install build-essential
sudo apt install unzip
```
### Install dotnet
```
curl -L https://dot.net/v1/dotnet-install.sh -o dotnet-install.sh
chmod +x ./dotnet-install.sh
./dotnet-install.sh --channel 9.0
```

### Install yazi
```
sudo apt install ffmpeg 7zip jq poppler-utils fd-find ripgrep fzf zoxide imagemagick
curl -LO https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-gnu.zip
7za yazi-x86_64-unknown-linux-gnu.zip
```
add to path in `.zshrc`
```
export PATH="$PATH:$HOME<path-to-yazi-bin>"
```


