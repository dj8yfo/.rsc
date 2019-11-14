#!/bin/bash
sudo apt-get install -y ranger caca-utils highlight atool w3m poppler-utils mediainfo
ranger --copy-config=all

sudo apt install -y cmus vlc
sudo apt install -y at
wget -O  ~/Desktop/alarm_clock_1.wav https://soundbible.com/grab.php?id=1477&type=wav
sudo cp ./var-scripts/alarm_clock.sh ./var-scripts/alarm /usr/local/bin

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

sudo cp ./var-scripts/gitpush /usr/local/bin
sudo chmod +x /usr/local/bin/gitpush

sudo apt-get install -y taskwarrior cpanminus
ln -s $HOME/Documents/code/tasking/.task.d $HOME/.task
ln -s $HOME/Documents/code/tasking/.tasknotes.d $HOME/tasknotes

git clone https://github.com/ValiValpas/taskopen.git /tmp/taskopen
rm -rf /tmp/taskopen
pushd /tmp/taskopen
sudo make PREFIX=/usr install
popd
rm $HOME/.taskrc
ln -s $PWD/.taskrc $HOME/.taskrc
rm $HOME/.taskopenrc
ln -s $PWD/.taskopenrc $HOME/.taskopenrc
sudo cpanm install JSON

pip install taskwarrior-time-tracking-hook
ln -s $(pyenv which taskwarrior_time_tracking_hook) $HOME/.task/hooks/on-modify.timetracking
