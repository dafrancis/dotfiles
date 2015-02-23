local application = require "mjolnir.application"
local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"
local fnutils = require "mjolnir.fnutils"
local grid = require "grid"

local mash = {"cmd", "alt", "ctrl"}

function move_window(x, y)
  return function()
    local win = window.focusedwindow()
    local f = win:frame()
    f.x = f.x + x
    f.y = f.y + y
    win:setframe(f)
  end
end

hotkey.bind(mash, "W", move_window(0, -10))
hotkey.bind(mash, "A", move_window(-10, 0))
hotkey.bind(mash, "S", move_window(0, 10))
hotkey.bind(mash, "D", move_window(10, 0))

-- open a repl
-- hotkey.bind(mash, "R", repl.open)

-- Full screen
hotkey.bind(mash, 'F', grid.fullscreen)

-- Half screens
hotkey.bind(mash, 'left', grid.lefthalf)
hotkey.bind(mash, 'right', grid.righthalf)
hotkey.bind(mash, 'up', grid.tophalf)
hotkey.bind(mash, 'down', grid.bottomhalf)

-- Push to other screen
hotkey.bind(mash, 'P', grid.pushwindow)

-- Corners
hotkey.bind(mash, 'PAD7', grid.topleft)
hotkey.bind(mash, 'PAD1', grid.bottomleft)
hotkey.bind(mash, 'PAD9', grid.topright)
hotkey.bind(mash, 'PAD3', grid.bottomright)
