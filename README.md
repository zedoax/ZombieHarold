# ZombieHarold
Harold, back from the dead!  (A music player that authenticates via LDAP/One-Wire to play music from Audiophiler's API

## Instructions ##
> Navigate to /opt/harold
> enter `git clone https://github.com/zedoax/ZombieHarold.git`
> move the systemd script to /var/systemd/system/
> enter `sudo systemctl daemon-reload`
> enter `sudo systemctl start harold.service`
> enter `sudo systemctl enable harold.service`
