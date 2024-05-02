# Hyper-Complex TCP/IP Server in Assembly Language

🚀 Welcome to the Hyper-Complex TCP/IP Server implemented entirely in assembly language! This project aims to showcase a highly advanced TCP server written in assembly, capable of handling multiple client connections concurrently.

## Description

This repository contains an elaborate implementation of a TCP/IP server in assembly language. The server is designed to handle network communication, process incoming client requests, and respond accordingly. It demonstrates low-level socket programming, packet handling, and network communication techniques.

The project structure is organized into different sections, each focusing on specific aspects of the server implementation. These sections include socket creation, binding, listening, accepting connections, receiving data, processing requests, sending responses, and closing connections.

## Features

- **Socket Programming**: Utilizes system calls for socket creation, binding, and listening. The server implements TCP/IP sockets for reliable, connection-oriented communication.
- **Packet Handling**: Implements routines for receiving and processing network packets. It parses incoming data packets, extracts relevant information, and performs necessary operations based on the packet content.
- **Client Communication**: Establishes connections with clients and exchanges data. The server communicates with clients using TCP sockets, ensuring reliable and ordered delivery of messages.
- **Robustness**: Includes error handling mechanisms for handling various network scenarios. It checks for error conditions during socket operations, such as connection establishment and data transmission, and gracefully handles them to prevent application crashes or unexpected behavior.

## Installation

### Prerequisites

Before running the TCP/IP server, ensure that the following prerequisites are met:

- **Linux Operating System**: The server is designed to run on Linux-based systems.
- **NASM**: The Netwide Assembler (NASM) is required to assemble the assembly code.

### Clone Repository

To get started, clone the repository to your local machine:

```bash
git clone https://github.com/Rishit-katiyar/tcp-server-assembly.git
cd tcp-server-assembly
```

### Build and Run

Follow these steps to build and run the TCP/IP server:

1. **Assemble Source Code**:
   ```bash
   nasm -f elf32 tcp_server.asm -o tcp_server.o
   ```

2. **Link Object File**:
   ```bash
   ld -m elf_i386 tcp_server.o -o tcp_server
   ```

3. **Run Server**:
   ```bash
   ./tcp_server
   ```

## Usage

Once the server is running, it will listen for incoming connections on the specified port. Clients can connect to the server using TCP sockets. The server will process incoming requests, perform necessary operations, and send responses back to clients.

### Connecting Clients

To connect to the server, clients must establish a TCP connection to the server's IP address and port number. They can use standard socket programming libraries or tools like `telnet` to connect to the server.

```bash
telnet <server_ip> <port>
```

### Sending Data

Clients can send data to the server by writing to the established TCP connection. The server will receive the data and process it according to the implemented logic.

### Receiving Data

The server continuously listens for incoming data from connected clients. Upon receiving data, it parses the packets, extracts relevant information, and performs the necessary operations.

## Contributing

Contributions are welcome! Whether it's bug fixes, feature enhancements, or documentation improvements, feel free to submit issues, feature requests, or pull requests to help improve this project.

## License

This project is licensed under the [GNU General Public License v3.0](LICENSE). You are free to use, modify, and distribute the code according to the terms of the license.
