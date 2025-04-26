PlayState = {}

function PlayState:enter()
    
end

function PlayState:draw()
    love.graphics.setColor(0.3, 0.1, 0.4)
    love.graphics.rectangle("fill", 0, 0, shove.getViewportWidth(), shove.getViewportHeight())
    love.graphics.setColor(1, 1, 1, 1)
end

function PlayState:update(elapsed)
    
end

return PlayState