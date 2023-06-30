local M = require("modules.index")

local function makeL298nBridgeController(cs)
    local l298n = {}
    -- Turn ON right and left motor to go ahead
    -- Request Example:
    -- coap post -p "test" -o coap://192.168.0.11:5683/v1/f/Run
    local function run()
        function Run()
            return M.L298N.run()
        end

        cs:func("Run")
    end

    -- Turn ON right and left motor to go backward
    -- Request Example:
    -- coap post -p "test" -o coap://192.168.0.114:5683/v1/f/Back
    local function back()
        function Back()
            return M.L298N.back()
        end

        cs:func("Back")
    end

    -- Turn OFF right and turn ON left motors
    -- Request Example:
    -- coap post -p "test" -o coap://192.168.0.114:5683/v1/f/Left
    local function turnLeft()
        function Left()
            return M.L298N.left()
        end

        cs:func("Left")
    end

    -- Turn ON right and turn OFF left motors
    -- Request Example:
    -- coap post -p "test" -o coap://192.168.0.114:5683/v1/f/Right
    local function turnRight()
        function Right()
            return M.L298N.right()
        end

        cs:func("Right")
    end

    -- Turn OFF right and left motors
    -- Request Example:
    -- coap post -p "test" -o coap://192.168.0.114:5683/v1/f/Stop
    local function stop()
        function Stop()
            return M.L298N.off()
        end

        cs:func("Stop")
    end

    -- Change motors speed
    -- Request Example:
    -- coap post -p "test" -o coap://192.168.0.114:5683/v1/f/Speed
    local function setSpeed()
        function Speed(payload)
            print(payload)
            return M.L298N.setSpeed(payload)
        end

        cs:func("Speed")
    end

    l298n.run = run
    l298n.back = back
    l298n.turnLeft = turnLeft
    l298n.turnRight = turnRight
    l298n.stop = stop
    l298n.setSpeed = setSpeed

    return l298n
end



return makeL298nBridgeController
