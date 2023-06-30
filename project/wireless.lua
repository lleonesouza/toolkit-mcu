local startWifi = function ()
    print("Starting wifi")
    local function connectedCb()
        print("GOT IP!")
        print("ESP8266 mode is: " .. wifi.getmode())
        print("The module MAC address is: " .. wifi.ap.getmac())
        print("Config done, IP is "..wifi.sta.getip())
    end

    local function dhcpTimeoutCb()
        print("Wi-Fi timeout")
    end

    local function disconnectedCb()
        print("Wi-Fi disconnected")
    end

    local function wifiErrorCb(code)
        print("Wi-Fi connection failed with error code: " .. code)
    end

    local station_cfg={}
    station_cfg.ssid="Apt_12"
    station_cfg.pwd="hortela852"
    station_cfg.save=true
    station_cfg.disconnected_cb = disconnectedCb
    station_cfg.dhcp_timeout_cb = dhcpTimeoutCb
    station_cfg.got_ip_cb = connectedCb

    wifi.setmode(wifi.STATION)
    wifi.sta.config(station_cfg)

    wifi.sta.connect(
        function(status)
            print(status)
            if status == wifi.STA_GOTIP then
                connectedCb()
            elseif status == wifi.STA_FAIL or status == wifi.STA_IDLE then
                wifiErrorCb(status)
            end
        end
    )

end


return startWifi
