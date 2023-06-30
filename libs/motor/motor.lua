local INITIAL_SPEED = 0

local speed_up = function(pulser, speed)
    local INCREASE_SPEED = 1000
    speed = speed + INCREASE_SPEED
    pulser:update(1, { [1]= gpio.HIGH, delay=speed })
    pulser:update(3, { [1]= gpio.HIGH, delay=speed })
end

local speed_down = function(pulser, speed)
    local INCREASE_SPEED = 1000
    speed = speed - INCREASE_SPEED
    pulser:update(1, { [1]= gpio.HIGH, delay=speed })
    pulser:update(3, { [1]= gpio.HIGH, delay=speed })
    return speed
end

local makeDirection = function ()
    local speed = INITIAL_SPEED
    gpio.mode(1, gpio.OUTPUT)
    gpio.mode(2, gpio.OUTPUT)
    gpio.mode(3, gpio.OUTPUT)
    gpio.mode(4, gpio.OUTPUT)
    gpio.mode(5, gpio.OUTPUT)
    gpio.mode(6, gpio.OUTPUT)

    local pulser = gpio.pulse.build( {
        { [1] = gpio.HIGH,  delay=INITIAL_SPEED },
        { [1] = gpio.LOW,   delay=10000, loop=1, count=50 }
    })

    pulser:start(function() print("done") end)

    local direction = {}

    -- Para Esquerda
    direction["left"] = function ()
        gpio.write(2, gpio.HIGH)
        gpio.write(3, gpio.LOW)
    end

    -- Para Direita
    direction["right"] = function ()
        gpio.write(2, gpio.HIGH)
        gpio.write(3, gpio.LOW)
    end

    -- Reto
    direction["up"] = function ()
        gpio.write(2, gpio.HIGH)
        gpio.write(3, gpio.LOW)
    end

    -- Ré
    direction["down"] = function ()
        gpio.write(2, gpio.HIGH)
        gpio.write(3, gpio.LOW)
    end

    -- Aumentar Velocidade
    direction["speed_up"] = function ()
        speed_up(pulser, speed)
    end

    -- Diminuir Velocidade
    direction["speed_down"] = function ()
        speed_down(pulser, speed)
    end

    direction["turn_off"] = function ()
        gpio.write(1, gpio.LOW)
        gpio.write(6, gpio.LOW)
    end

    direction["turn_on"] = function ()
        gpio.write(1, gpio.HIGH)
        gpio.write(6, gpio.HIGH)
    end


    return direction
end


return makeDirection