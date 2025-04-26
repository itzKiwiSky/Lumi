require('src.Modules.System.Run')

function love.initialize()
    local save = require 'src.Modules.System.Utils.Save'

    gameSave = save.new("game")

    gameSave.save = {}

    gameSave:initialize()

    registers = {}

    -- autoload states --
    local states = love.filesystem.getDirectoryItems("src/Scenes")
    for s = 1, #states, 1 do
        require("src.Scenes." .. states[s]:gsub(".lua", ""))
    end

    gamestate.registerEvents()
    gamestate.switch(PlayState)
end