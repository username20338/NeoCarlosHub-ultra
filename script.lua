--// NeoCarlosHub Ultra com Sistema de Key | Chave: Key systemy 🔐

local expectedKey = "Key systemy"  -- Chave atualizada
local inputKey = ""  -- Aqui o jogador deve inserir a chave manualmente no console
local isDarkMode = false  -- Modo claro/escuro
local fpsBoost = false  -- FPS Boost
local soundEnabled = true  -- Ativar som futurista

-- Função para verificar a chave
local function checkKey()
    print("Por favor, insira a chave de acesso para o 'Key systemy':")  -- Mensagem com o nome da chave
    inputKey = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("ScreenGui"):FindFirstChild("TextBox"):Text
    if inputKey == expectedKey then
        -- A chave está correta, liberar o NeoCarlosHub
        print("Chave correta! Acesso liberado ao 'Key systemy'.")
        -- Continue com a execução normal do NeoCarlosHub
        setupGUI()
    else
        -- Chave incorreta, bloquear o acesso
        print("Chave incorreta! Acesso negado ao 'Key systemy'.")
        game:GetService("Players").LocalPlayer:Kick("A chave de acesso está incorreta. Feche o jogo e insira a chave correta do 'Key systemy'.")
    end
end

-- Função para configurar a interface de usuário com animações e modos extras
local function setupGUI()
    local gui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")
    
    -- Criar efeito sonoro futurista
    if soundEnabled then
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://<ID_DO_SOM_FUTURISTA>"  -- Coloque o ID do som futurista
        sound.Parent = gui
        sound:Play()
    end
    
    -- Adicionando botões e animações
    local button = Instance.new("TextButton")
    button.Parent = gui
    button.Size = UDim2.new(0, 250, 0, 60)
    button.Position = UDim2.new(0.5, -125, 0.3, 0)
    button.Text = "Alternar Modo (Claro/Escuro)"
    button.TextSize = 24
    button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    button.TextColor3 = Color3.fromRGB(0, 0, 0)
    button.MouseButton1Click:Connect(function()
        isDarkMode = not isDarkMode
        if isDarkMode then
            gui.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
        else
            gui.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            button.TextColor3 = Color3.fromRGB(0, 0, 0)
        end
    end)

    -- FPS Boost (simulação)
    if fpsBoost then
        game:GetService("UserSettings").GameSettings:SetSetting("PerformanceStatsEnabled", true)
        print("FPS Boost ativado!")
    end

    -- Adicionando um botão de Reset da GUI
    local resetButton = Instance.new("TextButton")
    resetButton.Parent = gui
    resetButton.Size = UDim2.new(0, 250, 0, 60)
    resetButton.Position = UDim2.new(0.5, -125, 0.4, 0)
    resetButton.Text = "Resetar GUI"
    resetButton.TextSize = 24
    resetButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    resetButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    resetButton.MouseButton1Click:Connect(function()
        gui:ClearAllChildren()
        setupGUI()
    end)
    
    -- Modos Extras (opcionais)
    local extrasButton = Instance.new("TextButton")
    extrasButton.Parent = gui
    extrasButton.Size = UDim2.new(0, 250, 0, 60)
    extrasButton.Position = UDim2.new(0.5, -125, 0.5, 0)
    extrasButton.Text = "Modo Extra"
    extrasButton.TextSize = 24
    extrasButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    extrasButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    extrasButton.MouseButton1Click:Connect(function()
        -- Ativar recursos adicionais
        print("Modo Extra Ativado!")
        -- Você pode adicionar aqui novas funcionalidades ou animações
    end)
end

-- Iniciar a verificação da chave
checkKey()
