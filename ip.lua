function getIp()
    local ip = ngx.req.get_headers()['cf-connecting-ip']
    if ip ~= nil then
            return ip
    end
    ip = ngx.req.get_headers()['x-forwarded-for']
    if ip ~= nil then
            local to = string.find(ip, ',')
            if to ~= nil then
                    ip = string.sub(ip, 1,to - 1)
            end
            return ip
    end
    return ngx.var.remote_addr
end
ngx.header['Content_type'] = 'text/html; charset=UTF-8'
ngx.say(getIp())
ngx.exit(ngx.HTTP_OK)