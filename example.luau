--[[
    Cascade UI — Full Example with Keybind Overlay
    Shows every component type from the Cascade docs
    RightControl = toggle menu
    All keybinds show notifications when toggled
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
        Subtitle = "v1.0 — All Components",
        Size = UDim2.fromOffset(850, 530),
        Searching = true,
        Draggable = true,
        Resizable = true,
        Dropshadow = true,
    })

    local section = window:Section({
        Disclosure = false,
        Title = "Features",
    })

    -- ========================================
    -- MAIN TAB — Combat + Movement
    -- ========================================
    local mainTab = section:Tab({
        Selected = true,
        Title = "Main",
        Icon = cascade.Symbols.squareStack3dUp,
    })

    do -- Combat
        local form = mainTab:PageSection({
            Title = "Combat",
            Subtitle = "Combat features",
        }):Form()

        do
            local row = form:Row({ SearchIndex = "Aimbot" })
            row:Left():TitleStack({ Title = "Aimbot", Subtitle = "Locks on to nearest player" })
            row:Right():Toggle({
                Value = false,
                ValueChanged = function(self, val)
                    app:Notification({
                        App = "COMBAT",
                        Title = "Aimbot " .. (val and "Enabled" or "Disabled"),
                        Subtitle = val and "Now locking on to nearest player" or "Aimbot turned off",
                        Icon = val and cascade.Symbols.checkmark or cascade.Symbols.xMark,
                        Duration = 3,
                    })
                end,
            })
        end

        do
            local row = form:Row({ SearchIndex = "Aimbot Keybind" })
            row:Left():TitleStack({ Title = "Aimbot Keybind", Subtitle = "Toggle aimbot with a key" })
            row:Right():KeybindField({
                Label = "Aimbot",
                Value = Enum.KeyCode.Q,
                OverlayKeybind = true,
                OverlayToggled = function(self, on)
                    app:Notification({
                        App = "COMBAT",
                        Title = "Aimbot " .. (on and "ON" or "OFF"),
                        Subtitle = on and "Aimbot activated via keybind" or "Aimbot deactivated",
                        Icon = on and cascade.Symbols.checkmark or cascade.Symbols.xMark,
                        Duration = 3,
                    })
                end,
                BindPressed = function(self, value, complete, gpe)
                    if complete and not gpe then
                        app:Notification({
                            App = "COMBAT",
                            Title = "Aimbot Key Pressed",
                            Subtitle = "Keybind: " .. tostring(value),
                            Duration = 2,
                        })
                    end
                end,
            })
        end

        do
            local row = form:Row({ SearchIndex = "FOV" })
            row:Left():TitleStack({ Title = "FOV Radius", Subtitle = "Aimbot field of view" })
            row:Right():Slider({
                Minimum = 0,
                Maximum = 500,
                Value = 120,
                ValueChanged = function(self, val) print("FOV:", val) end,
            })
        end

        do
            local row = form:Row({ SearchIndex = "Silent Aim" })
            row:Left():TitleStack({ Title = "Silent Aim", Subtitle = "Redirects bullets silently" })
            row:Right():Toggle({
                Value = false,
                ValueChanged = function(self, val)
                    app:Notification({
                        App = "COMBAT",
                        Title = "Silent Aim " .. (val and "Enabled" or "Disabled"),
                        Subtitle = val and "Bullets will redirect to targets" or "Silent aim turned off",
                        Duration = 3,
                    })
                end,
            })
        end

        do
            local row = form:Row({ SearchIndex = "Hit Chance" })
            row:Left():TitleStack({ Title = "Hit Chance", Subtitle = "Probability of hitting target" })
            row:Right():Stepper({
                Minimum = 0,
                Maximum = 100,
                Step = 5,
                Fielded = true,
                Value = 75,
                ValueChanged = function(self, val) print("Hit Chance:", val) end,
            })
        end

        do
            local row = form:Row({ SearchIndex = "Target Part" })
            row:Left():TitleStack({ Title = "Target Part", Subtitle = "Which body part to aim at" })
            row:Right():RadioButtonGroup({
                Options = { "Head", "HumanoidRootPart", "Random" },
                Value = 1,
                ValueChanged = function(self, val)
                    app:Notification({
                        App = "COMBAT",
                        Title = "Target Changed",
                        Subtitle = "Now aiming at: " .. self.Options[val],
                        Duration = 2,
                    })
                end,
            })
        end
    end

    do -- Movement
        local form = mainTab:PageSection({
            Title = "Movement",
            Subtitle = "Movement features",
        }):Form()

        do
            local row = form:Row({ SearchIndex = "Fly" })
            row:Left():TitleStack({ Title = "Fly", Subtitle = "Fly around the map" })
            row:Right():Toggle({
                Value = false,
                ValueChanged = function(self, val)
                    app:Notification({
                        App = "MOVEMENT",
                        Title = "Fly " .. (val and "Enabled" or "Disabled"),
                        Subtitle = val and "Press Space to go up, Shift to go down" or "Flight disabled",
                        Icon = val and cascade.Symbols.checkmark or cascade.Symbols.xMark,
                        Duration = 3,
                    })
                end,
            })
        end

        do
            local row = form:Row({ SearchIndex = "Fly Keybind" })
            row:Left():TitleStack({ Title = "Fly Keybind" })
            row:Right():KeybindField({
                Label = "Fly",
                Value = Enum.KeyCode.F,
                OverlayKeybind = true,
                OverlayToggled = function(self, on)
                    app:Notification({
                        App = "MOVEMENT",
                        Title = "Fly " .. (on and "ON" or "OFF"),
                        Subtitle = on and "Flying via keybind — Space up, Shift down" or "Flight deactivated",
                        Icon = on and cascade.Symbols.checkmark or cascade.Symbols.xMark,
                        Duration = 3,
                    })
                end,
            })
        end

        do
            local row = form:Row({ SearchIndex = "Walk Speed" })
            row:Left():TitleStack({ Title = "Walk Speed", Subtitle = "Change walk speed" })
            row:Right():Slider({
                Minimum = 16,
                Maximum = 200,
                Value = 16,
                ValueChanged = function(self, val)
                    app:Notification({
                        App = "MOVEMENT",
                        Title = "Speed Changed",
                        Subtitle = "Walk speed set to " .. val,
                        Duration = 2,
                    })
                end,
            })
        end

        do
            local row = form:Row({ SearchIndex = "Speed Keybind" })
            row:Left():TitleStack({ Title = "Speed Keybind" })
            row:Right():KeybindField({
                Label = "Speed",
                Value = Enum.KeyCode.V,
                OverlayKeybind = true,
                OverlayToggled = function(self, on)
                    app:Notification({
                        App = "MOVEMENT",
                        Title = "Speed Boost " .. (on and "ON" or "OFF"),
                        Subtitle = on and "Speed boost activated" or "Speed boost deactivated",
                        Duration = 3,
                    })
                end,
            })
        end

        do
            local row = form:Row({ SearchIndex = "Jump Power" })
            row:Left():TitleStack({ Title = "Jump Power", Subtitle = "Custom jump height" })
            row:Right():Slider({
                Minimum = 50,
                Maximum = 500,
                Value = 50,
                ValueChanged = function(self, val) print("Jump:", val) end,
            })
        end

        do
            local row = form:Row({ SearchIndex = "Noclip" })
            row:Left():TitleStack({ Title = "Noclip", Subtitle = "Walk through walls" })
            row:Right():Toggle({
                Value = false,
                ValueChanged = function(self, val)
                    app:Notification({
                        App = "MOVEMENT",
                        Title = "Noclip " .. (val and "Enabled" or "Disabled"),
                        Subtitle = val and "You can now walk through walls" or "Noclip turned off",
                        Icon = val and cascade.Symbols.checkmark or cascade.Symbols.xMark,
                        Duration = 3,
                    })
                end,
            })
        end

        do
            local row = form:Row({ SearchIndex = "Infinite Jump" })
            row:Left():TitleStack({ Title = "Infinite Jump", Subtitle = "Jump in mid-air" })
            row:Right():Toggle({
                Value = false,
                ValueChanged = function(self, val)
                    app:Notification({
                        App = "MOVEMENT",
                        Title = "Infinite Jump " .. (val and "Enabled" or "Disabled"),
                        Subtitle = val and "You can now jump infinitely" or "Infinite jump turned off",
                        Duration = 3,
                    })
                end,
            })
        end
    end

    -- ========================================
    -- VISUALS TAB
    -- ========================================
    local visualsTab = section:Tab({
        Title = "Visuals",
        Icon = cascade.Symbols.eye,
    })

    do -- ESP
        local form = visualsTab:PageSection({
            Title = "ESP",
            Subtitle = "Player ESP settings",
        }):Form()

        do
            local row = form:Row({ SearchIndex = "ESP" })
            row:Left():TitleStack({ Title = "ESP Enabled", Subtitle = "Show players through walls" })
            row:Right():Toggle({
                Value = false,
                ValueChanged = function(self, val)
                    app:Notification({
                        App = "VISUALS",
                        Title = "ESP " .. (val and "Enabled" or "Disabled"),
                        Subtitle = val and "Players are now visible through walls" or "ESP turned off",
                        Icon = val and cascade.Symbols.checkmark or cascade.Symbols.xMark,
                        Duration = 3,
                    })
                end,
            })
        end

        do
            local row = form:Row({ SearchIndex = "ESP Keybind" })
            row:Left():TitleStack({ Title = "ESP Keybind" })
            row:Right():KeybindField({
                Label = "ESP",
                Value = Enum.KeyCode.E,
                OverlayKeybind = true,
                OverlayToggled = function(self, on)
                    app:Notification({
                        App = "VISUALS",
                        Title = "ESP " .. (on and "ON" or "OFF"),
                        Subtitle = on and "ESP activated via keybind" or "ESP deactivated",
                        Duration = 3,
                    })
                end,
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
            row:Right():Slider({
                Minimum = 100,
                Maximum = 10000,
                Value = 2000,
                ValueChanged = function(self, val) print("Render Dist:", val) end,
            })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Team Color", Subtitle = "Use team colors for ESP" })
            row:Right():Toggle({ Value = true })
        end
    end

    do -- World
        local form = visualsTab:PageSection({
            Title = "World",
            Subtitle = "World visual effects",
        }):Form()

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Fullbright", Subtitle = "Remove all darkness" })
            row:Right():Toggle({
                Value = false,
                ValueChanged = function(self, val)
                    app:Notification({
                        App = "VISUALS",
                        Title = "Fullbright " .. (val and "Enabled" or "Disabled"),
                        Subtitle = val and "All darkness removed" or "Fullbright turned off",
                        Duration = 3,
                    })
                end,
            })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "No Fog", Subtitle = "Remove fog effect" })
            row:Right():Toggle({
                Value = false,
                ValueChanged = function(self, val)
                    app:Notification({
                        App = "VISUALS",
                        Title = "No Fog " .. (val and "Enabled" or "Disabled"),
                        Subtitle = val and "Fog removed" or "Fog restored",
                        Duration = 3,
                    })
                end,
            })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Sky Color", Subtitle = "Custom sky color" })
            row:Right():Toggle({ Value = false })
        end
    end

    -- ========================================
    -- MISC TAB
    -- ========================================
    local miscTab = section:Tab({
        Title = "Misc",
        Icon = cascade.Symbols.ellipsis,
    })

    do -- Player
        local form = miscTab:PageSection({
            Title = "Player",
            Subtitle = "Player features",
        }):Form()

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "God Mode", Subtitle = "Take no damage" })
            row:Right():Toggle({
                Value = false,
                ValueChanged = function(self, val)
                    app:Notification({
                        App = "PLAYER",
                        Title = "God Mode " .. (val and "Enabled" or "Disabled"),
                        Subtitle = val and "You are now invincible!" or "God mode turned off",
                        Icon = val and cascade.Symbols.checkmark or cascade.Symbols.xMark,
                        Duration = 3,
                    })
                end,
            })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "God Mode Keybind" })
            row:Right():KeybindField({
                Label = "God Mode",
                Value = Enum.KeyCode.G,
                OverlayKeybind = true,
                OverlayToggled = function(self, on)
                    app:Notification({
                        App = "PLAYER",
                        Title = "God Mode " .. (on and "ON" or "OFF"),
                        Subtitle = on and "Invincibility activated via keybind" or "Invincibility deactivated",
                        Icon = on and cascade.Symbols.checkmark or cascade.Symbols.xMark,
                        Duration = 3,
                    })
                end,
            })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Max Health", Subtitle = "Set max health" })
            row:Right():Slider({
                Minimum = 1,
                Maximum = 1000,
                Value = 100,
                ValueChanged = function(self, val)
                    app:Notification({
                        App = "PLAYER",
                        Title = "Max Health Changed",
                        Subtitle = "Max health set to " .. val,
                        Duration = 2,
                    })
                end,
            })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Username", Subtitle = "Change display name" })
            row:Right():TextField({
                Placeholder = "Enter username...",
                Value = "",
                ValueChanged = function(self, val)
                    if val ~= "" then
                        app:Notification({
                            App = "PLAYER",
                            Title = "Username Changed",
                            Subtitle = "Display name set to: " .. val,
                            Duration = 2,
                        })
                    end
                end,
            })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Language", Subtitle = "Select language" })
            row:Right():PullDownButton({
                Label = "Language",
                Options = { "English", "Spanish", "French", "German", "Japanese" },
                Value = 1,
                ValueChanged = function(self, val)
                    app:Notification({
                        App = "PLAYER",
                        Title = "Language Changed",
                        Subtitle = "Language set to: " .. self.Options[val],
                        Duration = 2,
                    })
                end,
            })
        end
    end

    do -- Actions
        local form = miscTab:PageSection({
            Title = "Actions",
            Subtitle = "One-click actions",
        }):Form()

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Teleport", Subtitle = "Teleport to mouse position" })
            row:Right():Button({
                Label = "Teleport",
                State = "Primary",
                Pushed = function(self)
                    app:Notification({
                        App = "ACTIONS",
                        Title = "Teleported!",
                        Subtitle = "Moved to mouse position",
                        Icon = cascade.Symbols.checkmark,
                        Duration = 3,
                    })
                end,
            })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Respawn", Subtitle = "Force respawn character" })
            row:Right():Button({
                Label = "Respawn",
                State = "Secondary",
                Pushed = function(self)
                    app:Notification({
                        App = "ACTIONS",
                        Title = "Respawned!",
                        Subtitle = "Character has been respawned",
                        Icon = cascade.Symbols.checkmark,
                        Duration = 3,
                    })
                end,
            })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Destroy All", Subtitle = "Destroy all parts" })
            row:Right():Button({
                Label = "Destroy",
                State = "Destructive",
                Pushed = function(self)
                    app:Notification({
                        App = "ACTIONS",
                        Title = "Destroyed!",
                        Subtitle = "All parts have been destroyed",
                        Icon = cascade.Symbols.xMark,
                        Duration = 3,
                    })
                end,
            })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Notify", Subtitle = "Test notification" })
            row:Right():Button({
                Label = "Send",
                State = "Primary",
                Pushed = function(self)
                    app:Notification({
                        App = "CASCADE",
                        Title = "Test Notification",
                        Subtitle = "This is a test notification from Cascade!",
                        Icon = cascade.Symbols.bell,
                        Duration = 5,
                    })
                end,
            })
        end
    end

    -- ========================================
    -- UI SETTINGS TAB
    -- ========================================
    local settingsTab = section:Tab({
        Title = "UI Settings",
        Icon = cascade.Symbols.gear,
    })

    do -- Menu
        local form = settingsTab:PageSection({
            Title = "Menu",
            Subtitle = "UI options",
        }):Form()

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Keybinds Menu", Subtitle = "Show/hide keybinds panel" })
            row:Right():Toggle({
                Value = false,
                ValueChanged = function(self, value)
                    app.KeybindOverlay.SetVisible(value)
                    app:Notification({
                        App = "UI",
                        Title = "Keybinds Panel " .. (value and "Shown" or "Hidden"),
                        Subtitle = value and "Floating keybinds panel is now visible" or "Panel hidden",
                        Duration = 2,
                    })
                end,
            })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Searchable", Subtitle = "Allow searching pages" })
            row:Right():Toggle({
                Value = window.Searching,
                ValueChanged = function(self, value)
                    window.Searching = value
                end,
            })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Draggable", Subtitle = "Allow moving the window" })
            row:Right():Toggle({
                Value = window.Draggable,
                ValueChanged = function(self, value)
                    window.Draggable = value
                end,
            })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Resizable", Subtitle = "Allow resizing the window" })
            row:Right():Toggle({
                Value = window.Resizable,
                ValueChanged = function(self, value)
                    window.Resizable = value
                end,
            })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Dropshadow", Subtitle = "Window dropshadow effect" })
            row:Right():Toggle({
                Value = window.Dropshadow,
                ValueChanged = function(self, value)
                    window.Dropshadow = value
                end,
            })
        end

        do
            local row = form:Row()
            row:Left():TitleStack({ Title = "Background Blur", Subtitle = "Blur behind sidebar" })
            row:Right():Toggle({
                Value = window.UIBlur,
                ValueChanged = function(self, value)
                    window.UIBlur = value
                end,
            })
        end
    end

    print("Cascade Demo loaded! RightControl = toggle menu")
end)

if not ok then
    warn("Error: " .. tostring(err))
end
