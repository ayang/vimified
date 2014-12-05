#!/usr/env sh

INSTALLDIR=${INSTALLDIR:-"$PWD/.vim"}

echo "Welcome friend!"
echo "You are about to be vimified. Ready? Let us do the stuff for you."

which git > /dev/null
if [ "$?" != "0" ]; then
  echo "You need git installed to install vimified."
  exit 1
fi

which vim > /dev/null
if [ "$?" != "0" ]; then
  echo "You need vim installed to install vimified."
  exit 1
fi

if [ ! -d "$INSTALLDIR" ]; then
    echo "As we can't find Vimified in the current directory, we will create it."
    git clone git://github.com/ayang/vimified.git $INSTALLDIR
    cd $INSTALLDIR

else
    echo "Seems like you already are one of ours, so let's update Vimified to be as awesome as possible."
    cd $INSTALLDIR
    git pull origin master
fi

if [ ! -d "bundle" ]; then
    echo "Now, we will create a separate directory to store the bundles Vim will use."
    mkdir bundle
    mkdir -p tmp/backup tmp/swap tmp/undo
fi

if [ ! -d "bundle/vundle" ]; then
    echo "Then, we install Vundle (https://github.com/gmarik/vundle)."
    git clone https://github.com/gmarik/vundle.git bundle/vundle
fi

if [ ! -f local.vimrc ]; then
  echo "Let's create a 'local.vimrc' file so you have some bundles by default."
  echo "let g:vimified_packages = ['general', 'fancy', 'css', 'js', 'os', 'html', 'coding', 'color']" > 'local.vimrc'
fi

echo "There you are! Welcome in our world."
echo "From now, do not hesitate to ask for help to the people behind Vimfied: https://github.com/zaiste/vimified/graphs/contributors"
echo "We welcome any bros/sistas who want to contribute: https://github.com/zaiste/vimified#call-for-help"
echo "Report any issue/need: https://github.com/zaiste/vimified/issues"
echo "At last, and before all, read the documentation: http://zaiste.github.com/vimified/"

echo "Enjoy!"

vim +BundleInstall +qall 2>/dev/null

