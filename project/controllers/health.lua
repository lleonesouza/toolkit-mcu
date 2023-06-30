local modules = require("modules.index")

local function makeHealthController(cs)
    local controllers = {}
    -- Returns that API is live
    -- Request Example:
    -- coap post -p "test" -o coap://192.168.0.11:5683/v1/f/Health
    local function health()
        function Health()
            local responseJson = sjson.encode({
                live = true
            })
            return responseJson
        end

        cs:func("Health")
    end

    controllers.health = health

    return controllers
end



return makeHealthController