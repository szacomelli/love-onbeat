local Iterator = {}
Iterator.__index = Iterator

Iterator.itemList = nil
Iterator.currentItem = nil

Iterator.peek = function(self) end

Iterator.hasNext = function(self) end

Iterator.next = function(self) end

return Iterator
