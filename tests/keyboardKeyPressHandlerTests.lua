local KeyPressHandlerTests = require "tests.keyPressHandlerTestInterface"
local kbKey = require "keyboardKey"
local KeyboardKeyPressHandler = require "keyboardKeyPressHandler"

local KeyboardKeyPressHandlerTests = KeyPressHandlerTests:new(KeyboardKeyPressHandler)

KeyboardKeyPressHandlerTests.assertGetIsKeyPressed = function(self)
  local key = kbKey:new("a")
  local pressHandler = self.keyPressHandlerClass:new(key)
  assert(pressHandler:getIsKeyPressed() == false, "error in assertGetIsKeyPressed")

  key:setIsKeyPressed(true)
  assert(pressHandler:getIsKeyPressed() == true, "error in assertGetIsKeyPressed")

  key:setIsKeyPressed(false)
  assert(pressHandler:getIsKeyPressed() == false, "error in assertGetIsKeyPressed")

  return true
end

KeyboardKeyPressHandlerTests.assertGetCurrentControllerKey = function(self)
  local key = kbKey:new("a")
  local pressHandler = self.keyPressHandlerClass:new(key)
  assert(pressHandler:getCurrentControllerKey() == "a", "error in assertGetCurrentControllerKey")

  key = kbKey:new("}")
  pressHandler = self.keyPressHandlerClass:new(key)
  assert(pressHandler:getCurrentControllerKey() == "}", "error in assertGetCurrentControllerKey")

  return true
end

KeyboardKeyPressHandlerTests.assertSetIsKeyHeld = function(self)
  local key = kbKey:new("a")
  local pressHandler = self.keyPressHandlerClass:new(key)
  assert(pressHandler.isKeyHeld == false, "error in assertSetIsKeyHeld")

  pressHandler:setIsKeyHeld(true)
  assert(pressHandler.isKeyHeld == true, "error in assertSetIsKeyHeld")

  pressHandler:setIsKeyHeld(false)
  assert(pressHandler.isKeyHeld == false, "error in assertSetIsKeyHeld")

  return true
end

KeyboardKeyPressHandlerTests.assertGetIsKeyHeld = function(self)
  local key = kbKey:new("a")
  local pressHandler = self.keyPressHandlerClass:new(key)
  assert(pressHandler:getIsKeyHeld() == false, "error in assertGetIsKeyHeld")

  pressHandler:setIsKeyHeld(true)
  assert(pressHandler:getIsKeyHeld() == true, "error in assertGetIsKeyHeld")

  pressHandler:setIsKeyHeld(false)
  assert(pressHandler:getIsKeyHeld() == false, "error in assertGetIsKeyHeld")

  return true
end

KeyboardKeyPressHandlerTests.assertPressKey = function(self)
  local key = kbKey:new("a")
  local pressHandler = self.keyPressHandlerClass:new(key)
  assert(pressHandler:getIsKeyHeld() == false, "error in assertPressKey")
  assert(pressHandler:getIsKeyPressed() == false, "error in assertPressKey")

  pressHandler:pressKey("d")
  assert(pressHandler:getIsKeyHeld() == false, "error in assertPressKey")
  assert(pressHandler:getIsKeyPressed() == false, "error in assertPressKey")

  pressHandler:pressKey("a")
  assert(pressHandler:getIsKeyHeld() == false, "error in assertPressKey")
  assert(pressHandler:getIsKeyPressed() == true, "error in assertPressKey")

  pressHandler:pressKey("d")
  assert(pressHandler:getIsKeyHeld() == false, "error in assertPressKey")
  assert(pressHandler:getIsKeyPressed() == true, "error in assertPressKey")

  pressHandler:pressKey("a")
  assert(pressHandler:getIsKeyHeld() == true, "error in assertPressKey")
  assert(pressHandler:getIsKeyPressed() == true, "error in assertPressKey")

  pressHandler:pressKey("d")
  assert(pressHandler:getIsKeyHeld() == true, "error in assertPressKey")
  assert(pressHandler:getIsKeyPressed() == true, "error in assertPressKey")

  return true
end

KeyboardKeyPressHandlerTests.assertReleaseKey = function(self)
  local key = kbKey:new("a")
  local pressHandler = self.keyPressHandlerClass:new(key)
  pressHandler:pressKey("a")
  assert(pressHandler:getIsKeyHeld() == false, "error in assertReleaseKey")
  assert(pressHandler:getIsKeyPressed() == true, "error in assertReleaseKey")

  pressHandler:releaseKey("d")
  assert(pressHandler:getIsKeyHeld() == false, "error in assertReleaseKey")
  assert(pressHandler:getIsKeyPressed() == true, "error in assertReleaseKey")

  pressHandler:releaseKey("a")
  assert(pressHandler:getIsKeyHeld() == false, "error in assertReleaseKey")
  assert(pressHandler:getIsKeyPressed() == false, "error in assertReleaseKey")

  pressHandler:releaseKey("d")
  assert(pressHandler:getIsKeyHeld() == false, "error in assertReleaseKey")
  assert(pressHandler:getIsKeyPressed() == false, "error in assertReleaseKey")

  pressHandler:pressKey("a")
  pressHandler:pressKey("a")

  pressHandler:releaseKey("d")
  assert(pressHandler:getIsKeyHeld() == true, "error in assertReleaseKey")
  assert(pressHandler:getIsKeyPressed() == true, "error in assertReleaseKey")

  pressHandler:releaseKey("a")
  assert(pressHandler:getIsKeyHeld() == false, "error in assertReleaseKey")
  assert(pressHandler:getIsKeyPressed() == false, "error in assertReleaseKey")

  return true
end

KeyboardKeyPressHandlerTests.assertProperCreation = function(self)
  local key = kbKey:new("a")
  local pressHandler = self.keyPressHandlerClass:new(key)

  assert(pressHandler.key == key, "error in assertProperCreation")
  assert(pressHandler.isKeyHeld == false, "error in assertProperCreation")

  return true
end

KeyboardKeyPressHandlerTests:assertProperCreation()
KeyboardKeyPressHandlerTests:assertSetIsKeyHeld()
KeyboardKeyPressHandlerTests:assertGetIsKeyHeld()
KeyboardKeyPressHandlerTests:assertGetIsKeyPressed()
KeyboardKeyPressHandlerTests:assertGetCurrentControllerKey()
KeyboardKeyPressHandlerTests:assertPressKey()
KeyboardKeyPressHandlerTests:assertReleaseKey()

print("all tests passed")

return KeyboardKeyPressHandlerTests
