local makeMoisture = function ()
    -- 1000 + -> not soil or disconnected
    -- 600 - 1000 -> dry
    -- 370 - 600 -> humid
    -- 370 - -> is in the water
    local val = adc.read(0)
    local total = ((val - 370) * 100) / 660
    local real = (total - 100) * -1

    local getMoisture = function ()
        return real
    end

    return getMoisture
end




local mhSeries = {}


mhSeries.makeMoistureAnalog = makeMoisture


-- Create all methods for mh-series Module
local function make()
    

    return mhSeries
end




return make