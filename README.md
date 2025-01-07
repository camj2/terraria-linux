# Terraria

Meant to be used with [server](https://gitlab.com/camj/server).

## Download

[PC Dedicated Server](https://terraria.org/)

Copy server files to `server:~/terraria/exec/`.

### Bug

If you encounter an
[error](https://terraria.fandom.com/wiki/Server#Troubleshooting) when starting the server:

```
rm System*
rm Mono*
rm monoconfig
rm mscorlib.dll
```

## Create

Generate the Terraria world on PC and copy to `server:~/terraria/save/Server.wld`.

## Void

Install `screen`:

```
xbps-install screen
```

Install `mono` (not required on x86_64):

```
xbps-install mono
```

### Bug

The aarch64 `mono` package is broken.
As a workaround, compile `mono` from the server (instead of using the repo package):

```
git clone --depth 1 https://github.com/void-linux/void-packages
cd void-packages
./xbps-src binary-bootstrap
./xbps-src pkg mono
xbps-install -R hostdir/binpkgs/nonfree mono
```

Check the [GitHub](https://github.com/void-linux/void-packages/issues/46881) issue for more info.

### Port

Add the following to `/etc/nftables.conf`:

```
tcp dport 7777 accept
```

## Run

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

Then kill the server (after waiting a few seconds):

```
sv stop terraria
```

## `terraria`

### Commands

`x`: launch the server

`c`: open the server console (close with: `CTRL + a -> d`)

`s`: save the server

`e`: save the server and exit (this will restart the runit service)

### Flags

`-x <path>`: path to the server executable

`-s <path>`: path to the server world file

`-p <pass>`: server password (default password: `Server2011$`)

## Notes

* Terraria doesn't support
[IPv6](https://forums.terraria.org/index.php?threads/ipv6-support.104448/post-2805121).

* Run `help` inside the console for a list of commands.

* You can change the server password from the console with the `password` command.

## LICENSE

MIT
