local makeRelay = require("modules.relay.index")
local makeMotor = require("modules.motor.index")
local makeSonar = require("modules.sonar.index")
local makeDht = require("modules.dht.index")
local makeDs18b20 = require("modules.ds18b20.index")
local makeMq135 = require("modules.mq135.index")
local makeMhSeries = require("modules.mh-series.index")


-- All devices modules
local M = {}

-- M.Relay = makeRelay()
-- M.Motor = makeMotor()
-- M.Sonar = makeSonar()
-- M.Dht = makeDht()
-- M.Ds18b20 = makeDs18b20()
-- M.Mq = makeMq135()
-- M.MhSeries = makeMhSeries()

return M