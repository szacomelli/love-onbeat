local KeyboardHitCalculator = {}
local HitCalculatorInterface = require "hitCalculatorInterface"
setmetatable(KeyboardHitCalculator, hitCalculatorInterface)
local SimpleIterator = require "simpleIterator"

KeyboardHitCalculator.new = function(self, keyboardKeyPressHandler, noteList, noteStateControllers)
  local object = {}
  setmetatable(object, self)
  self.__index = self
  object.noteList = noteList
  object.keyPressHandler = keyboardKeyPressHandler
  object.noteStateControllers = noteStateControllers
  return object
end

KeyboardHitCalculator.calculateHit = function(self, pressedKeyCharacter, currentTime, timeGapTolerance)
  if ~self.keyPressHandler:getIsKeyPressed() then return false end

  local iterator = SimpleIterator:new(self.noteList)
  while iterator:hasNext() do
    local nextNote = iterator:next()
    if nextNote:getAliveState() then
      local result = self:decideStateController(note, currentTime, timeGapTolerance)
      if result then return true end
    end
  end
  return false
end

KeyboardHitCalculator.decideStateController = function(self, note, currentTime, timeGapTolerance)
  for i, stateController in ipairs(self.noteStateControllers) do
    if getmetatable(note) == stateController.noteClass then
      local isKeyHeld = self.keyPressHandler:getIsKeyHeld()
      return stateController(note, currentTime, timeGapTolerance, isKeyHeld)
    end
  end
  error("in decideStateController: noteStateController for note not found")
end

return KeyboardHitCalculator
