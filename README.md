### DNF Configuration
`sudo nano /etc/dnf/dnf.conf`

```
fastestmirror=True
max_parallel_downloads=10
defaultyes=True
```


### RPM Fusion Free & Nonfree Repos
`sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm`


### Media Codecs
`sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel`

`sudo dnf install lame* --exclude=lame-devel`

`sudo dnf group upgrade --with-optional Multimedia`

`sudo dnf install ffmpeg ffmpeg-devel`


### VLC
`sudo dnf install vlc`


### Gnome
`sudo dnf install gnome-tweaks gnome-extensions-app`


### VSCODE
`sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc`

`sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'`

`sudo dnf install code`


### Terminal
`sudo dnf install tilix zsh lsd`


### Dotfile links
`ln -sv ~/.dotfiles/.bash_profile ~`

`ln -sv ~/.dotfiles/.bashrc ~`

`ln -sv ~/.dotfiles/.zshrc ~`

`ln -sv ~/.dotfiles/git/.gitconfig ~`


### Crow Translate
`sudo dnf copr enable carlis/crow-translate`

`sudo dnf install crow-translate`

### Jetbrains Toolbox
`sudo curl -fsSL https://raw.githubusercontent.com/nagygergo/jetbrains-toolbox-install/master/jetbrains-toolbox.sh | bash`

`jetbrains-toolbox`

### Ssh Key

`ssh-keygen -t rsa -b 4096 -C "onurrguven@gmail.com"`
`cat ~/.ssh/id_rsa.pub`

### Docker
`sudo dnf -y install dnf-plugins-core`

``sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo``

``sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose``

`sudo systemctl start docker`

`sudo usermod -aG docker $(whoami)`

`newgrp docker`

### NodeJS

`curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash`

`nvm install node`


### Chromium
`sudo dnf install chromium`

### Snapd & Flathub
`sudo dnf install snapd`

`sudo ln -s /var/lib/snapd/snap /snap`

`flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo`

### ngrok

`sudo snap install ngrok`


### App Images

`flatpak install flathub rest.insomnia.Insomnia`

`flatpak install flathub org.filezillaproject.Filezilla`

`flatpak install flathub org.gimp.GIMP`

`flatpak install flathub com.spotify.Client`

`flatpak install flathub com.stremio.Stremio`

`flatpak install flathub com.xnview.XnConvert`

`flatpak install flathub com.discordapp.Discord`
