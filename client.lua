-- client.lua

local jumpCount = 0
local lastJumpTime = 0

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local playerName = GetPlayerName(PlayerId())
        if IsPedJumping(playerPed) then
            local currentTime = GetGameTimer()
            if currentTime - lastJumpTime > (config.jumpCooldown or 1000) then
                lastJumpTime = currentTime
                jumpCount = jumpCount + 1
                if config.debug then
                    TriggerServerEvent('Heimel_JumpLimit:debugMessage', playerName, "jumped. Jump count: " .. jumpCount)
                end
                if jumpCount > (config.maxJumps or 2) then
                    SetPedToRagdoll(playerPed, config.ragdollTime or 1000, config.ragdollTime or 1000, 0, 0, 0, 0)
                    if config.debug then
                        TriggerServerEvent('Heimel_JumpLimit:debugMessage', playerName, "ragdolled due to exceeding jump limit.")
                    end
                end
            end
        end

        -- Reset jump count after the specified reset time
        if GetGameTimer() - lastJumpTime > (config.resetTime or 5000) then
            jumpCount = 0
        end
    end
end)
