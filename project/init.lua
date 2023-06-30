local startWifi = require("wireless")
local makeControllers = require("controllers/index")

--- @param port number
local initServer = function (port)
    print("starting server")
    local cs = coap.Server()

    makeControllers(cs)
    cs:listen(port)
end

startWifi()
initServer(5683)
