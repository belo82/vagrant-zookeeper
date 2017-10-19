#Zookeeper

**Zookeeper 3.4.10**

This directory contains Vagrant machine with Zookeeper running in standalone mode.

Zookeeper client port is configured to listen on `localhost:2181`.

`$ZOOKEEPER_HOME` points to `/usr/local/zookeeper-3.4.10`.

Configuration is placed in `$ZOOKEEPER_HOME/conf/zoo.cfg`.

`dataDir` config property points to `/data/zookeeper`

To start Zookeeper run:

```
sudo -u zookeeper /usr/local/zookeeper-3.4.10/bin/zkServer.sh start
```

To check that Zookeeper is running try:

```
echo ruok | nc localhost 2181
```

It should respond with `imok`.