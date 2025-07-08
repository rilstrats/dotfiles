# disable systemctl scripts in case they're already loaded
sudo systemctl disable openrgb-poweron.service
sudo systemctl disable openrgb-suspend.service
sudo systemctl disable openrgb-resume.service

# load kernel modules
# sudo modprobe --first-time i2c-dev
# sudo modprobe --first-time i2c-i801
# sudo cp i2c.conf /etc/modules-load.d # set up autoloading

# install systemctl scripts
sudo cp openrgb-poweron.service openrgb-suspend.service openrgb-resume.service /etc/systemd/system
sudo systemctl daemon-reload

# enable systemctl scripts
sudo systemctl enable openrgb-poweron.service
sudo systemctl enable openrgb-suspend.service
sudo systemctl enable openrgb-resume.service
