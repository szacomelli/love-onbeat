local NoteStateControllerTestInterface = require "tests.noteStateControllerTestInterface"
local SimpleNoteStateController = require "simpleNoteStateController"
local SimpleNoteStateControllerTests = NoteStateControllerTestInterface:new(SimpleNoteStateController)
local SimpleNote = require "simpleNote"

SimpleNoteStateControllerTests.assertDecideStateChange = function(self)
  local function fastRun(note, currTime, timeGap, isKeyHeld)
    return self.stateControllerClass:decideStateChange(note, currTime, timeGap, isKeyHeld)
  end

  local note, currTime, timeGap, isKeyHeld = SimpleNote:new(45.3), 45, 0.3, true
  note:setAliveState(true)
  assert(
    fastRun(note, currTime, timeGap, isKeyHeld) == false,
    "error in assertDecideStateChange"
  )
  assert(
    note:getAliveState() == true,
    "error in assertDecideStateChange"
  )

  isKeyHeld = false
  assert(
    fastRun(note, currTime, timeGap, isKeyHeld) == true,
    "error in assertDecideStateChange"
  )
  assert(
    note:getAliveState() == false,
    "error in assertDecideStateChange"
  )
  note:setAliveState(true)

  currTime = 44.9
  assert(
    fastRun(note, currTime, timeGap, isKeyHeld) == false,
    "error in assertDecideStateChange"
  )
  assert(
    note:getAliveState() == true,
    "error in assertDecideStateChange"
  )

  currTime, timeGap = 45.3, 0
  assert(
    fastRun(note, currTime, timeGap, isKeyHeld) == true,
    "error in assertDecideStateChange"
  )
  assert(
    note:getAliveState() == false,
    "error in assertDecideStateChange"
  )
  note:setAliveState(true)

  currTime, timeGap = 45.6, 0.3
  assert(
    fastRun(note, currTime, timeGap, isKeyHeld) == true,
    "error in assertDecideStateChange"
  )
  assert(
    note:getAliveState() == false,
    "error in assertDecideStateChange"
  )
  note:setAliveState(true)

  currTime = 45.7
  assert(
    fastRun(note, currTime, timeGap, isKeyHeld) == false,
    "error in assertDecideStateChange"
  )
  assert(
    note:getAliveState() == true,
    "error in assertDecideStateChange"
  )

  currTime = 45.6
  note:setAliveState(false)
  assert(
    fastRun(note, currTime, timeGap, isKeyHeld) == false,
    "error in assertDecideStateChange"
  )
  assert(
    note:getAliveState() == false,
    "error in assertDecideStateChange"
  )

  return true
end

SimpleNoteStateControllerTests:assertDecideStateChange()

print("all tests passed")

return SimpleNoteStateControllerTests
