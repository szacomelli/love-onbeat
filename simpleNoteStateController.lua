local SimpleNoteStateController = {}
local NoteStateControllerInterface = require "noteStateControllerInterface"
setmetatable(SimpleNoteStateController, NoteStateControllerInterface)
SimpleNoteStateController.noteClass = require "simpleNote"

local function inTimeBoundsDecider(currTime, gap, noteTime)
  local epsilon = 2.2e-10
  return currTime - gap - epsilon<= noteTime and currTime + gap + epsilon >= noteTime
end

SimpleNoteStateController.decideStateChange = function(self, note, currentTime, timeGapTolerance, isKeyHeld)
  if isKeyHeld then return false
  elseif note:getAliveState() == false then return false
  elseif inTimeBoundsDecider(currentTime, timeGapTolerance, note:getHitTime()) then
      note:setAliveState(false)
      return true
  else
    return false
  end
end



return SimpleNoteStateController
