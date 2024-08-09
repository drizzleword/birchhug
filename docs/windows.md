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

## Connect to ssh server from Windows desktop

Install [OpenSSH Client](https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse) and [Windows Terminal](https://learn.microsoft.com/en-us/windows/terminal/install).

[Generate key](https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_keymanagement#user-key-generation) for key-based authentication:

```sh
ssh-keygen -t ed25519
```

## Manage remote files and code from Windows desktop

If you are on Windows, [WinSCP](https://sourceforge.net/projects/winscp/) might help you to manage remote files, install it via [Chocolatey](https://chocolatey.org/install) (use administrative shell):

```shell
choco install winscp
```

You could also use [VS Code](https://code.visualstudio.com/) to deal with more complex code editing:

```shell
choco install vscode
```

If you need to unpack code from different archive formats on Windows you might find [7-Zip](https://sourceforge.net/projects/sevenzip/) handy:

```shell
choco install 7zip
```
