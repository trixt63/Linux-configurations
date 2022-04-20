# User interface customization for X11 

## 1. i3wm

- There are currently 3 themes:
	- Nord light
	- Lunaria light
	- Sushi
The materials for each theme are categorized in ```backgrounds``` and ```themes``` folder.
Put the content into ~./local/share/backgrounds, ~/.local/share/themes
Do the same to the contents of ```fonts``` and ```icons``` folders.
However, installation of Papirus-folders icon is recommended 

- Install the following packages:

	- **feh**: setting background images
	- **lxappearance**: setting the fonts, and the gtk themes
	- **brightnessctl**: controlling the brightness keys
	- **i3blocks**: decorating the i3bar
	- **rofi**: dmenu alternatives. You should install [rofi themes by adi1090x](https://github.com/adi1090x/rofi) first

 The i3 config files are in ```i3``` folders. Put the contents into ~/.config/i3. Choose the right config file and change its name to ```config```

- Put the contents of ```rofi``` into ```~/.config/rofi```. This folder is just a copy of [rofi themes by adi1090x](https://github.com/adi1090x/rofi)

PREVIEW

With Nord theme
![img](/i3-nord.png)

With Lunaria theme
![img](/i3-lunaria.png)

With Sushi theme
![img](/i3-sushi.png)


## 2. Xfce

USAGE:
1. ```backgrounds```, ```icons```, ```themes``` and ```xfce4-panel-profiles``` folders: Put in to the respective folders in your ```~/.local/share```. 

- Installation of **xfce4-panel-profile** package is recommended.
- For icons, installation of and **papirus-nord** is recommended.

2. ```conky```: Put the contents into ```~/.conky```.

Of course you have to install **conky** first. Installation of **conky-manager2** is recommended.

3. ```terminal```: contains the config file including the color preset for you xfce4-terminal. Put the contents (the ```terminalrc```) into your ```~/.config/xfce4/terminal```.

Alternatively, you can use [Gogh](https://gogh-co.github.io/Gogh/) instead

PREVIEW

Preview with simplemanjaro conky (although it's Debian)
![img](/nord-simplemanjaro-preview.png)



