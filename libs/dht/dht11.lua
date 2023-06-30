-- Digital
local makeDHT11 = function (pinNumber)
    local status, temp, humi, temp_dec, humi_dec = dht.read11(pinNumber)

    print(status == dht.OK)
    print(status == dht.ERROR_CHECKSUM)
    print(status == dht.ERROR_TIMEOUT)
    
    print(string.format("DHT Temperature:%d.%03d;Humidity:%d.%03d\r\n",
          math.floor(temp),
          temp_dec,
          math.floor(humi),
          humi_dec
))

end

return makeDHT11
