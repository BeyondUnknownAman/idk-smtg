--[[
    Cascade UI Example Script with Keybind Overlay
    Shows all UI components — most are placeholders
    RightControl = toggle menu
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
        Subtitle = "v1.0 — Example Script",
        Size = UDim2.fromOffset(850, 530),
    })

    -- ========================================
    -- MAIN TAB
    -- ========================================
    local mainTab = window:Tab({ Title = "Main", Selected = true })

    -- Combat Section
    local combatSection = mainTab:Section({ Title = "Combat" })

    local aimbotRow = combatSection:Row()
    aimbotRow:Left():TitleStack({ Title = "Aimbot", Subtitle = "Locks on to nearest player" })
    aimbotRow:Right():Toggle({
        Value = false,
        ValueChanged = function(self, val)
            print("Aimbot:", val)
        end,
    })

    local aimbotBindRow = combatSection:Row()
    aimbotBindRow:Left():TitleStack({ Title = "Aimbot Keybind" })
    aimbotBindRow:Right():KeybindField({
        Label = "Aimbot",
        Value = Enum.KeyCode.Q,
        OverlayKeybind = true,
        OverlayToggled = function(self, on)
            print("Aimbot toggled:", on)
        end,
    })

    local fovRow = combatSection:Row()
    fovRow:Left():TitleStack({ Title = "FOV Radius", Subtitle = "Aimbot field of view" })
    fovRow:Right():Slider({
        Minimum = 0,
        Maximum = 500,
        Value = 120,
        ValueChanged = function(self, val)
            print("FOV:", val)
        end,
    })

    local silentRow = combatSection:Row()
    silentRow:Left():TitleStack({ Title = "Silent Aim", Subtitle = "Redirects bullets silently" })
    silentRow:Right():Toggle({
        Value = false,
        ValueChanged = function(self, val)
            print("Silent Aim:", val)
        end,
    })

    -- Movement Section
    local moveSection = mainTab:Section({ Title = "Movement" })

    local flyRow = moveSection:Row()
    flyRow:Left():TitleStack({ Title = "Fly", Subtitle = "Fly around the map" })
    flyRow:Right():Toggle({
        Value = false,
        ValueChanged = function(self, val)
            print("Fly:", val)
        end,
    })

    local flyBindRow = moveSection:Row()
    flyBindRow:Left():TitleStack({ Title = "Fly Keybind" })
    flyBindRow:Right():KeybindField({
        Label = "Fly",
        Value = Enum.KeyCode.F,
        OverlayKeybind = true,
        OverlayToggled = function(self, on)
            print("Fly toggled:", on)
        end,
    })

    local speedRow = moveSection:Row()
    speedRow:Left():TitleStack({ Title = "Walk Speed", Subtitle = "Change walk speed" })
    speedRow:Right():Slider({
        Minimum = 16,
        Maximum = 200,
        Value = 16,
        ValueChanged = function(self, val)
            print("Speed:", val)
        end,
    })

    local speedBindRow = moveSection:Row()
    speedBindRow:Left():TitleStack({ Title = "Speed Keybind" })
    speedBindRow:Right():KeybindField({
        Label = "Speed",
        Value = Enum.KeyCode.V,
        OverlayKeybind = true,
        OverlayToggled = function(self, on)
            print("Speed toggled:", on)
        end,
    })

    local noclipRow = moveSection:Row()
    noclipRow:Left():TitleStack({ Title = "Noclip", Subtitle = "Walk through walls" })
    noclipRow:Right():Toggle({
        Value = false,
        ValueChanged = function(self, val)
            print("Noclip:", val)
        end,
    })

    local infJumpRow = moveSection:Row()
    infJumpRow:Left():TitleStack({ Title = "Infinite Jump", Subtitle = "Jump in mid-air" })
    infJumpRow:Right():Toggle({
        Value = false,
        ValueChanged = function(self, val)
            print("Infinite Jump:", val)
        end,
    })

    -- ========================================
    -- VISUALS TAB
    -- ========================================
    local visualsTab = window:Tab({ Title = "Visuals" })

    local espSection = visualsTab:Section({ Title = "ESP" })

    local espRow = espSection:Row()
    espRow:Left():TitleStack({ Title = "ESP Enabled", Subtitle = "Show players through walls" })
    espRow:Right():Toggle({
        Value = false,
        ValueChanged = function(self, val)
            print("ESP:", val)
        end,
    })

    local espBindRow = espSection:Row()
    espBindRow:Left():TitleStack({ Title = "ESP Keybind" })
    espBindRow:Right():KeybindField({
        Label = "ESP",
        Value = Enum.KeyCode.E,
        OverlayKeybind = true,
        OverlayToggled = function(self, on)
            print("ESP toggled:", on)
        end,
    })

    local boxRow = espSection:Row()
    boxRow:Left():TitleStack({ Title = "Box ESP", Subtitle = "Draw boxes around players" })
    boxRow:Right():Toggle({ Value = true })

    local nameRow = espSection:Row()
    nameRow:Left():TitleStack({ Title = "Name ESP", Subtitle = "Show player names" })
    nameRow:Right():Toggle({ Value = true })

    local healthRow = espSection:Row()
    healthRow:Left():TitleStack({ Title = "Health Bar", Subtitle = "Show health bars" })
    healthRow:Right():Toggle({ Value = true })

    local tracerRow = espSection:Row()
    tracerRow:Left():TitleStack({ Title = "Tracers", Subtitle = "Draw lines to players" })
    tracerRow:Right():Toggle({ Value = false })

    local renderDistRow = espSection:Row()
    renderDistRow:Left():TitleStack({ Title = "Render Distance", Subtitle = "Max ESP distance" })
    renderDistRow:Right():Slider({
        Minimum = 100,
        Maximum = 10000,
        Value = 2000,
        ValueChanged = function(self, val)
            print("Render Distance:", val)
        end,
    })

    -- World Section
    local worldSection = visualsTab:Section({ Title = "World" })

    local fullbrightRow = worldSection:Row()
    fullbrightRow:Left():TitleStack({ Title = "Fullbright", Subtitle = "Remove all darkness" })
    fullbrightRow:Right():Toggle({
        Value = false,
        ValueChanged = function(self, val)
            print("Fullbright:", val)
        end,
    })

    local noFogRow = worldSection:Row()
    noFogRow:Left():TitleStack({ Title = "No Fog", Subtitle = "Remove fog effect" })
    noFogRow:Right():Toggle({
        Value = false,
        ValueChanged = function(self, val)
            print("No Fog:", val)
        end,
    })

    -- ========================================
    -- MISC TAB
    -- ========================================
    local miscTab = window:Tab({ Title = "Misc" })

    local playerSection = miscTab:Section({ Title = "Player" })

    local godRow = playerSection:Row()
    godRow:Left():TitleStack({ Title = "God Mode", Subtitle = "Take no damage" })
    godRow:Right():Toggle({
        Value = false,
        ValueChanged = function(self, val)
            print("God Mode:", val)
        end,
    })

    local godBindRow = playerSection:Row()
    godBindRow:Left():TitleStack({ Title = "God Mode Keybind" })
    godBindRow:Right():KeybindField({
        Label = "God Mode",
        Value = Enum.KeyCode.G,
        OverlayKeybind = true,
        OverlayToggled = function(self, on)
            print("God Mode toggled:", on)
        end,
    })

    local hpRow = playerSection:Row()
    hpRow:Left():TitleStack({ Title = "Max Health", Subtitle = "Set your max health" })
    hpRow:Right():Slider({
        Minimum = 1,
        Maximum = 1000,
        Value = 100,
        ValueChanged = function(self, val)
            print("Max HP:", val)
        end,
    })

    -- Button examples
    local funSection = miscTab:Section({ Title = "Fun" })

    local btnRow = funSection:Row()
    btnRow:Left():TitleStack({ Title = "Teleport", Subtitle = "Teleport to mouse position" })
    btnRow:Right():Button({
        Label = "Teleport",
        State = "Primary",
        Pushed = function(self)
            print("Teleported!")
        end,
    })

    local btnRow2 = funSection:Row()
    btnRow2:Left():TitleStack({ Title = "Respawn", Subtitle = "Force respawn character" })
    btnRow2:Right():Button({
        Label = "Respawn",
        State = "Secondary",
        Pushed = function(self)
            print("Respawned!")
        end,
    })

    local btnRow3 = funSection:Row()
    btnRow3:Left():TitleStack({ Title = "Destroy", Subtitle = "Destroy all parts" })
    btnRow3:Right():Button({
        Label = "Destroy All",
        State = "Destructive",
        Pushed = function(self)
            print("Destroyed!")
        end,
    })

    -- ========================================
    -- UI SETTINGS TAB
    -- ========================================
    local settingsTab = window:Tab({ Title = "UI Settings" })
    local menuSection = settingsTab:Section({ Title = "Menu" })

    -- Keybinds overlay toggle (like Obsidian)
    local kbRow = menuSection:Row()
    kbRow:Left():TitleStack({ Title = "Keybinds Menu", Subtitle = "Show/hide keybinds panel" })
    kbRow:Right():Toggle({
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
