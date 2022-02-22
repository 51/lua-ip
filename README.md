# lua-ip
A very simple IP address query interface written in lua language based on OpenResty.

### usage
Simply insert the code in your nginx server configuration:
```
server {
    ...
    location /ip {
        content_by_lua_file  /path/to/ip.lua;
    }
}
```