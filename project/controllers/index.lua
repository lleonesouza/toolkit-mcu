local makeDHTController = require("controllers.dht")
local makeL298nBridgeController = require("controllers.l298n")
local makeHealthController = require("controllers.health")

local function makeControllers(cs)
    -- Health Controllers
    local Health = makeHealthController(cs)
    Health.health()

    -- DHT Controllers
    local DHT = makeDHTController(cs)
    DHT.readDth()

    -- L298N Controllers
    local L298N = makeL298nBridgeController(cs)
    L298N.back()
    L298N.run()
    L298N.stop()
    L298N.turnLeft()
    L298N.turnRight()
    L298N.setSpeed()

end


return makeControllers