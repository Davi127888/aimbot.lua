-- Proteção básica contra alterações indesejadas
local original = {
    AimPart = "Head",
    Prediction = 0.0440,
    Enabled = true,
}

-- Proteção contra modificações externas
setmetatable(getgenv(), {
    __newindex = function(_, k, v)
        if k == "aimbot" then
            warn("Tentativa de alterar o aimbot bloqueada!")
            return
        end
        rawset(getgenv(), k, v)
    end
})

-- Detecta alguns executores maliciosos
local blockedExecutors = {"Proxo", "Arceus", "Skisploit"}
for _, exec in ipairs(blockedExecutors) do
    if identifyexecutor and string.find(identifyexecutor(), exec) then
        game.Players.LocalPlayer:Kick("Executor bloqueado detectado: " .. exec)
        return
    end
end

-- Script do aimbot
getgenv().aimbot = {
    Settings = {
        Prediction = original.Prediction,
        AutoClick = false,
    },
    TargetLock = {
        LockedTarget = nil,
        AimPart = original.AimPart,
        Enabled = original.Enabled,
    },
    TargetStrafe = {
        Enabled = true,
        UseButton = true,
        Distance = 5,
        Height = 5,
        Speed = 3,
    }
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/Davi127888/aimbot.lua/main/aimbot.lua"))()
print("✅ Aimbot carregado com segurança.")
