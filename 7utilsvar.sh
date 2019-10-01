#!/bin/bash
sudo apt-get install -y ranger caca-utils highlight atool w3m poppler-utils mediainfo
ranger --copy-config=all

sudo apt install -y cmus vlc
sudo apt install -y at
wget -O  ~/Desktop/alarm_clock_1.wav http://soundbible.com/grab.php\?id\=2176\&type\=wav
sudo cp alarm_clock.sh alarm /usr/local/bin

chmod +x music.sh
ln -s $PWD/music.sh $HOME/music.sh
ls -l $HOME/music.sh
sudo ln -s $PWD/startmusic.service /lib/systemd/system/startmusic.service
sudo systemctl start startmusic
sudo systemctl enable startmusic
echo 'bind -f common q shell tmux detach' > $HOME/.config/cmus/rc

sudo cp cpdownload /usr/local/bin
sudo chmod +x /usr/local/bin/cpdownload

sudo apt-get install -y safeeyes
sudo apt-get install -y xprintidle

ln -s $PWD/safeeyes.sh $HOME/safeeyes.sh
ls -l $HOME/safeeyes.sh
cp ./safeeyes.json $HOME/.config/safeeyes/safeeyes.json

sudo ln -s $PWD/safeeyes.service /lib/systemd/system/safeeyes.service
sudo systemctl start safeeyes
sudo systemctl enable safeeyes
sudo snap install telegram-desktop
sudo apt install keepass2

sudo cp ./gitpush /usr/local/bin
sudo chmod +x /usr/local/bin/gitpush