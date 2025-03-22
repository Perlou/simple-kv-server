# Simple KV Server

一个基于 Rust 实现的高性能、安全的键值存储服务器。

## 特性

- 支持 TCP 和 QUIC 两种网络协议
- 内置 TLS 加密通信
- 支持多种存储引擎（内存表和 SledDB）
- 支持发布/订阅(Pub/Sub)模式
- 支持多路复用(Multiplexing)
- 完整的日志追踪系统
- 高性能的异步 I/O

## 架构设计

### 网络层

- 支持 TCP 和 QUIC 协议
- 使用 yamux 实现多路复用
- 基于 TLS 的安全通信
- Protocol Buffers 序列化

### 存储层

- MemTable：内存存储引擎
- SledDB：持久化存储引擎

### 服务层

- 支持基本的 KV 操作（GET/SET）
- 支持发布/订阅功能
- 支持流式处理

### 环境要求

- Rust 2021 Edition
- Cargo 包管理器

### 生成配置和证书

```bash
make gen-cert
make gen-config
```

### 运行服务器

```bash
make start
```

### 运行客户端

```bash
make start-client
```

## 配置说明

### 服务器配置

```toml
[general]
addr = "127.0.0.1:9527"
network = "tcp"  # 或 "quic"

[storage]
type = "memtable"  # 或 "sleddb"
args = "/tmp/kv_server"  # sleddb路径

[tls]
cert = "fixtures/server.cert"
key = "fixtures/server.key"
ca = "fixtures/ca.cert"  # 可选

[log]
enable_log_file = true
enable_jaeger = false
log_level = "info"
path = "/tmp/kv-log"
rotation = "daily"  # "hourly" | "daily" | "never"
```

### 客户端配置

```toml
[general]
addr = "127.0.0.1:9527"
network = "tcp"  # 或 "quic"

[tls]
domain = "kvserver.acme.inc"
identity = ["client.cert", "client.key"]  # 可选
ca = "ca.cert"  # 可选
```

## 性能测试

包含基准测试套件，可通过以下命令运行：

```bash
cargo bench
```

## 开发

### 项目结构

- `src/`: 源代码目录
  - `network/`: 网络层实现
  - `storage/`: 存储引擎实现
  - `service/`: 业务逻辑实现
  - `pb/`: Protocol Buffers 定义
- `benches/`: 基准测试
- `tools/`: 工具脚本
- `fixtures/`: 配置文件和证书

### 运行测试

```bash
cargo test
```
