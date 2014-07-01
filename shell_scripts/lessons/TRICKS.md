Wild Cards
----------

Use *, ? (for one char), and [abc] for a series of options. Example:

$ ls [abc]*


More commands on one line
-------------------------

Use ;
$ date;who


Redirection of Standard output/input
-----------------------------------

>, >>, <

Examples:

$ sort < filename > sorted_names


Pipes
-----
A pipe is nothing but a temporary storage place where the output of one command is stored and then passed as the input for second command.


Processes and PID
-----------------
An instance of running command is called process and the number printed by shell is called process-id (PID), this PID can be use to refer specific running process.

ps - show current running
kill {PID} - kill process
kill 0 - stop all processes except shell
& - background process
ps aux - display the owner of the processes along with the processes
ps -ag - get information of all running processes
ps ax | grep processes-you-want-to-see
top - see currently running processes and other information like memory and CPU
pstree - display a tree of processes



Useful Cmds:
------------

List size of folders
$ du -sh *


