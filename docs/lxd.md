<!--
  Copyright 2024 Birchfox project contributors

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->

# Use [LXD](https://canonical.com/lxd) to isolate Minecraft server from the host machine

## Container setup

Set variables:

```sh
instance="minecraft"
image="ubuntu:24.04"
```

Install snapd and LXD:

```sh
sudo apt-get update
sudo apt-get install snapd
sudo snap install lxd
```

Init LXD:

```sh
lxd init --minimal
```

Create container:

```sh
lxc launch "${image}" "${instance}"
```

Add tcp/udp proxy for Minecraft server:

```sh
proxy() {
  lxc config device add "${instance}" "proxy-${proto}-${port}" proxy "listen=${proto}:0.0.0.0:${port}" "connect=${proto}:127.0.0.1:${port}"
}

add() {
  proto=tcp proxy
  proto=udp proxy
}

port=25565 add
```

Run shell for user "ubuntu" in container:

```sh
lxc exec "${instance}" -- su - ubuntu
```

## Helpful commands

List instances:

```sh
lxc list
```

Show instance config:

```sh
lxc config show "${instance}"
```

Stop instance:

```sh
lxc stop "${instance}"
```

Delete instance:

```sh
lxc delete "${instance}"
```

Check existing proxies:

```sh
lxc config device show "${instance}"
```

Remove proxy:

```sh
remove() {
  lxc config device remove "${instance}" "proxy-tcp-${port}"
  lxc config device remove "${instance}" "proxy-udp-${port}"
}

port=25565 remove
```

Limit RAM usage:

```sh
lxc config set "${instance}" limits.memory=6144MiB
```

Run root shell in container:

```sh
lxc exec "${instance}" -- bash
```
