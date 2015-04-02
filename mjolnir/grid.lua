local window = require "mjolnir.window"
local libgrid = require "mjolnir.bg.grid"

local grid = {}

function grid.tile(pos)
  return function()
    local win = window.focusedwindow()
    local f = win:screen():frame()

    if not win then
      return
    end

    if string.match(pos, "L") or string.match(pos, "R") then
      f.w = f.w / 2
      if string.match(pos, "R") then
        f.x = f.x + f.w
      end
    end

    if string.match(pos, "T") or string.match(pos, "B") then
      f.h = f.h / 2
      if string.match(pos, "B") then
        f.y = f.y + f.h
      end
    end

    win:setframe(f)
  end
end

grid.fullscreen = grid.tile("F")

grid.lefthalf = grid.tile("L")
grid.righthalf = grid.tile("R")
grid.tophalf = grid.tile("T")
grid.bottomhalf = grid.tile("B")

grid.topleft = grid.tile("TL")
grid.bottomleft = grid.tile("BL")
grid.topright = grid.tile("TR")
grid.bottomright = grid.tile("BR")

function grid.pushwindow()
  local win = window.focusedwindow()
  libgrid.set(win, libgrid.get(win), win:screen():next())
  grid.fullscreen()
end

return grid
