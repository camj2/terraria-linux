# Terraria

Meant to be used with [server](https://github.com/camj2/server).

## Download

[PC Dedicated Server](https://terraria.org/)

Copy server files to `server:~/terraria/exec/`.

### Bug

If you encounter an
[error](https://terraria.fandom.com/wiki/Server#Troubleshooting) when starting the server
(occurs when using `mono`):

```
rm System*
rm Mono*
rm monoconfig
rm mscorlib.dll
```

## Create

Generate the Terraria world on PC and copy to `server:~/terraria/save/Server.wld`.

## Void

Install packages:

```
xbps-install screen mono
```

<details>
<summary>Bug</summary>

The aarch64 `mono` package is broken.
As a workaround, compile and install `mono` from the server (instead of using the repo package):

```
git clone --depth 1 https://github.com/void-linux/void-packages
cd void-packages
./xbps-src binary-bootstrap
./xbps-src pkg mono
xbps-install -R hostdir/binpkgs/nonfree mono
```

Check the [GitHub](https://github.com/void-linux/void-packages/issues/46881) issue for more info.

</details>
<br>

Add the following to `/etc/nftables.conf`:

```
tcp dport 7777 accept
```

## Run

### Setup

Enable `runsvdir-server`:

```
ln -s /etc/sv/runsvdir-server /var/service/
```

Point `sv` to the user `runsvdir`:

```
export SVDIR="${HOME}/.sv"
```

### Start

Launch the server (run as user):

```
sv start terraria
```

### Stop

First save the server:

```
terraria s
```

Then kill the server (after waiting a few seconds for the save to complete):

```
sv stop terraria
```

## `terraria`

### Commands

`x`: start the server

`c`: open the server console (close with: `CTRL + a -> d`)

`s`: save the server

`e`: save the server and exit (this will restart the runit service)

### Flags

`-x <path>`: path to the server executable

`-s <path>`: path to the server `.wld` file

`-p <pass>`: server password (default: `Server2011$`)

`-S <name>`: server name (default: `terraria`)

`-P <port>`: server port (default: `7777`)

### Notes

* Run `help` inside the console for a list of commands.

* You can change the server password from the console with the `password` command.

* Run multiple instances by specifying `-S` and `-P`.

* Terraria doesn't support
[IPv6](https://forums.terraria.org/index.php?threads/ipv6-support.104448/post-2805121).

## LICENSE

MIT
