<!--
  Copyright 2024 Birchhug project contributors

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

# Birchhug

[Birchhug](https://github.com/drizzleword/birchhug) is a tool that helps you to start a [Minecraft](https://en.wikipedia.org/wiki/Minecraft) server on [Linux](https://en.wikipedia.org/wiki/Linux) as a [systemd](https://en.wikipedia.org/wiki/Systemd) service.

<img src="birch.jpg" width=100%>


## Prepare the system (one-time task)

Please refer to [Installing or Updating Java](https://docs.papermc.io/misc/java-install) from [PaperMC Docs](https://docs.papermc.io/) for details.

Add APT source for [Amazon Corretto OpenJDK](https://aws.amazon.com/corretto/):

```sh
curl --fail --show-error --silent "https://apt.corretto.aws/corretto.key" | gpg --dearmor | sudo tee "/etc/apt/keyrings/corretto.gpg" | grep --quiet . && echo "deb [signed-by=/etc/apt/keyrings/corretto.gpg] https://apt.corretto.aws stable main" | sudo tee "/etc/apt/sources.list.d/corretto.list" >/dev/null
```

Update APT sources:

```sh
sudo apt-get update
```

Update system packages:

```sh
sudo apt-get dist-upgrade
```

Check out [Amazon Corretto OpenJDK distribution](https://aws.amazon.com/corretto/) page to find latest Long Term Support (LTS) version.

Install Corretto, specify another version (instead of `21` here) if needed:

```sh
sudo apt-get install java-21-amazon-corretto-jdk
```

Allow long-running services for user when he is not logged in:

```sh
sudo loginctl enable-linger "${USER}"
```

Install the [Birchhug](https://github.com/drizzleword/birchhug):

```sh
curl -Ssf https://raw.githubusercontent.com/drizzleword/birchhug/main/deploy.sh | sh
```

You may need to restart your terminal session for `~/.local/bin` to appear in the search path.

## Deploy new Minecraft game server with the [PaperMC](https://papermc.io/)

Create the server directory and `cd` into it:

```sh
mkdir my-minecraft-server && cd my-minecraft-server
```

Indicate your acceptance of the [Minecraft End(er)-User License Agreement](https://www.minecraft.net/en-us/eula):

```sh
echo "eula=true" >eula.txt
```

Write Java argument file (adjust `-Xms` and `-Xmx` to fit your case):

```sh
echo "-Xms4G -Xmx12G -XX:+DisableExplicitGC -XX:+PerfDisableSharedMem -XX:+UseZGC -XX:+ZGenerational" > java.argfile
```

Use [PaperMC Build explorer](https://papermc.io/downloads/all) to find server software version you like and note the `.jar` file URL.

Deploy the server: 

```sh
bhug log deploy "https://api.papermc.io/v2/projects/paper/versions/1.21/builds/126/downloads/paper-1.21-126.jar"
```
## Usage

```sh
bhug [OPTIONS...] COMMAND [ARGUMENTS...]
```

### Options

`-s, --service-name NAME`

Use NAME as a service name. If service name is not specified then the name of the current directory will be used

`-h, --help`

Display help

### Commands

`deploy URL`

If there is no URL, only the service unit will be updated

`start`

Start systemd service

`stop`

Stop systemd service

`restart`

Restart systemd service

`enable`

Enable systemd service

`disable`

Disable systemd service

`status`

Display systemd service status

`log`

Display and follow systemd service log

Prefix any command with `log` to monitor the service log after the command has
successfully completed:

```sh
bhug log restart
```

  
## Miscellaneous notes

* [Use LXD to isolate Minecraft server from the host machine](docs/lxd.md)
* [Manage Linux server from the Windows desktop](docs/windows.md)

## License

[Apache License, Version 2.0](LICENSE).

## Contributing to [Birchhug](https://github.com/drizzleword/birchhug) project

Please check [CONTRIBUTING](CONTRIBUTING.md) file for details.
