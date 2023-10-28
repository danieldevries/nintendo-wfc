# Nintendo-WFC

A small Sinatra application to enable or disable the hostapd systemctl service. I use this to start a WEP secured WiFi network so I can play Nintendo DS games online using [Kaeru](https://kaeru.world/projects/wfc).

## Requirements

 * Raspberry Pi (3/4/5) setup a routed wireless access point with hostapd
 * ruby 3.2.2 and bundler

Then run `bundle install` and then `bin/dev`. You can also build the docker image using `bin/build` and use that in a docker setup.

## TODO

 - [ ] Explain the setup of the Pi as a routed wireless AP
 - [ ] Read the hostapd config for the network name
 - [ ] Add a small API to get the status and enable or disable hostapd
 - [ ] Improve the UI
