local makeDht11 = require("modules.dht.index")
local makeDirection = require("modules.motor.index")

local M = {
    Dht11 = makeDht11(8),
    L298N = makeDirection(1,2,3,5,6,7)
}


return M
