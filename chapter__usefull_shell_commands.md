# Useful Shell Commands
* Torsten Weber and Arne Kriegsmann *

** What is a shell? **

A shell (terminal/console) is command-line interface between the computer system
and the user. There are different shells such as Bash, C-Shell or Korn Shell.
We are using Bash.

** Bash ** is a Unix shell and command language for the GNU Project as a free software replacement for the Born shell.

usefull link:
<www.tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html>

Bash tutorial:
http://www.hypexr.org/bash_tutorial.php
<www.linuxconfig.org/bash-scripting-tutorial>

### Important commands (case-sensitive!)
Each command has a build-in help-function: command --help

* Start a program:
  "program", e.g. firefox
* Create a new directory:
  mkdir "directory"
* Change a directory:
  cd "directory"
*Leave current folder and go back to the parent directory:
   cd ..
* Show the current path of the directory:
  pwd
* Show the content of a directory:
  ls or use ll for more details

### Usage of Shell
**Important commands (case-sensitive!)**

* Copy one or more files:
  cp "file" "target_path", example: cp temp.nc /data/africa
* Move a file or a directory:
  mv "file1" "file2"
* Delete a file:
  rm "file"
* Delete a directory:
  rm –r "directory"   (recursive: all files in the directory will be removed)
* Start a text editor and open a script file:
  kate script.sh
* Start a script in a directory:
  ./script.sh
* Make a script executable:
  chmod +x script.sh   (type ll to see execution rights)

**Useful programmes**
* Show the content of a text file:
  more file.txt (scroll with space key)

* Display one figure:
	 display figure.png
* Open a figure explorer to have a look at more than one figures:
      geeqie
* Open a PDF document:
  okular file.pdf
* To use the terminal window after executing a command, put a & at the end of
command line before executing the command:
	Example: okular file.pdf&

If you don’t want to type long filenames manually, you can use the copy- and paste-function. Double-click with the left mouse-button at the filename and press the right mouse-button to get the copy- and paste-menu.
