-- Digital Pin Number (int)
-- returns temp string humi string
local makeDHT11 = function (pinNumber)
    local dthModule = {}

    dthModule.read = function ()
        local status, temp, humi = dht.read11(pinNumber)
        
        -- Check the status and print any errors
        if status == dht.OK then
            return temp, humi
        elseif status == dht.ERROR_CHECKSUM then
            return error("Checksum error")
        elseif status == dht.ERROR_TIMEOUT then
            return error("Timeout error")
        end

        -- Return the temperature and humidity as separate variables
        return temp, humi
    end

    return dthModule
end

return makeDHT11
