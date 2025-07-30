local IteratorTests = require "tests.iteratorTestInterface"
local iteratorClass = require "simpleIterator"
local SimpleNote = require "simpleNote"

local SimpleIteratorTests = IteratorTests:new(iteratorClass)

SimpleIteratorTests.assertHasNext = function(self)
  local notes = {
    SimpleNote:new(2),
    SimpleNote:new(48),
    SimpleNote:new(123)
  }
  local iterator = self.iteratorClass:new(notes)
  assert(iterator:hasNext() == true, "error in assertHasNext")

  iterator.currentItem = 3
  assert(iterator:hasNext() == false, "error in assertHasNext")

  iterator = self.iteratorClass:new({})
  assert(iterator:hasNext() == false, "error in assertHasNext")

  return true
end

SimpleIteratorTests.assertSeek = function(self)
  local notes = {
    SimpleNote:new(2),
    SimpleNote:new(48),
    SimpleNote:new(123)
  }
  local iterator = self.iteratorClass:new(notes)
  assert(iterator:peek() == notes[1], "error in assertSeek")

  iterator.currentItem = 2
  assert(iterator:peek() == notes[3], "error in assertSeek")

  iterator.currentItem = 3
  assert(iterator:peek() == nil, "error in assertSeek")

  iterator = self.iteratorClass:new({})
  assert(iterator:peek() == nil, "error in assertSeek")

  return true
end

SimpleIteratorTests.assertNext = function(self)
  local notes = {
    SimpleNote:new(2),
    SimpleNote:new(48),
    SimpleNote:new(123)
  }
  local iterator = self.iteratorClass:new(notes)
  assert(iterator:next() == notes[1], "error in assertNext")
  assert(iterator:next() == notes[2], "error in assertNext")
  assert(iterator:next() == notes[3], "error in assertNext")
  if pcall(function() iterator:next() end) then error("error in assertNext") end

  iterator = iteratorClass:new({})
  if pcall(function() iterator:next() end) then error("error in assertNext") end

  return true
end

SimpleIteratorTests.assertProperCreation = function(self)
  local notes = {
    SimpleNote:new(2),
    SimpleNote:new(48),
    SimpleNote:new(123)
  }
  local iterator = self.iteratorClass:new(notes)
  assert(iterator.currentItem == 0, "error in assertProperCreation")
  assert(iterator.itemList == notes, "error in assertProperCreation")
  assert(#iterator.itemList == 3, "error in assertProperCreation")

  iterator = self.iteratorClass:new({})
  assert(iterator.currentItem == 0, "error in assertProperCreation")
  assert(#iterator.itemList == 0, "error in assertProperCreation")

  return true
end

SimpleIteratorTests:assertProperCreation()
SimpleIteratorTests:assertHasNext()
SimpleIteratorTests:assertSeek()
SimpleIteratorTests:assertNext()

print("all tests passed")

return SimpleIteratorTests
