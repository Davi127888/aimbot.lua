getgenv().main = {
    Settings = {
        Prediction = 0.0440, 
        AutoClick = false, -- Dont work atm
    },
    TargetLock = {
        LockedTarget = nil, -- dont change
        AimPart = "Head", 
        Enabled = true, 
    },
    TargetStrafe = {
        Enabled = true,
        UseButton = true,
        Distance = 5,
        Height = 5,
        Speed = 20,
    },
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/Davi127888/aimbot.lua/main/aimbot.lua"))()
