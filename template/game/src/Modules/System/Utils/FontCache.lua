local FontCache = {
    paths = {},
    pool = {}
}

function FontCache.init()
    FontCache.paths = love.filesystem.getDirectoryItems("assets/fonts")

    for f = 1, #FontCache.paths, 1 do
        FontCache.paths[f] = "assets/fonts/" .. FontCache.paths[f]
    end
end

function FontCache.getFont(_name, _size)
    for p = 1, #FontCache.paths, 1 do
        local path = FontCache.paths[p]:match("[^/]+$"):gsub(".ttf", "")
        if path == _name then
            local fontdata = _name .. "-" .. _size
            if FontCache.pool[fontdata] then
                return FontCache.pool[fontdata]
            else
                FontCache.pool[fontdata] = love.graphics.newFont(FontCache.paths[p], _size)
                return FontCache.pool[fontdata]
            end
        end
    end
    error(string.format("[ERROR] : The font %s is not on the path", _name))
end

return FontCache