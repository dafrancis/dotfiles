local window = require "mjolnir.window"
local libgrid = require "mjolnir.bg.grid"

local grid = {}

function grid.fullscreen()
  local win = window.focusedwindow()
  local f = win:screen():frame()

  win:setframe(f)
end

function grid.lefthalf()
  local win = window.focusedwindow()
  local f = win:screen():frame()

  f.w = f.w / 2

  win:setframe(f)
end

function grid.righthalf()
  local win = window.focusedwindow()
  local f = win:screen():frame()

  f.w = f.w / 2
  f.x = f.x + f.w

  win:setframe(f)
end

function grid.tophalf()
  local win = window.focusedwindow()
  local f = win:screen():frame()

  f.h = f.h / 2

  win:setframe(f)
end

function grid.bottomhalf()
  local win = window.focusedwindow()
  local f = win:screen():frame()

  f.h = f.h / 2
  f.y = f.y + f.h

  win:setframe(f)
end

function grid.topleft()
  local win = window.focusedwindow()
  local f = win:screen():frame()

  f.w = f.w / 2
  f.h = f.h / 2

  win:setframe(f)
end

function grid.bottomleft()
  local win = window.focusedwindow()
  local f = win:screen():frame()

  f.w = f.w / 2
  f.h = f.h / 2
  f.y = f.y + f.h

  win:setframe(f)
end

function grid.topright()
  local win = window.focusedwindow()
  local f = win:screen():frame()

  f.w = f.w / 2
  f.h = f.h / 2
  f.x = f.x + f.w

  win:setframe(f)
end

function grid.bottomright()
  local win = window.focusedwindow()
  local f = win:screen():frame()

  f.w = f.w / 2
  f.h = f.h / 2
  f.x = f.x + f.w
  f.y = f.y + f.h

  win:setframe(f)
end

function grid.pushwindow()
  local win = window.focusedwindow()
  libgrid.set(win, libgrid.get(win), win:screen():next())
  grid.fullscreen()
end

return grid
