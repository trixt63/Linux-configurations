1. Check battery health:
        upower -i /org/freedesktop/UPower/devices/battery_BAT0
2. Check SSD health:
- Install smartmontools.
- Run:
        df -h
  to see the name of the SSD (in this computer, it's /dev/nvme0n1p2).
- Run:
        sudo smartctl -t short -a /dev/sdX
  to run a short test on your SSD.
- Run 
        sudo smartctl -A /dev/sdX to
  to display the result. Pay attention to "Percentage Used".