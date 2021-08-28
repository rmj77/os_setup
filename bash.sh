if [ -f ~/.profile ]; then
    rm ~/.profile
fi

if [ -f ~/.bash_logout ]; then
    rm ~/.bash_logout
fi

if [ -f ~/.bash_profile ]; then
    rm ~/.bash_rofile
fi

if [ -f ~/.bashrc ]; then
    rm ~/.bashrc
fi

cp .bashrc ~/.bashrc
cp .bash_profile ~/.bash_profile
