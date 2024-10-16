## basic tmux usage

<br>

* starting a new (named session):

```
tmux new -s my_session
```

<br>


* detach the session with `Ctrl-b + d`.

<br>


* list sessions with:

```
tmux ls
```

<br>


* re-attach a session:

```
tmux attach-session -t my_session
```

<br>


* reload a tmux config file:

```
tmux source-file ~/.tmux.conf
```

<br>


* kill tmux

```
tmux kill-server
```
