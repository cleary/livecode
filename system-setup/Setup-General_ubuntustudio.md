# General Setup Steps

### add Ubuntu Studio backports repo
```
sudo add-apt-repository ppa:ubuntustudio-ppa/backports
sudo apt-get dist-upgrade
```
### add my SuperCollider backport repo
```
https://launchpad.net/~bernard-gray/+archive/ubuntu/supercollider
```

### Use pipewire as audio subsystem
20230515 Follow the instructions here:
 - https://pipewire-debian.github.io/pipewire-debian/

*Note: pipewire is already default in vanilla Ubuntu 22.10, this will likely make it's way into Studio in the near future

### Configure multiple virtual midi-through ports
Create a new file: `/etc/modprobe.d/midi_virtual.conf`
With the contents:
```
options snd-seq-dummy ports=4
```
where `ports=` can be configured for the number of ports you want available, and these appear numbered in qjackctl and similar

### Install TidalCycles
20230515 Follow the instructions here:
 - https://github.com/cleary/ansible-tidalcycles

### Replace snap installed firefox with non-snap
20230515 Follow the instructions here:
 - https://haydenjames.io/remove-snap-ubuntu-22-04-lts/

*Note: this also includes apt-pinning to avoid snap making a comeback*

### Install carla from backports
20230515 Ref Issue: https://github.com/falkTX/Carla/issues/1063
Follow instructions at:
 - https://github.com/falkTX/Carla/issues/1063#issuecomment-1543056159

## Synths

### Install Synths
 - [Vital](https://vital.audio/) - Open Source Wavetable synth

### Under Investigation
- [Dexed](https://github.com/asb2m10/dexed): Open Source DX7 clone
- [JS80P](https://github.com/attilammagyar/js80p): Open Source Yamaha CS-80 clone
- [Surge XT](https://surge-synthesizer.github.io/): Open Source Synthesizer
- [Helm](https://tytel.org/helm/)
- [Odin 2](https://thewavewarden.com/pages/odin-2) Open Source 24 Voice Polyphonic Beast
