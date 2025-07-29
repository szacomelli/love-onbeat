local NoteTests = require "tests.noteTestInterface"
local simpleNote = require "simpleNote"

local simpleNoteTests = NoteTests:new(simpleNote)

simpleNoteTests.assertSetAliveState = function(self)
  local note = self.noteClass:new(0)
  assert(note.aliveState == false, "error in assertSetAliveState")
  note:setAliveState(true)
  assert(note.aliveState == true, "error in assertSetAliveState")
  note:setAliveState(false)
  assert(note.aliveState == false, "error in assertSetAliveState")
  return true
end

simpleNoteTests.assertGetHitTime = function(self)
  local note = self.noteClass:new(48.67)
  assert(note:getHitTime() == 48.67, "error in assertGetHitTime")

  local note = self.noteClass:new(2)
  assert(note:getHitTime() == 2, "error in assertGetHitTime")

  return true
end

simpleNoteTests.assertGetAliveState = function(self)
  local note = self.noteClass:new(0)
  assert(note:getAliveState() == false, "error in assertGetHitTime")

  note:setAliveState(true)
  assert(note:getAliveState() == true, "error in assertGetHitTime")

  note:setAliveState(false)
  assert(note:getAliveState() == false, "error in assertGetHitTime")

  return true
end

simpleNoteTests.assertProperCreation = function(self)
  local note = self.noteClass:new(5)

  assert(note.aliveState == false)
  assert(note.hitTime == 5)

  local note = self.noteClass:new(456.87)

  assert(note.aliveState == false)
  assert(note.hitTime == 456.87)

end

simpleNoteTests:assertProperCreation()
simpleNoteTests:assertGetHitTime()
simpleNoteTests:assertSetAliveState()
simpleNoteTests:assertGetAliveState()


print("all tests passed")
