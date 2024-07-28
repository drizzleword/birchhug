<!--
  Copyright 2024 Oakdeer project contributors

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

# Prepare system (one-time task)

Please refer to [Installing or Updating Java](https://docs.papermc.io/misc/java-install) from [PaperMC Docs](https://docs.papermc.io/) for details.

Check out [Amazon Corretto OpenJDK distribution](https://aws.amazon.com/corretto/) page to find latest Long Term Support (LTS) version.

Add APT source for Corretto:

```sh
curl --fail --show-error --silent "https://apt.corretto.aws/corretto.key" | gpg --dearmor | sudo tee "/etc/apt/keyrings/corretto.gpg" | grep --quiet . && echo "deb [signed-by=/etc/apt/keyrings/corretto.gpg] https://apt.corretto.aws stable main" | sudo tee "/etc/apt/sources.list.d/corretto.list" >/dev/null
```

Update APT sources:

```sh
sudo apt-get update
```

Update system:

```sh
sudo apt-get dist-upgrade
```

Install Corretto (note the version here):

```sh
sudo apt-get install java-21-amazon-corretto-jdk
```

Allow user to run services when he is not logged in:

```sh
sudo loginctl enable-linger "${USER}"
```

Create `~/.local/bin` directory (you may need to reconnect the terminal to get `~/.local/bin` to appear in the search path):

```sh
( umask 077 && mkdir --parents ~/.local/bin )
```

Install the oakdeer script:

```sh
curl --fail --show-error --silent "https://raw.githubusercontent.com/drizzleword/oakdeer/main/bin/oak" --output ~/.local/bin/oak && chmod 750 ~/.local/bin/oak
```

# Create server

Create server directory and `cd` into it:

```sh
mkdir my-minecraft-server && cd my-minecraft-server
```

Indicate your acceptance of the [Minecraft End(er)-User License Agreement](https://www.minecraft.net/en-us/eula):

```sh
echo "eula=true" >eula.txt
```

Use [PaperMC Build explorer](https://papermc.io/downloads/all) to find server software version you like.

Deploy the server: 

```sh
oak --heap-size 6G log deploy "https://api.papermc.io/v2/projects/paper/versions/1.20.6/builds/148/downloads/paper-1.20.6-148.jar"
```
