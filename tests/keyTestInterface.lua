local KeyTests = {}

KeyTests.keyClass = nil

KeyTests.new = function(self, keyClass)
  local object = {}
  setmetatable(object, self)
  self.__index = self
  object.keyClass = keyClass
  return object
end

KeyTests.assertGetControllerKey = function(self)
  return false
end

KeyTests.assertSetIsKeyPressed = function(self)
  return false
end

KeyTests.assertGetIsKeyPressed = function(self)
  return false
end

return KeyTests
