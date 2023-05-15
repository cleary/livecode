# General Setup Steps

### Use pipewire as audio subsystem
20230515 Follow the instructions here:
 - https://pipewire-debian.github.io/pipewire-debian/

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

### Install Vital Wavetable synth
 - https://vital.audio/

### Install carla from backports
20230515 Ref Issue: https://github.com/falkTX/Carla/issues/1063
Follow instructions at:
 - https://github.com/falkTX/Carla/issues/1063#issuecomment-1543056159
