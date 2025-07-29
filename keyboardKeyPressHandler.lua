local KeyPressHandler = require "keyPressHandlerInterface"
local KeyboardKeyPressHandler = {}
setmetatable(KeyboardKeyPressHandler, KeyPressHandler)

KeyboardKeyPressHandler.new = function(self, keyboardKeyObject)
  local object = {}
  setmetatable(object, self)
  self.__index = self
  object.key = keyboardKeyObject
  object.isKeyHeld = false
  return object
end

KeyboardKeyPressHandler.pressKey = function(self, keyCharacter)
  if self:getCurrentControllerKey() == keyCharacter then
    if self:getIsKeyPressed() then
      self:setIsKeyHeld(true)
      return false
    else
      self.key:setIsKeyPressed(true)
      return true
    end
  else
    return false
  end
end

KeyboardKeyPressHandler.releaseKey = function(self, keyCharacter)
  if self:getCurrentControllerKey() == keyCharacter then
    if self:getIsKeyPressed() then
      self:setIsKeyHeld(false)
      self.key:setIsKeyPressed(false)
      return true
    end
  end
  return false
end

KeyboardKeyPressHandler.getCurrentControllerKey = function(self)
  return self.key:getControllerKey()
end

KeyboardKeyPressHandler.getIsKeyPressed = function(self)
  return self.key:getIsKeyPressed()
end

KeyboardKeyPressHandler.getIsKeyHeld = function(self)
  return self.isKeyHeld
end

KeyboardKeyPressHandler.setIsKeyHeld = function(self, isHeld)
  local isHeldTypeAssertion = type(isHeld) == "boolean"
  assert(isHeldTypeAssertion, "in setIsKeyHeld: isHeld is of type" .. type(isHeld))

  self.isKeyHeld = isHeld
end

return KeyboardKeyPressHandler
