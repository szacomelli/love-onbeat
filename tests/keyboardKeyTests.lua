local KeyTests = require "tests.keyTestInterface"
local keyboardKey = require "keyboardKey"

local keyboardKeyTests = KeyTests:new(keyboardKey)

keyboardKeyTests.assertGetControllerKey = function(self)
  local key = self.keyClass:new("a")
  assert(key:getControllerKey() == "a", "error in assertGetControllerKey")

  key = self.keyClass:new("{")
  assert(key:getControllerKey() == "{", "error in assertGetControllerKey")

  return true
end

keyboardKeyTests.assertSetIsKeyPressed = function(self)
  local key = self.keyClass:new("a")
  assert(key.isKeyPressed == false, "error in assertSetIsKeyPressed")

  key:setIsKeyPressed(true)
  assert(key.isKeyPressed == true, "error in assertSetIsKeyPressed")

  key:setIsKeyPressed(false)
  assert(key.isKeyPressed == false, "error in assertSetIsKeyPressed")

  return true
end

keyboardKeyTests.assertGetIsKeyPressed = function(self)
  local key = self.keyClass:new("a")
  assert(key:getIsKeyPressed() == false, "error in assertGetKeyPressed")

  key:setIsKeyPressed(true)
  assert(key:getIsKeyPressed() == true, "error in assertSetIsKeyPressed")

  key:setIsKeyPressed(false)
  assert(key:getIsKeyPressed() == false, "error in assertSetIsKeyPressed")

  return true
end

keyboardKeyTests.assertProperCreation = function(self)
  local key = self.keyClass:new("a")

  assert(key.isKeyPressed == false)
  assert(key.currentControllerKey == "a")

  local key = self.keyClass:new("{")

  assert(key.isKeyPressed == false)
  assert(key.currentControllerKey == "{")

  return true
end

keyboardKeyTests:assertProperCreation()
keyboardKeyTests:assertSetIsKeyPressed()
keyboardKeyTests:assertGetIsKeyPressed()
keyboardKeyTests:assertGetControllerKey()

print("all tests passed")

return keyboardKeyTests
