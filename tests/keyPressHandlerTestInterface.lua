local KeyPressHandlerTests = {}

KeyPressHandlerTests.keyPressHandlerClass = nil

KeyPressHandlerTests.new = function(self, keyPressHandlerClass)
  local object = {}
  setmetatable(object, self)
  self.__index = self
  object.keyPressHandlerClass = keyPressHandlerClass
  return object
end

KeyPressHandlerTests.assertGetIsKeyPressed = function(self) end

KeyPressHandlerTests.assertGetCurrentControllerKey = function(self) end

KeyPressHandlerTests.assertGetIsKeyHeld = function(self) end

KeyPressHandlerTests.assertSetIsKeyHeld = function(self) end

KeyPressHandlerTests.assertPressKey = function(self) end

KeyPressHandlerTests.assertReleaseKey = function(self) end

return KeyPressHandlerTests
