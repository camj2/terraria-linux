# terraria-linux

Meant for [server](https://gitlab.com/camj/server).

## Download

[PC Dedicated Server](https://terraria.org/)

Copy server files to `server:~/terraria/exec/`.

### Bug

If you have [issues](https://terraria.fandom.com/wiki/Server#Troubleshooting) starting the server:

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

Install `mono` if not using x86_64:

```
xbps-install mono
```

### [Bug](https://github.com/void-linux/void-packages/issues/46881)

From the server, compile and install `mono`:

```
git clone --depth 1 https://github.com/void-linux/void-packages
cd void-packages
./xbps-src binary-bootstrap
./xbps-src pkg mono
xbps-install -R hostdir/binpkgs/nonfree mono
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

### message

Send a message through the in-game chat:

```
terraria m <message>
```

## Note

Terraria doesn't support
[IPv6](https://forums.terraria.org/index.php?threads/ipv6-support.104448/post-2805121).

## LICENSE

MIT
