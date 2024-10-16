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

Print calendar:
$ cal

Writing and creating a file:
$ cat > NEWFILE

--- write here ---
^D


De-bug Shell Script
-------------------

Use -v and -x option:
$ sh option SCRIPT
$ bash option SCRIPT


Local and Global Variables
-------------------------

Whenever you type:
$ /bin/bash
You start a new shell where the previous variables will be forgotten (local variables). To make variables global, you can do:
$ export VARIABLE-NAME
Before changing shell.


Conditional Execution
---------------------

The control operators are && (AND) and || (OR).
$ rm myf && echo "File is removed successfully" || echo "File is not removed"


Functions
---------

$ SayHello()
{
   echo "Hello $LOGNAME, Have nice computing"
   return
}
To execute this SayHello() function just type it name as follows:
$ SayHello