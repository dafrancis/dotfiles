require "handofgod"
require "donate"
hydra.douserfile("updateconfig")

-- show a helpful menu
menu.show(function()
    local updatetitles = {
      [true] = "Install Update",
      [false] = "Check for Update..."
    }
    local updatefns = {[true] = updates.install, [false] = checkforupdates}
    local hasupdate = (updates.newversion ~= nil)

    return {
      {title = "Reload Config", fn = hydra.reload},
      {title = "handofg0d", fn = ext.handofgod},
      {title = "-"},
      {title = "About", fn = hydra.showabout},
      {title = "Donate", fn = ext.donate},
      {title = updatetitles[hasupdate], fn = updatefns[hasupdate]},
      {title = "Quit Hydra", fn = os.exit},
    }
end)

