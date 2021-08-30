if [ "`uname`" == "Darwin" ]; then
    bash src/macos.sh
elif [ "`uname`" == "Linux"]; then
    ### TODO Add more checks here for distros
    bash src/ubuntu.sh
fi