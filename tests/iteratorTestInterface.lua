local IteratorTests = {}

IteratorTests.iteratorClass = nil

IteratorTests.new = function(self, iteratorClass)
  local object = {}
  setmetatable(object, self)
  self.__index = self
  object.iteratorClass = iteratorClass
  return object
end

IteratorTests.assertHasNext = function(self) end

IteratorTests.assertSeek = function(self) end

IteratorTests.assertNext = function(self) end

return IteratorTests
