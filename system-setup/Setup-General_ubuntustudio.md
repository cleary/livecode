# General Setup Steps

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

### Install Vital Wavetable synth
 - https://vital.audio/

### Under Investigation
- [Dexed](https://github.com/asb2m10/dexed): Open Source DX7 clone
- [JS80P](https://github.com/attilammagyar/js80p): Open Source Yamaha CS-80 clone
- [surge](https://surge-synthesizer.github.io/)
