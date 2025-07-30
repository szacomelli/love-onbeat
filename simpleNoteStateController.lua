local SimpleNoteStateController = {}
local NoteStateControllerInterface = require "noteStateControllerInterface"
setmetatable(SimpleNoteStateController, NoteStateController)
SimpleNoteStateController.noteClass = require "simpleNote"

SimpleNoteStateController.decideStateChange = function(self, note, currentTime, timeGapTolerance, isKeyHeld)
  if isKeyHeld then return false
  elseif inTimeBoundsDecider(currentTime, timeGapTolerance, note:getHitTime()) then
      note:setAliveState(false)
      return true
  else
    return false
  end
end

local function inTimeBoundsDecider(currTime, gap, noteTime)
  return currTime - gap <= noteTime and currTime + gap >= noteTime
end

return SimpleNoteStateController
