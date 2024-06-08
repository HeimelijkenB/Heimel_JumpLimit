-- client.lua

local jumpCount = 0
local lastJumpTime = 0

Citizen.CreateThread(function()
    local config = config
    local GetPlayerName = GetPlayerName
    local IsPedJumping = IsPedJumping
    local PlayerPedId = PlayerPedId
    local SetPedToRagdoll = SetPedToRagdoll
    local GetGameTimer = GetGameTimer
    local TriggerServerEvent = TriggerServerEvent

    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        if IsPedJumping(playerPed) then
            local currentTime = GetGameTimer()
            if currentTime - lastJumpTime > config.jumpCooldown then
                lastJumpTime = currentTime
                jumpCount = jumpCount + 1
                local playerName = GetPlayerName(PlayerId())
                if config.debug then
                    TriggerServerEvent('Heimel_JumpLimit:debugMessage', playerName, "jumped. Jump count: " .. jumpCount)
                end
                if jumpCount > config.maxJumps then
                    SetPedToRagdoll(playerPed, config.ragdollTime, config.ragdollTime, 0, 0, 0, 0)
                    if config.debug then
                        TriggerServerEvent('Heimel_JumpLimit:debugMessage', playerName, "ragdolled due to exceeding jump limit.")
                    end
                end
            end
        end

        -- Reset jump count after the specified reset time
        if GetGameTimer() - lastJumpTime > config.resetTime then
            jumpCount = 0
        end
    end
end)
