if [ -f ~/.profile ]; then
    rm ~/.profile
fi

if [ -f ~/.bash_logout ]; then
    rm ~/.bash_logout
fi

if [ -f ~/.bash_profile ]; then
    rm ~/.bash_profile
fi

if [ -f ~/.bashrc ]; then
    rm ~/.bashrc
fi

cp res/.bashrc ~/.bashrc
cp res/.bash_profile ~/.bash_profile
