local IteratorInterface = require "iteratorInterface"
local SimpleIterator = {}
setmetatable(SimpleIterator, IteratorInterface)

SimpleIterator.new = function(self, noteList)
  local object = {}
  setmetatable(object, self)
  self.__index = self
  object.itemList = noteList
  object.currentItem = 0
  return object
end

SimpleIterator.peek = function(self)
  if self:hasNext() then
    return self.itemList[self.currentItem + 1]
  else
    return nil
  end
end

SimpleIterator.hasNext = function(self)
  if self.currentItem < #self.itemList then
    return true
  else
    return false
  end
end

SimpleIterator.next = function(self)
  if self:hasNext() then
    self.currentItem = self.currentItem + 1
    return self.itemList[self.currentItem]
  else
    error("noteIterator tried to reach out of bounds")
  end
end

return SimpleIterator
