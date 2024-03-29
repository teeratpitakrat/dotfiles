#!/bin/bash

# First, manually start jack with cadence

pacmd load-module module-jack-sink channels=2 # Jack sink #2 for pulseaudio
#pacmd load-module module-jack-sink channels=2 # Jack sink #3 for something else

pacmd load-module module-jack-source channels=2 # Jack source #2 for something else
#pacmd load-module module-jack-source channels=2 # Jack source #3 for something else

a2jmidi_bridge m4 & # Alsa 2 Jack MIDI bridge for MIDI device connected to hardware
a2jmidi_bridge mpc & # Alsa 2 Jack MIDI bridge for MIDI device connected to hardware
sleep 2

# Start applications
i3-msg "workspace 3; append_layout ~/.dotfiles/music_studio/i3wm-layouts/ws-3.json"
hydrogen &
guitarix &
jamulus &
jack_mixer -c ~/.dotfiles/music_studio/jack-mixers/inputs.xml mixer-inputs &
jack_mixer -c ~/.dotfiles/music_studio/jack-mixers/outputs.xml mixer-outputs &
pavucontrol &
sleep 2

i3-msg "workspace 4; append_layout ~/.dotfiles/music_studio/i3wm-layouts/ws-4.json"
#qsampler ~/.dotfiles/music_studio/qsampler/sampler.lscp &
zynaddsubfx &
qjackctl &
sleep 10

#jack-keyboard &

# Clear and restore connections
aj-snapshot -ajxr ~/.dotfiles/music_studio/jack-connections/studio
