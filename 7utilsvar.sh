#!/bin/bash

git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install
sudo apt-get install -y ranger caca-utils highlight atool w3m poppler-utils mediainfo
ranger --copy-config=all

rm -rf $HOME/.config/ranger
ln -s $PWD/subconfs/ranger $HOME/.config/ranger

sudo apt install -y cmus vlc
sudo apt install -y at
cp ./var-scripts/alarm_clock_1.mp3 $HOME/
# wget -O  ~/Desktop/alarm_clock_1.wav https://soundbible.com/grab.php?id=1477&type=wav
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
sudo apt-get install -y stgit

ln -s $PWD/safeeyes.sh $HOME/safeeyes.sh
ls -l $HOME/safeeyes.sh
cp ./safeeyes.json $HOME/.config/safeeyes/safeeyes.json

sudo ln -s $PWD/safeeyes.service /lib/systemd/system/safeeyes.service
sudo systemctl start safeeyes
sudo systemctl enable safeeyes
sudo snap install telegram-desktop
sudo apt-get install -y install keepass2

sudo cp ./var-scripts/gitpush /usr/local/bin
sudo chmod +x /usr/local/bin/gitpush

sudo apt-get install -y taskwarrior vit cpanminus
rm -rf $HOME/.task
ln -s $HOME/Documents/code/tasking/.task.d $HOME/.task
rm -rf $HOME/tasknotes
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
ln -s $PWD/var-scripts/on-add-emacs-schedule.py $HOME/.task/hooks/on-add-emacs-schedule.py
chmod +x $HOME/.task/hooks/on-add-emacs-schedule.py

ln -s $PWD/var-scripts/on-add-alarm-push.py $HOME/.task/hooks/on-add-alarm-push.py
chmod +x $HOME/.task/hooks/on-add-alarm-push.py

sudo apt-get install -y timewarrior
rm -rf $HOME/.timewarrior
ln -s $HOME/Documents/code/tasking/.timewarrior.d/ $HOME/.timewarrior
pushd /tmp
curl -O https://taskwarrior.org/download/timew-1.1.1.tar.gz
tar -xf timew-1.1.1.tar.gz
pushd timew-1.1.1
cp ext/on-modify.timewarrior ~/.task/hooks
chmod +x ~/.task/hooks/on-modify.timewarrior
popd
popd
sudo apt-get install -y vifm
sudo cp ./var-scripts/attach_vifm /usr/local/bin
sudo chmod +x /usr/local/bin/attach_vifm

sudo cp ./var-scripts/xcat /usr/local/bin
sudo chmod +x /usr/local/bin/xcat
sudo gem install zeal

sudo apt-get install -y nomacs
sudo apt-get install -y  sdcv
