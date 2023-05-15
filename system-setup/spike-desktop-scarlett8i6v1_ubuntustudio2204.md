# System Details
 - CPU: Intel 8th Gen i5
 - Video: AMD Firepro W4100 GPU
 - Audio Hardware: Scarlett 8i6 Gen 1
 - OS: Ubuntu Studio 22.04
 - Audio Subsystem: [pipewire](https://pipewire-debian.github.io/pipewire-debian/)

## Troubleshooting
### Clipping Audio playback
Ref: https://forum.manjaro.org/t/howto-troubleshoot-crackling-in-pipewire/82442
 - Edit `/usr/share/pipewire/media-session.d/alsa-monitor.conf`
 - Set `api.alsa.headroom      = 512`
 - Restart pipewire `systemctl --user restart pipewire`

### Preamp/Inputs not registering any signal
This is a default misconfiguration in alsa - the easiest way I found to fix it was to noodle around in `qasmixer`. 

Specifically:
 - open `qasmixer`
 - select the Scarlett 8i6 from the `hw:` item in the right hand pane
 - using the speaker and mic icons at the bottom of that pane, display only the input sources
 - map `Analog [1-4]` to `Input Source 1-4` 
 - run `sudo alsactl store` to save state

### Headphone jack not playing back any signal
This is a default misconfiguration in alsa - the easiest way I found to fix it was to noodle around in `qasmixer`. 

Specifically:
 - open `qasmixer`
 - select the Scarlett 8i6 from the `hw:` item in the right hand pane
 - using the speaker and mic icons at the bottom of that pane, display only the playback elements
 - make sure the `Master` channels (leftmost) have enable playback switches (toggle at the bottom of the slider)
 - Set the `Master 1L * Source` to `PCM 1` and `Master 1R * Source` to `PCM 2` 
 - run `sudo alsactl store` to save state
