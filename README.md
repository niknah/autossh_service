

Finds a spare port and starts autossh.

Change 'hostname' to where ever you want to ssh to.
```
git clone https://github.com/niknah/autossh_service.git autossh
cp autossh/autossh@.service ~/.config/systemd/user/
systemd start --user autossh@hostname
```
