local makeRelay = require("modules.relay.digital")


local relay = {}

relay.makeRelay = makeRelay

-- Create all methods for Relay Module
local function make()
    

    return relay
end




return make