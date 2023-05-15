# System Details
 - CPU: Intel 8th Gen i5
 - Video: AMD Firepro W4100 GPU
 - Audio Hardware: Scarlett 8i6 Gen 1
 - OS: Ubuntu Studio 22.04
 - Audio Subsystem: [pipewire](https://pipewire-debian.github.io/pipewire-debian/)

# Troubleshooting
## Clipping Audio playback
Ref: https://forum.manjaro.org/t/howto-troubleshoot-crackling-in-pipewire/82442
 - Edit `/usr/share/pipewire/media-session.d/alsa-monitor.conf`
 - Set `api.alsa.headroom      = 512`
 - Restart pipewire `systemctl --user restart pipewire`
