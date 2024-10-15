## Basic Tmux Usage

<br>

* Starting a new (named session):

```
tmux new -s my_session
```

<br>


* Detach the session with `Ctrl-b + d`.

<br>


* List sessions with:

```
tmux ls
```

<br>


* Re-attach a session:

```
tmux attach-session -t my_session
```

<br>


* Reload a tmux config file:

```
tmux source-file ~/.tmux.conf
```

<br>


* Kill tmux

```
tmux kill-server
```
