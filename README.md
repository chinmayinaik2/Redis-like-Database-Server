
# Redis-Like In-Memory Database Server

A lightweight in-memory key-value store built from scratch in C++. Inspired by Redis, this project supports strings, sorted sets (ZSET), TTL-based expiration, persistence via a custom binary format, and concurrent clients using `epoll`.



## Features
- `epoll` I/O: Handles concurrent client connections using non-blocking sockets.
- Custom key-value store: Supports both strings and sorted sets (ZSET) using AVL trees + hashtables.
- TTL with millisecond precision: Keys auto-expire using a min-heap timer system.
- Persistence: Database is saved to and restored from a custom binary file.
- Thread pool: Handles background tasks such as large data cleanup or deferred deletions.
- Client binary: Communicates with the server using a simple command-line interface.


## Installation

### Compile Server and Client

```bash
g++ -std=c++17 -Wall -Wextra 14_server.cpp avl.cpp hashtable.cpp heap.cpp thread_pool.cpp zset.cpp -o redis_server
g++ -std=c++17 09_client.cpp -o client
```
### Run Server
```
./redis_server
```
### Run Client (In a separate terminal)
```
./client set foo bar
./client get foo
```

### Simulate concurrent Clients
We use a simple shell script to spawn multiple background client processes
```
chmod +x test_100_clients.sh
./test_100_clients.sh
```

## Supported Commands

| Command	    |  Description....|
|---------------|-----------------| 
|set key value  |Set string value |
|get key	    |Get string value |
|pexpire key ttl_ms||Set key expiry in milliseconds|
|pttl key	|Get remaining time to live|
|zadd set score member	|Add member to sorted set|
|zscore set member|	Get score of a member|
|zquery set min max off lim |	Range query on scores (with pagination)|

## License
This project is licensed under the [MIT License](LICENSE).

## Acknowledgements
Inspired by Redis, this project aims to deepen understanding of Key-Value Databases, socket programming and concurrency in C++.
