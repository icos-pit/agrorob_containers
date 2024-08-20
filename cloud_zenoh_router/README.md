# Zenoh: router

Zenoh router unofficial built from source.

```bash
cd zenoh_router/
```

## Issue/Bug

[10.08.2024] Latest release of zenoh: `zenoh:1.0.0-alpha.5`. **Running** `zenohd` **with any configuration file** results in **error**.

**Command**: `zenohd -c DEFAULT_CONFIG.json5`

**Error**:

```bash
INFO main ThreadId(01) zenohd: zenohd v1.0.0-alpha.5 built with rustc 1.75.0 (82e1608df 2023-12-21)
thread 'main' panicked at zenohd/src/main.rs:122:42:
called Result::unwrap() on an Err value: JSON error: invalid type: string "", expected a list of whatami variants ('router', 'peer', 'client') at commons/zenoh-config/src/lib.rs:748.
note: run with RUST_BACKTRACE=1 environment variable to display a backtrace
```

**Issue:** https://github.com/eclipse-zenoh/zenoh/issues/1292

### Implemented changes

**Suggested solution -> source:**

https://github.com/eclipse-zenoh/zenoh/compare/main...anhaabaete:zenoh:patch-1

_Implemented changes_ -> zenoh/src/main.rs:126-129\*\*

```rust
- Config::from_file(conf_file).
+ Config::from_file(conf_file).unwrap_or_else(|e| {
+    // if file load fail, wanning, and load defaul config
+    tracing::warn!("Warn: File {} not found! {}", conf_file, e.to_string());
+    Config::default()
```

## Deployment

```bash
# dir
cd zenoh_router/

sudo chmod +x entrypoint.sh

# compose
docker compose up --build
```

# ROS2: zenoh router - ros2dds plugin

```bash
cd ros2_zenoh/
```

# TEST: ROS2 communication through Zenoh

<!-- # Eclipse Zenoh Router deployment using Docker tool and Docker Compose file

For quick test with default configuration go to [Docker Image Build Up](#docker-image-build-up).

- Zenoh REST port - default is **8000**
- Zenoh TCP port - default is **7447** (remapped to **8447** !)
- Docker container name - **zenoh_router**

---

## Zenoh Router configuration

To change the configuration of the Zenohd router, you can specify own parameters in the `router.json5` configuration file. Default configuration include:

- rest plugin on 8000 HTTP port:
  ```json
  "plugins_search_dirs": [],
  "plugins": {
      "rest": {
      "__required__": true,
      "http_port": "8000"
  },
  ```
- storage manager with _demo_ and _agrorob_ storages:
  ```json
  ...
  "storage_manager": {
      "storages": {
          "demo": {
          "key_expr": "demo/example/**",
          "volume": "memory"
          }
          "demo": {
          "key_expr": "demo/example/**",
          "volume": "memory"
          }
      }
  }
  ...
  ```

More information about ZenohD can be found at https://github.com/eclipse-zenoh/zenoh.

---

## Docker Image Build Up

To easily deploy a working Zenoh router with your own configuration, you may need to change it
permissions for the `entrypoint.sh` file on the host machine. Simply run:

```bash
chmod +x entrypoint.sh
```

or

```bash
sudo chmod +x entrypoint.sh
```

### Image build up (no TLS):

```bash
docker-compose -f compose.yaml up --build
```

### Image build up (TLS):

```bash
docker-compose -f compose_with_tls.yaml up --build
```

Default certificate and key location: `"/etc/cert/"`, can be changed in `compose_with_tls.yaml` file.

---

## Interact using HTTP Requests

- <host_ip>
- <zenoh_rest_port>

### Zenoh router information:

```bash
curl http://<host_ip>:<zenoh_rest_port>/@/router/local
```

### Storage information:

```bash
curl "http://<host_ip>:<zenoh_rest_port>/@/router/local/status/plugins/storage_manager/storages/*"
```

### PUT key/value example:

```bash
curl -X PUT -H 'content-type:text/plain' -d 'Hello World!' http://<host_ip>:<zenoh_rest_port>/demo/example/test
```

### GET key/value example:

```bash
curl http://<host_ip>:<zenoh_rest_port>/demo/example/test-hello
```

Example output:

```bash
[
{ "key": "demo/example/test-hello", "value": "Hello World!", "encoding": "text/plain", "time": "2024-01-18T12:35:37.781402476Z/678ef664139c1214c3ba3844b5542b08" }
]
```

For more informations about key expressions in Zenoh refer to:
https://zenoh.io/docs/manual/abstractions/ -->
