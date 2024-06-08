-- server.lua

RegisterServerEvent('Heimel_JumpLimit:debugMessage')
AddEventHandler('Heimel_JumpLimit:debugMessage', function(playerName, message)
    if config.debug then
        print(playerName .. ": " .. message)
    end
end)
