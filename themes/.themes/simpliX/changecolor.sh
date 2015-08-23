#!/bin/sh
if [ ! -t 0 ]; then
	x-terminal-emulator -e "$0"
	exit 0
fi
basedir="$(dirname "$(readlink -f "${0}")")"
cd "$basedir"
command -v convert >/dev/null 2>&1 || { echo >&2 "I require ImageMagick >= 6.7.7 but it's not installed.  Aborting."; exit 1; }
command -v gif2png >/dev/null 2>&1 || { echo >&2 "I require gif2png >=2.5.8 but it's not installed.  Aborting."; exit 1; }
command -v sed >/dev/null 2>&1 || { echo >&2 "I require sed but it's not installed.  Aborting."; exit 1; }
read -p "Please enter your new color in HEX(eg. #ff00ff for pink, #407dec for blue, etc.) " NEWCOLOR
echo "This may take a while"
find . -type f -exec sed -i 's/#e04613/'$NEWCOLOR'/g' {} \;
for name in `find . -maxdepth 7 -wholename "./*.png" | grep -v background.png | grep -v preview.png | grep -v wallpaper1.png`; do 
	convert -define png:format=png32 $name -fill "$NEWCOLOR" -opaque "#e04613" "$name"
done
for name in `find . -maxdepth 7 -wholename "./*.gif"`; do 
	gif2png -O "$name"
	convert -define png:format=png32 `echo $name|sed 's/gif/png/g'` -fill "$NEWCOLOR" -opaque "#e04613" `echo $name|sed 's/gif/png/g'` 
	convert `echo $name|sed 's/gif/png/g'` "$name"
	rm `echo $name|sed 's/gif/png/g'`
done
cp -f "$basedir"/gtk-2.0/images/checkradiochecked.gif "$basedir"/gtk-2.0/images/checkradioinconsistentchecked.gif
cp -f "$basedir"/gtk-2.0/images/checkradiochecked.gif "$basedir"/gtk-2.0/images/checkradiocheckedprelight.gif
cp -f "$basedir"/gtk-2.0/images/checkradiochecked.gif "$basedir"/gtk-2.0/images/checkradioinconsistentprelight.gif
cd "$basedir"/extras/GTK3
for folder in `find . -maxdepth 1 -type d | grep GTK-3.`; do 
	cd "$folder"/simpliX/gtk-3.0/images
	cp -f checkradiochecked.gif checkradioinconsistentchecked.gif
	cp -f checkradiochecked.gif checkradiocheckedprelight.gif
	cp -f checkradiochecked.gif checkradioinconsistentprelight.gif
	cd ../../../../
done
echo "done"
