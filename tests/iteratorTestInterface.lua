local IteratorTests = {}

IteratorTests.iteratorClass = nil

IteratorTests.new = function(self, iteratorClass)
  local object = {}
  setmetatable(object, self)
  self.__index = self
  object.iteratorClass = iteratorClass
  return object
end

IteratorTests.assureHasNext = function(self) end

IteratorTests.assureSeek = function(self) end

IteratorTests.assureNext = function(self) end

return IteratorTests
