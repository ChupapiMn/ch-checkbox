local path = 'capture_system/'

if SERVER then

    for b, File in SortedPairs(file.Find(path .. 'client/*.lua', "LUA"), true) do
        AddCSLuaFile(path .. 'client/' .. File)
    end

    for b, File in SortedPairs(file.Find(path .. "client/config/*.lua", "LUA"), true) do
        AddCSLuaFile(path .. "client/config/" .. File)
    end

    for b, File in SortedPairs(file.Find(path .. 'shared/*.lua', "LUA"), true) do
        include(path .. 'shared/' .. File)
        AddCSLuaFile(path .. 'shared/' .. File)
    end

    for b, File in SortedPairs(file.Find(path .. 'server/*.lua', "LUA"), true) do
        include(path .. 'server/' .. File)
    end

    for b, Font in SortedPairs(file.Find("resource/fonts/capture_system_fonts/*", "GAME"), true) do
        resource.AddFile("resource/fonts/capture_system_fonts/" .. Font)
    end

end

if CLIENT then

    for b, File in SortedPairs(file.Find(path .. 'client/*.lua', "LUA"), true) do
        include(path .. 'client/' .. File)
    end

    for b, File in SortedPairs(file.Find(path .. "client/config/*.lua", "LUA"), true) do
        include(path .. "client/config/" .. File)
    end

    for b, File in SortedPairs(file.Find(path .. 'shared/*.lua', "LUA"), true) do
        include(path .. 'shared/' .. File)
        AddCSLuaFile(path .. 'shared/' .. File)
    end

end
