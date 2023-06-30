local modules = require("modules.index")

local function makeDHTController(cs)
    local controllers = {}
    -- Read temperature and humidity from DHT11 Sensor
    -- Request Example:
    -- coap post -p "test" -o coap://192.168.0.114:5683/v1/f/Read
    local function readDth()
        function Read()
            local temperature, humidity = modules.Dht11.read()

            local data = {
                temperature = temperature,
                humidity = humidity
            }

            local jsonData = sjson.encode(data)
            return jsonData
        end

        cs:func("Read")
    end

    controllers.readDth = readDth

    return controllers
end



return makeDHTController