local NoteTests = {}

NoteTests.noteClass = nil

NoteTests.new = function(self, noteClass)
  local object = {}
  setmetatable(object, self)
  self.__index = self
  object.noteClass = noteClass
  return object
end

NoteTests.assertSetAliveState = function(self)
  return false
end

NoteTests.assertGetHitTime = function(self)
  return false
end

NoteTests.assertGetAliveState = function(self)
  return false
end

return NoteTests
