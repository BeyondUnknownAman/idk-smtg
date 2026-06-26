--[[
    Cascade UI Example Script with Keybind Overlay
    RightControl = toggle menu
    UI Settings tab has a toggle for the keybinds panel
]]

local ok, err = pcall(function()
    local cascade = loadstring(game:HttpGet("https://raw.githubusercontent.com/BeyondUnknownAman/idk-smtg/main/dist.luau"))()

    local app = cascade.New({
        Theme = cascade.Themes.Dark,
        Accent = cascade.Accents.Blue,
        WindowPill = true,
        KeybindOverlayKey = Enum.KeyCode.RightControl,
    })

    local window = app:Window({
        Title = "Cascade Demo",
        Subtitle = "v1.0",
        Size = UDim2.fromOffset(850, 530),
    })

    local function titledRow(parent, title, subtitle)
        local row = parent:Row()
        row:Left():TitleStack({ Title = title, Subtitle = subtitle })
        return row
    end

    -- One section, multiple tabs
    local section = window:Section({
        Disclosure = false,
        Title = "Features",
    })

    -- ========================================
    -- MAIN TAB
    -- ========================================
    local mainTab = section:Tab({
        Selected = true,
        Title = "Main",
    })

    local mainForm = mainTab:Form()

    mainForm:PageSection({ Title = "Combat", Subtitle = "Combat features" })

    titledRow(mainForm, "Aimbot", "Locks on to nearest player"):Right():Toggle({
        Value = false,
        ValueChanged = function(self, val) print("Aimbot:", val) end,
    })

    titledRow(mainForm, "Aimbot Keybind"):Right():KeybindField({
        Label = "Aimbot",
        Value = Enum.KeyCode.Q,
        OverlayKeybind = true,
        OverlayToggled = function(self, on) print("Aimbot:", on) end,
    })

    titledRow(mainForm, "FOV Radius", "Aimbot field of view"):Right():Slider({
        Minimum = 0, Maximum = 500, Value = 120,
        ValueChanged = function(self, val) print("FOV:", val) end,
    })

    titledRow(mainForm, "Silent Aim", "Redirects bullets silently"):Right():Toggle({
        Value = false,
        ValueChanged = function(self, val) print("Silent Aim:", val) end,
    })

    mainForm:PageSection({ Title = "Movement", Subtitle = "Movement features" })

    titledRow(mainForm, "Fly", "Fly around the map"):Right():Toggle({
        Value = false,
        ValueChanged = function(self, val) print("Fly:", val) end,
    })

    titledRow(mainForm, "Fly Keybind"):Right():KeybindField({
        Label = "Fly",
        Value = Enum.KeyCode.F,
        OverlayKeybind = true,
        OverlayToggled = function(self, on) print("Fly:", on) end,
    })

    titledRow(mainForm, "Walk Speed", "Change walk speed"):Right():Slider({
        Minimum = 16, Maximum = 200, Value = 16,
        ValueChanged = function(self, val) print("Speed:", val) end,
    })

    titledRow(mainForm, "Speed Keybind"):Right():KeybindField({
        Label = "Speed",
        Value = Enum.KeyCode.V,
        OverlayKeybind = true,
        OverlayToggled = function(self, on) print("Speed:", on) end,
    })

    titledRow(mainForm, "Noclip", "Walk through walls"):Right():Toggle({
        Value = false,
        ValueChanged = function(self, val) print("Noclip:", val) end,
    })

    titledRow(mainForm, "Infinite Jump", "Jump in mid-air"):Right():Toggle({
        Value = false,
        ValueChanged = function(self, val) print("Inf Jump:", val) end,
    })

    -- ========================================
    -- VISUALS TAB
    -- ========================================
    local visualsTab = section:Tab({ Title = "Visuals" })
    local visualsForm = visualsTab:Form()

    visualsForm:PageSection({ Title = "ESP", Subtitle = "Player ESP" })

    titledRow(visualsForm, "ESP Enabled", "Show players through walls"):Right():Toggle({
        Value = false,
        ValueChanged = function(self, val) print("ESP:", val) end,
    })

    titledRow(visualsForm, "ESP Keybind"):Right():KeybindField({
        Label = "ESP",
        Value = Enum.KeyCode.E,
        OverlayKeybind = true,
        OverlayToggled = function(self, on) print("ESP:", on) end,
    })

    titledRow(visualsForm, "Box ESP", "Draw boxes around players"):Right():Toggle({ Value = true })
    titledRow(visualsForm, "Name ESP", "Show player names"):Right():Toggle({ Value = true })
    titledRow(visualsForm, "Health Bar", "Show health bars"):Right():Toggle({ Value = true })
    titledRow(visualsForm, "Tracers", "Draw lines to players"):Right():Toggle({ Value = false })

    titledRow(visualsForm, "Render Distance", "Max ESP distance"):Right():Slider({
        Minimum = 100, Maximum = 10000, Value = 2000,
        ValueChanged = function(self, val) print("Render Dist:", val) end,
    })

    visualsForm:PageSection({ Title = "World", Subtitle = "World effects" })

    titledRow(visualsForm, "Fullbright", "Remove all darkness"):Right():Toggle({
        Value = false,
        ValueChanged = function(self, val) print("Fullbright:", val) end,
    })

    titledRow(visualsForm, "No Fog", "Remove fog"):Right():Toggle({
        Value = false,
        ValueChanged = function(self, val) print("No Fog:", val) end,
    })

    -- ========================================
    -- MISC TAB
    -- ========================================
    local miscTab = section:Tab({ Title = "Misc" })
    local miscForm = miscTab:Form()

    miscForm:PageSection({ Title = "Player", Subtitle = "Player features" })

    titledRow(miscForm, "God Mode", "Take no damage"):Right():Toggle({
        Value = false,
        ValueChanged = function(self, val) print("God Mode:", val) end,
    })

    titledRow(miscForm, "God Mode Keybind"):Right():KeybindField({
        Label = "God Mode",
        Value = Enum.KeyCode.G,
        OverlayKeybind = true,
        OverlayToggled = function(self, on) print("God Mode:", on) end,
    })

    titledRow(miscForm, "Max Health", "Set max health"):Right():Slider({
        Minimum = 1, Maximum = 1000, Value = 100,
        ValueChanged = function(self, val) print("Max HP:", val) end,
    })

    miscForm:PageSection({ Title = "Fun", Subtitle = "Fun stuff" })

    titledRow(miscForm, "Teleport", "Teleport to mouse"):Right():Button({
        Label = "Teleport",
        State = "Primary",
        Pushed = function(self) print("Teleported!") end,
    })

    titledRow(miscForm, "Respawn", "Force respawn"):Right():Button({
        Label = "Respawn",
        State = "Secondary",
        Pushed = function(self) print("Respawned!") end,
    })

    titledRow(miscForm, "Destroy All", "Destroy all parts"):Right():Button({
        Label = "Destroy",
        State = "Destructive",
        Pushed = function(self) print("Destroyed!") end,
    })

    -- ========================================
    -- UI SETTINGS TAB
    -- ========================================
    local settingsTab = section:Tab({ Title = "UI Settings" })
    local settingsForm = settingsTab:Form()

    settingsForm:PageSection({ Title = "Menu", Subtitle = "UI options" })

    titledRow(settingsForm, "Keybinds Menu", "Show/hide keybinds panel"):Right():Toggle({
        Value = false,
        ValueChanged = function(self, value)
            app.KeybindOverlay.SetVisible(value)
        end,
    })

    print("Cascade Demo loaded! RightControl = toggle menu")
end)

if not ok then
    warn("Error: " .. tostring(err))
end
