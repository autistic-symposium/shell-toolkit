## chef commands

<br>

Roles contain recipes:

```
$ knife role list
```

All the recipes that are in that role

```
$ knife role show <role_name>
```

To see the nodes:

```
$ knife node list
$ knife node show <node_name>
```

To register a brand new machine with chef

```
$ knife bootstrap
```
This will SSH into the machine, download chef package, install chef to `/opt`, and get it running and registered with the chef server, see `~/.chef/knife.rb`,


Before adding/pushing a change in chef

```
$ knife spork role from file roles/key.json
$ knife spork omni logstash --remote
```

when logstash version:

```
$ knife spork bump logstash
```

then

```
$ knife spork omni logstash --remote
```
