BG_URI=https://tbcmanchester.com/wp-content/uploads/2018/05/low-poly-background-gray.png
BG_FILE=~/desktop.png
#curl $BG_URI > $BG_FILE
wget $BG_URI -O desktop.png
gsettings set org.gnome.desktop.background picture-uri file:///$BG_FILE
