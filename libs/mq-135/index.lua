local makeMq = require("modules.mq135.mq135")


local mq = {}

mq.makeMq = makeMq

local function make()
    return mq
end




return make

