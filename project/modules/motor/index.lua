-- pin0 first motor pwm
-- pin1 first motor pin left
-- pin2 first motor pin right
-- pin4 second motor pwm
-- pin5 second motor pin left
-- pin6 second motor pin right
local makeDirection = function(pin0, pin1, pin2, pin3, pin4, pin5)
    local initialSpeed = 300
    gpio.mode(pin0, gpio.OUTPUT)
    gpio.mode(pin1, gpio.OUTPUT)
    gpio.mode(pin2, gpio.OUTPUT)
    gpio.mode(pin3, gpio.OUTPUT)
    gpio.mode(pin4, gpio.OUTPUT)
    gpio.mode(pin5, gpio.OUTPUT)
    gpio.write(pin0, gpio.HIGH)
    gpio.write(pin3, gpio.HIGH)
    pwm.setup(pin0, 1000, 0)
    pwm.setup(pin3, 1000, 0)
    pwm.setduty(pin0, initialSpeed)
    pwm.setduty(pin3, initialSpeed)
    gpio.write(pin1, gpio.LOW)
    gpio.write(pin2, gpio.LOW)
    gpio.write(pin4, gpio.LOW)
    gpio.write(pin5, gpio.LOW)

    local direction = {}
    
    -- Trocar Velocidade
    direction.setSpeed = function(speed)
        pwm.setduty(pin0, speed)
        pwm.setduty(pin3, speed)
    end
    
    -- Para Esquerda
    direction.left = function()
        -- motor 1
        gpio.write(pin1, gpio.LOW)
        gpio.write(pin2, gpio.LOW)
        -- motor 2
        gpio.write(pin4, gpio.LOW)
        gpio.write(pin5, gpio.HIGH)
    end

    -- Para Direita
    direction.right = function()
        -- motor 1
        gpio.write(pin1, gpio.LOW)
        gpio.write(pin2, gpio.HIGH)
        -- motor 2
        gpio.write(pin4, gpio.LOW)
        gpio.write(pin5, gpio.LOW)
    end

    -- Reto
    direction.run = function()
        -- motor 1
        gpio.write(pin1, gpio.LOW)
        gpio.write(pin2, gpio.HIGH)
        -- motor 2
        gpio.write(pin4, gpio.LOW)
        gpio.write(pin5, gpio.HIGH)
    end

    -- Ré
    direction.back = function()
        -- motor 1
        gpio.write(pin1, gpio.HIGH)
        gpio.write(pin2, gpio.LOW)
        -- motor 2
        gpio.write(pin4, gpio.HIGH)
        gpio.write(pin5, gpio.LOW)
    end

    -- Desligar
    direction.off = function()
        -- motor 1
        gpio.write(pin1, gpio.LOW)
        gpio.write(pin2, gpio.LOW)
        -- motor 2
        gpio.write(pin4, gpio.LOW)
        gpio.write(pin5, gpio.LOW)
    end

    return direction
end
return makeDirection


-- -- Aumentar Velocidade
-- direction["speed_up"] = function ()
--     local INCREASE_SPEED = 1000
--     speed = speed + INCREASE_SPEED
--     pulser:update(1, { [1] = gpio.HIGH, delay = speed })
--     pulser:update(3, { [1] = gpio.HIGH, delay = speed })
-- end

-- -- Diminuir Velocidade
-- direction["speed_down"] = function ()
--     local INCREASE_SPEED = 1000
--     speed = speed - INCREASE_SPEED
--     pulser:update(1, { [1] = gpio.HIGH, delay = speed })
--     pulser:update(3, { [1] = gpio.HIGH, delay = speed })
-- end
