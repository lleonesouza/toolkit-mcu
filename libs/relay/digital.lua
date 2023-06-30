local Pins = require("esp8266Pins")

-- Instantiate a Relay, returns setState and getState methods
---@param digitalPin number
local makeRelay = function (digitalPin)
    local pin = Pins.makeDigitalPin(digitalPin)

    gpio.mode(pin, gpio.OUTPUT)
    local state = false

     -- Get the device state // true = on // false = off
    local function getState()
        return state
    end

    -- Set the device ON/OFF state
    ---@param value ?boolean
    local function setState (value)
        if value == true then
            gpio.write(pin, gpio.HIGH)
            state = true
        elseif value == false then
            gpio.write(pin, gpio.LOW)
            state = false
        else
            if state == false then 
                gpio.write(pin, gpio.HIGH)
                state = true
            else 
                gpio.write(pin, gpio.LOW)
                state = false
            end
        end
    end

    return getState, setState
end



return makeRelay