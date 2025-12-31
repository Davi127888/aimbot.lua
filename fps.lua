-- FPS BOOST MOBILE | DELTA EXECUTOR | UNIVERSAL

-- FPS automático / ilimitado
pcall(function()
    setfpscap(999)
end)

-- Serviços
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

-- Otimização de gráficos
Lighting.GlobalShadows = false
Lighting.FogEnd = 9e9
Lighting.Brightness = 1

pcall(function()
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
end)

-- Remove efeitos pesados
for _, v in pairs(Lighting:GetChildren()) do
    if v:IsA("PostEffect") or v:IsA("BloomEffect") or v:IsA("SunRaysEffect") 
    or v:IsA("ColorCorrectionEffect") or v:IsA("BlurEffect") then
        v:Destroy()
    end
end

-- Otimiza todas as partes do mapa
for _, v in pairs(workspace:GetDescendants()) do
    if v:IsA("BasePart") then
        v.Material = Enum.Material.Plastic
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Enabled = false
    end
end

-- Remove roupas detalhadas (menos lag)
for _, v in pairs(Players:GetPlayers()) do
    if v.Character then
        for _, x in pairs(v.Character:GetDescendants()) do
            if x:IsA("Accessory") or x:IsA("Clothing") then
                x:Destroy()
            end
        end
    end
end

-- Prioridade máxima do jogo
RunService:Set3dRenderingEnabled(true)

print("FPS BOOST ATIVADO | DELTA EXECUTOR")
