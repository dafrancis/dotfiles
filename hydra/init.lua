require "grid"
hydra.douserfile("menuconfig")
hydra.douserfile("donate")

notify.show("Hydra", "Started!", "", "")

-- pathwatcher.new(os.getenv("HOME") .. "/.hydra/", hydra.reload):start()
autolaunch.set(true)

local ctrlcmd = {"ctrl", "cmd"}
local ctrlaltcmd = {"ctrl", "alt", "cmd"}

-- open a repl
hotkey.bind(ctrlaltcmd, "R", repl.open)

-- Full screen
hotkey.bind(ctrlaltcmd, 'F', ext.grid.fullscreen)

-- Half screens
hotkey.bind(ctrlaltcmd, 'left', ext.grid.lefthalf)
hotkey.bind(ctrlaltcmd, 'right', ext.grid.righthalf)
hotkey.bind(ctrlaltcmd, 'up', ext.grid.tophalf)
hotkey.bind(ctrlaltcmd, 'down', ext.grid.bottomhalf)

-- Push to other screen
hotkey.bind(ctrlaltcmd, 'P', ext.grid.pushwindow)

-- Corners
hotkey.bind(ctrlaltcmd, 'PAD7', ext.grid.topleft)
hotkey.bind(ctrlaltcmd, 'PAD1', ext.grid.bottomleft)
hotkey.bind(ctrlaltcmd, 'PAD9', ext.grid.topright)
hotkey.bind(ctrlaltcmd, 'PAD3', ext.grid.bottomright)
