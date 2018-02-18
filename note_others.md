# Json

### editor
http://tomeko.net/software/JSONedit/

### json schema in ms vs
https://code.visualstudio.com/Docs/languages/json#_json-schemas-settings


# Bash

### how to show folder path onbash terminal
try add this into .bash_profile
export  PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}:${PWD/#$HOME/~}\007"'
https://superuser.com/questions/362227/how-to-change-the-title-of-the-mintty-window/886247
https://stackoverflow.com/questions/2410802/bash-ps1-settings-how-to-get-the-current-folder-back-as-the-terminal-title


# Git
### prevent push
git remote set-url --push origin no_push
https://dev.ghost.org/prevent-master-push/


# Cpp
### Multiple binaries in a single Eclipse CDT project
http://tinyguides.blogspot.ru/2013/04/multiple-binaries-in-single-eclipse-cdt.html
Sometimes it is convenient to have a single Eclipse project that produces multiple executables. An example is a set of tools that share some base code like a set of image manipulation tools that share some common image loading / saving code.  In a situation like this, the source code has multiple source files that contain a main() function. The standard way to do this is to create a makefile eclipse project and edit the makefile so that you have a target for each executable:

binary_1: main_1.cpp shared_code.cpp
       gcc -o  $@  $^

binary_2: main_2.cpp shared_code.cpp
       gcc -o  $@  $^

If for some reason you want to use a managed eclipse project (where the makefile is automatically generated) do the following:
Create a managed project (File > New  C++ Project > Executable)
Add the source code containing multiple main() functions
Go to Project > Properties > C/C++ Build > Manage Configurations...
Make a build configuration for each executable and name it appropriately (you can clone existing configurations like Debug and Release).
From the project explorer, right click on each source file that contains a main() function > Resource Configurations > Exclude from Build and exclude all build configurations except the one that builds the executable with this main() function
All other code is included in all build configurations by default. You may need to change this depending on your application.
You can now build an executable for each main function by going to Project > Build Configurations > Set Active , Project > Build Project
To debug each executable:
Build all binaries (as explained above) 
Go to Run > Debug Configurations.
Create a configuration for each binary
For each configuration set the correct Build Configuration and C/C++ Application (this is the binary). 
Use Search Project... to locate the binaries easily 

### map vs pair
https://stackoverflow.com/questions/3389648/difference-between-stdliststdpair-and-stdmap-in-c-stl

std::map<X, Y>:
* is an ordered structure with respect to keys (that is, when you iterate over it, keys will be always increasing).
supports unique keys (Xs) only
* offers fast find() method (O(log n)) which finds the Key-Value pair by Key
* offers an indexing operator map[key], which is also fast

std::list<std::pair<X, Y> >:
* is a simple sequence of paired Xs and Ys. They remain in the order you put it in.
* can hold any number of duplicates
* finding a particular key in a list is O(N) (no special method)
* offers the splice method.


### mutex vs semaphore
https://blog.feabhas.com/2009/09/mutex-vs-semaphores-%e2%80%93-part-1-semaphores/

Your answer is correct, but the interviewer might have wanted one more difference. There is an ambiguity between binary semaphore and mutex. It¡¯s a general conception that a mutex is a binary semaphore. But they are not! The purpose of mutex and semaphore are different. May be, due to similarity in their implementation a mutex would be referred as binary semaphore.

Strictly speaking, a mutex is locking mechanism used to synchronize access to a resource. Only one task (can be a thread or process based on OS abstraction) can acquire the mutex. It means there is ownership associated with mutex, and only the owner can release the lock (mutex).

Semaphore is signaling mechanism (¡°I am done, you can carry on¡± kind of signal). For example, if you are listening songs (assume it as one task) on your mobile and at the same time your friend calls you, an interrupt is triggered upon which an interrupt service routine (ISR) signals the call processing task to wakeup.