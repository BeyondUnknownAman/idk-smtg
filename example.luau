--[[
    Cascade UI Example with Keybind Overlay
    RightControl = toggle menu
    UI Settings tab has toggle for keybinds panel
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

    local section = window:Section({ Title = "Features" })

    -- ========================================
    -- MAIN TAB
    -- ========================================
    local mainTab = section:Tab({ Selected = true, Title = "Main" })

    do -- Combat
        local form = mainTab:PageSection({ Title = "Combat", Subtitle = "Combat features" }):Form()

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Aimbot", Subtitle = "Locks on to nearest player" })
            row:Right():Toggle({ Value = false, ValueChanged = function(self, val) print("Aimbot:", val) end })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Aimbot Keybind" })
            row:Right():KeybindField({
                Label = "Aimbot", Value = Enum.KeyCode.Q,
                OverlayKeybind = true,
                OverlayToggled = function(self, on) print("Aimbot:", on) end,
            })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "FOV Radius", Subtitle = "Aimbot field of view" })
            row:Right():Slider({ Minimum = 0, Maximum = 500, Value = 120, ValueChanged = function(self, val) print("FOV:", val) end })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Silent Aim", Subtitle = "Redirects bullets silently" })
            row:Right():Toggle({ Value = false, ValueChanged = function(self, val) print("Silent Aim:", val) end })
        end
    end

    do -- Movement
        local form = mainTab:PageSection({ Title = "Movement", Subtitle = "Movement features" }):Form()

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Fly", Subtitle = "Fly around the map" })
            row:Right():Toggle({ Value = false, ValueChanged = function(self, val) print("Fly:", val) end })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Fly Keybind" })
            row:Right():KeybindField({
                Label = "Fly", Value = Enum.KeyCode.F,
                OverlayKeybind = true,
                OverlayToggled = function(self, on) print("Fly:", on) end,
            })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Walk Speed", Subtitle = "Change walk speed" })
            row:Right():Slider({ Minimum = 16, Maximum = 200, Value = 16, ValueChanged = function(self, val) print("Speed:", val) end })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Speed Keybind" })
            row:Right():KeybindField({
                Label = "Speed", Value = Enum.KeyCode.V,
                OverlayKeybind = true,
                OverlayToggled = function(self, on) print("Speed:", on) end,
            })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Noclip", Subtitle = "Walk through walls" })
            row:Right():Toggle({ Value = false, ValueChanged = function(self, val) print("Noclip:", val) end })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Infinite Jump", Subtitle = "Jump in mid-air" })
            row:Right():Toggle({ Value = false, ValueChanged = function(self, val) print("Inf Jump:", val) end })
        end
    end

    -- ========================================
    -- VISUALS TAB
    -- ========================================
    local visualsTab = section:Tab({ Title = "Visuals" })

    do -- ESP
        local form = visualsTab:PageSection({ Title = "ESP", Subtitle = "Player ESP" }):Form()

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "ESP Enabled", Subtitle = "Show players through walls" })
            row:Right():Toggle({ Value = false, ValueChanged = function(self, val) print("ESP:", val) end })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "ESP Keybind" })
            row:Right():KeybindField({
                Label = "ESP", Value = Enum.KeyCode.E,
                OverlayKeybind = true,
                OverlayToggled = function(self, on) print("ESP:", on) end,
            })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Box ESP", Subtitle = "Draw boxes around players" })
            row:Right():Toggle({ Value = true })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Name ESP", Subtitle = "Show player names" })
            row:Right():Toggle({ Value = true })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Health Bar", Subtitle = "Show health bars" })
            row:Right():Toggle({ Value = true })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Tracers", Subtitle = "Draw lines to players" })
            row:Right():Toggle({ Value = false })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Render Distance", Subtitle = "Max ESP distance" })
            row:Right():Slider({ Minimum = 100, Maximum = 10000, Value = 2000, ValueChanged = function(self, val) print("Render Dist:", val) end })
        end
    end

    do -- World
        local form = visualsTab:PageSection({ Title = "World", Subtitle = "World effects" }):Form()

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Fullbright", Subtitle = "Remove all darkness" })
            row:Right():Toggle({ Value = false, ValueChanged = function(self, val) print("Fullbright:", val) end })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "No Fog", Subtitle = "Remove fog" })
            row:Right():Toggle({ Value = false, ValueChanged = function(self, val) print("No Fog:", val) end })
        end
    end

    -- ========================================
    -- MISC TAB
    -- ========================================
    local miscTab = section:Tab({ Title = "Misc" })

    do -- Player
        local form = miscTab:PageSection({ Title = "Player", Subtitle = "Player features" }):Form()

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "God Mode", Subtitle = "Take no damage" })
            row:Right():Toggle({ Value = false, ValueChanged = function(self, val) print("God Mode:", val) end })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "God Mode Keybind" })
            row:Right():KeybindField({
                Label = "God Mode", Value = Enum.KeyCode.G,
                OverlayKeybind = true,
                OverlayToggled = function(self, on) print("God Mode:", on) end,
            })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Max Health", Subtitle = "Set max health" })
            row:Right():Slider({ Minimum = 1, Maximum = 1000, Value = 100, ValueChanged = function(self, val) print("Max HP:", val) end })
        end
    end

    do -- Fun
        local form = miscTab:PageSection({ Title = "Fun", Subtitle = "Fun stuff" }):Form()

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Teleport", Subtitle = "Teleport to mouse" })
            row:Right():Button({ Label = "Teleport", State = "Primary", Pushed = function(self) print("Teleported!") end })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Respawn", Subtitle = "Force respawn" })
            row:Right():Button({ Label = "Respawn", State = "Secondary", Pushed = function(self) print("Respawned!") end })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Destroy All", Subtitle = "Destroy all parts" })
            row:Right():Button({ Label = "Destroy", State = "Destructive", Pushed = function(self) print("Destroyed!") end })
        end
    end

    -- ========================================
    -- UI SETTINGS TAB
    -- ========================================
    local settingsTab = section:Tab({ Title = "UI Settings" })

    do -- Menu
        local form = settingsTab:PageSection({ Title = "Menu", Subtitle = "UI options" }):Form()

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Keybinds Menu", Subtitle = "Show/hide keybinds panel" })
            row:Right():Toggle({
                Value = false,
                ValueChanged = function(self, value)
                    app.KeybindOverlay.SetVisible(value)
                end,
            })
        end
    end

    print("Cascade Demo loaded! RightControl = toggle menu")
end)

if not ok then
    warn("Error: " .. tostring(err))
end
