# Minitalk
2 programs with a sender and receiver relationship. (client and server)

How to use:
---------------------
make

./server (you will receive the server's PID, do not close the program)

./client [PID] [any_string]

now the server should display the string that was typed in the client program.

How does it work?
--------------------
I used the signals SIGUSR1 and SIGUSR2 to send and receive bits. each 8 bits is one character.
