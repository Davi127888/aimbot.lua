-- Script FPS com iluminação de dia e otimização imediata - Por Davi
local lighting = game:GetService("Lighting")
local workspace = game:GetService("Workspace")

-- 🌞 Iluminação clara tipo dia
lighting.TimeOfDay = "14:00:00" -- 2 da tarde
lighting.Brightness = 2
lighting.GlobalShadows = false
lighting.OutdoorAmbient = Color3.new(1, 1, 1)
lighting.FogEnd = 1e10
lighting.FogStart = 0
lighting.FogColor = Color3.new(1, 1, 1)
lighting.ClockTime = 14

-- Desativa efeitos visuais pesados
for _, efeito in ipairs(lighting:GetChildren()) do
	if efeito:IsA("PostEffect") then
		efeito.Enabled = false
	end
end

-- 🧱 Função para otimizar blocos
local function otimizarParte(parte)
	if parte:IsA("BasePart") then
		parte.Material = Enum.Material.SmoothPlastic
		parte.Reflectance = 0
		parte.CastShadow = false
	end
end

-- 🧼 Otimizar partículas
local function desativarParticulas(obj)
	if obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
		obj.Enabled = false
	end
end

-- Aplicar em todo o mapa
for _, objeto in ipairs(workspace:GetDescendants()) do
	otimizarParte(objeto)
	desativarParticulas(objeto)
end

-- Otimização imediata para novos blocos e partículas
workspace.DescendantAdded:Connect(function(objeto)
	otimizarParte(objeto)
	desativarParticulas(objeto)
end)

-- Hook para blocos criados por scripts
workspace.ChildAdded:Connect(function(obj)
	if obj:IsA("Model") or obj:IsA("Folder") then
		for _, item in ipairs(obj:GetDescendants()) do
			otimizarParte(item)
			desativarParticulas(item)
		end
	elseif obj:IsA("BasePart") then
		otimizarParte(obj)
	end
end)
