local KeyboardHitCalculator = {}
local HitCalculatorInterface = require "hitCalculatorInterface"
setmetatable(KeyboardHitCalculator, hitCalculatorInterface)
local SimpleIterator = require "simpleIterator"

KeyboardHitCalculator.new = function(self, keyboardKeyPressHandler, noteList, noteStateControllers)
  if noteList == {} or noteList == nil then
    error("in new: noteList is nil or empty: noteList " .. tostring(noteList))
  elseif not keyboardKeyPressHandler or not noteStateControllers then
    error("in new: one or more arguments are nil")
  end
  local object = {}
  setmetatable(object, self)
  self.__index = self
  object.noteList = noteList
  object.keyPressHandler = keyboardKeyPressHandler
  object.noteStateControllers = noteStateControllers
  return object
end

KeyboardHitCalculator.calculateHit = function(self, pressedKeyCharacter, currentTime, timeGapTolerance)
  if currentTime < 0 or timeGapTolerance < 0 or type(pressedKeyCharacter) ~= "string" then
    error("in calculateHit: TypeError")
  elseif not self.keyPressHandler:getIsKeyPressed(pressedKeyCharacter) then
    return false
  end

  local iterator = SimpleIterator:new(self.noteList)
  while iterator:hasNext() do
    local nextNote = iterator:next()
    if nextNote:getAliveState() then
      local result = self:delegateToStateController(nextNote, currentTime, timeGapTolerance)
      if result then return true end
    end
  end
  return false
end

KeyboardHitCalculator.delegateToStateController = function(self, note, currentTime, timeGapTolerance)
  for i, stateController in ipairs(self.noteStateControllers) do
    if getmetatable(note) == stateController.noteClass then
      local isKeyHeld = self.keyPressHandler:getIsKeyHeld()
      local result = stateController:decideStateChange(note, currentTime, timeGapTolerance, isKeyHeld)
      return result
    end
  end
  error("in decideStateController: noteStateController for note not found")
end

return KeyboardHitCalculator
