section .data
  ; Define constants for socket system calls
  SYS_SOCKET equ 1
  SYS_BIND equ 2
  SYS_LISTEN equ 4
  SYS_ACCEPT equ 5
  SYS_RECV equ 29
  SYS_SEND equ 30
  AF_INET equ 2
  SOCK_STREAM equ 1

  ; Define network-related constants
  IPADDR equ 0x7f000001    ; 127.0.0.1 (localhost)
  PORT equ 8080             ; Port number

  ; Define buffers for sending and receiving data
  BUFFER_SIZE equ 1024
  recv_buffer resb BUFFER_SIZE
  send_buffer resb BUFFER_SIZE

section .bss
  ; Define socket descriptor
  sockfd resd 1

section .text
  global _start

_start:
  ; Create a socket
  mov eax, SYS_SOCKET
  mov ebx, AF_INET
  mov ecx, SOCK_STREAM
  int 0x80
  mov dword [sockfd], eax  ; Store the socket descriptor

  ; Bind the socket
  mov eax, SYS_BIND
  mov ebx, dword [sockfd]
  lea ecx, [esp + IPADDR]
  mov edx, PORT
  mov esi, 16
  int 0x80

  ; Listen for incoming connections
  mov eax, SYS_LISTEN
  mov ebx, dword [sockfd]
  mov ecx, 5  ; Maximum number of pending connections
  int 0x80

accept_loop:
  ; Accept a connection
  mov eax, SYS_ACCEPT
  mov ebx, dword [sockfd]
  mov ecx, 0
  mov edx, 0
  int 0x80
  ; The accepted socket descriptor is returned in eax

  ; Receive data from the client
  mov eax, SYS_RECV
  mov ebx, eax  ; Use the same socket descriptor
  lea ecx, [recv_buffer]
  mov edx, BUFFER_SIZE
  mov esi, 0
  int 0x80

  ; Process received data (not shown in this example)

  ; Send a response back to the client
  mov eax, SYS_SEND
  mov ebx, eax  ; Use the same socket descriptor
  lea ecx, [send_buffer]
  ; Load the response message into send_buffer
  mov edx, BUFFER_SIZE
  mov esi, 0
  int 0x80

  ; Close the socket
  mov eax, 6  ; Close system call
  mov ebx, dword [sockfd]
  int 0x80

  ; Go back to accept more connections
  jmp accept_loop
