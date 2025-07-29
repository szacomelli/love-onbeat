local Key = require "keyInterface"

local KeyboardKey = {}
setmetatable(KeyboardKey, Key)

KeyboardKey.new = function(self, keyboardKeyCharacter)
  local keyCharacterTypeAssertion = type(keyboardKeyCharacter) == "string"
  assert(keyCharacterTypeAssertion, "in new: keyCharacter is " .. type(keyboardKeyCharacter))

  local object = {}
  setmetatable(object, self)
  self.__index = self
  object.currentControllerKey = keyboardKeyCharacter
  object.isKeyPressed = false
  return object
end

KeyboardKey.getControllerKey = function(self)
  return self.currentControllerKey
end

KeyboardKey.getIsKeyPressed = function(self)
  return self.isKeyPressed
end

KeyboardKey.setIsKeyPressed = function(self, isPressed)
  local isPressedTypeAssertion = type(isPressed) == "boolean"
  assert(isPressedTypeAssertion, "in setIsKeyPressed: type of isPressed is " .. type(isPressed))

  self.isKeyPressed = isPressed
end

return KeyboardKey
