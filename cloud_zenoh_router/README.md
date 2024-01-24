# Eclipse Zenoh Router deployment using Docker tool and Docker Compose file
For quick test with default configuration go to [Docker Image Build Up](#docker-image-build-up).

- Zenoh REST port - default is **8000**
- Zenoh TCP port - default is **7447**
- Docker container name - **cloud_zenoh_router_zenoh_1**



***
## Zenoh Router configuration 
To change the configuration of the zenohd router, you can change the parameters of specific fields in
`router-config.json5` file. Default configuration in this file at start include:
- rest plugin on 8000 http port
    ```json
    "plugins_search_dirs": [],                 
    "plugins": {                               
        "rest": {                                
        "__required__": true,                  
        "http_port": "8000"                    
    },
    ```
- storage manager with storage demo
    ```json
    ...
    "storage_manager": {                       
        "storages": {                           
            "demo": {                            
            "key_expr": "demo/example/**",     
            "volume": "memory"                 
            }                                    
        }                                      
    }
    ...
    ```

More information can be found at https://github.com/eclipse-zenoh/zenoh.

***
## Docker Image Build Up
To easily deploy a working Zenoh router with your own configuration, you may need to change it
permissions for the `entrypoint.sh` file on the host machine. Simply run:
```bash
chmod +x entrypoint.sh
```

### Image build up command:
```bash
docker-compose -f compose.yaml up --build
```

***
## Interaction using HTTP Requests
- <host_ip>
- <zenoh_rest_port>

### Zenoh router information
```bash
curl http://<host_ip>:<zenoh_rest_port>/@/router/local
```

### Storage information
```bash
curl "http://<host_ip>:<zenoh_rest_port>/@/router/local/status/plugins/storage_manager/storages/*"
```

### GET key/value
```bash
$ curl http://<host_ip>:<zenoh_rest_port>/demo/example/test-hello
```
Example output:
```bash
[
{ "key": "demo/example/test-hello", "value": "Hello World!", "encoding": "text/plain", "time": "2024-01-18T12:35:37.781402476Z/678ef664139c1214c3ba3844b5542b08" }
]
```
For more informations about key expressions in Zenoh refer to: 
https://zenoh.io/docs/manual/abstractions/

