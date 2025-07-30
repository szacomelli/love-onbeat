local HitCalculatorTestInterface = require "tests.hitCalculatorTestInterface"
local KeyboardHitCalculator = require "keyboardHitCalculator"
local KeyboardHitCalculatorTests = HitCalculatorTestInterface:new(KeyboardHitCalculator)

local SimpleNote = require "simpleNote"
local KeyboardKey = require "keyboardKey"
local KeyboardKeyPressHandler = require "keyboardKeyPressHandler"
local test = require "simpleNoteStateController"
local noteStateControllers = {test}

KeyboardHitCalculatorTests.assertCalculateHit = function(self)
  local noteList = {
    SimpleNote:new(44.3),
    SimpleNote:new(45),
    SimpleNote:new(46),
    SimpleNote:new(46.999),
    SimpleNote:new(47.2980457),
    SimpleNote:new(1800.2351)
  }
  for _, note in ipairs(noteList) do
    note:setAliveState(true)
  end
  local pressHandler = KeyboardKeyPressHandler:new(KeyboardKey:new("a"))
  local hitCalculator = self.hitCalculatorClass:new(pressHandler, noteList, noteStateControllers)

  local pressedKey, currTime, timeGap = "[", 44, 0.3
  assert(
    hitCalculator:calculateHit(pressedKey, currTime, timeGap) == false,
    "error in assertCalculateHit"
  )

  pressedKey = "a"
  assert(
    hitCalculator:calculateHit(pressedKey, currTime, timeGap) == false,
    "error in assertCalculateHit"
  )

  pressHandler:pressKey("a")
  assert(
    hitCalculator:calculateHit(pressedKey, currTime, timeGap) == true,
    "error in assertCalculateHit"
  )

  currTime = 40
  assert(
    hitCalculator:calculateHit(pressedKey, currTime, timeGap) == false,
    "error in assertCalculateHit"
  )

  currTime, timeGap = 45, 0
  assert(
    hitCalculator:calculateHit(pressedKey, currTime, timeGap) == true,
    "error in assertCalculateHit"
  )

  currTime, timeGap = 46, 1
  assert(
    hitCalculator:calculateHit(pressedKey, currTime, timeGap) == true,
    "error in assertCalculateHit"
  )
  assert(
    noteList[3]:getAliveState() == false and noteList[4]:getAliveState() == true,
    "error in assertCalculateHit"
  )

  currTime = -1
  if pcall(function() hitCalculator:calculateHit(pressedKey, currTime, timeGap) end) then
    error("error in assertCalculateHit")
  end

  currTime, timeGap = 50, -1
  if pcall(function() hitCalculator:calculateHit(pressedKey, currTime, timeGap) end) then
    error("error in assertCalculateHit")
  end

  hitCalculator.noteList = {}
  currTime, timeGap = 50, 50
  assert(
    hitCalculator:calculateHit(pressedKey, currTime, timeGap) == false,
    "error in assertCalculateHit"
  )

  return true
end

KeyboardHitCalculatorTests.assertDelegateToStateController = function(self)
  local noteList = {
    SimpleNote:new(44.3),
    SimpleNote:new(45),
    SimpleNote:new(46),
    SimpleNote:new(46.999),
    SimpleNote:new(47.2980457),
    SimpleNote:new(1800.2351)
  }
  for _, note in ipairs(noteList) do
    note:setAliveState(true)
  end
  local pressHandler = KeyboardKeyPressHandler:new(KeyboardKey:new("a"))
  local hitCalculator = self.hitCalculatorClass:new(pressHandler, noteList, noteStateControllers)

  local note, currTime, timeGap = noteList[1], 44, 0.2
  assert(
    hitCalculator:delegateToStateController(note, currTime, timeGap) == false,
    "error in assertDelegateToStateController"
  )

  timeGap = 0.3
  assert(
    hitCalculator:delegateToStateController(note, currTime, timeGap) == true,
    "error in assertDelegateToStateController"
  )

  note, currTime, timeGap = noteList[3], 46, 0
  assert(
    hitCalculator:delegateToStateController(note, currTime, timeGap) == true,
    "error in assertDelegateToStateController"
  )

  note, currTime, timeGap = noteList[4], 47, 0.001
  assert(
    hitCalculator:delegateToStateController(note, currTime, timeGap) == true,
    "error in assertDelegateToStateController"
  )

  note, currTime, timeGap = noteList[5], 47.2980455, 0.0000002
  assert(
    hitCalculator:delegateToStateController(note, currTime, timeGap) == true,
    "error in assertDelegateToStateController"
  )

  note, currTime, timeGap = noteList[6], 1800.2354, 0.0003
  assert(
    hitCalculator:delegateToStateController(note, currTime, timeGap) == true,
    "error in assertDelegateToStateController"
  )

  return true
end

KeyboardHitCalculatorTests.assertProperCreation = function(self)
  local noteList = {
    SimpleNote:new(44.3),
    SimpleNote:new(45),
    SimpleNote:new(46),
    SimpleNote:new(46.999),
    SimpleNote:new(47.2980457),
    SimpleNote:new(1800.2351)
  }
  for _, note in ipairs(noteList) do
    note:setAliveState(true)
  end
  local pressHandler = KeyboardKeyPressHandler:new(KeyboardKey:new("a"))
  local hitCalculator = self.hitCalculatorClass:new(pressHandler, noteList, noteStateControllers)

  assert(
    #hitCalculator.noteList == #noteList and hitCalculator.noteList == noteList,
    "error in assertProperCreation"
  )
  assert(
    hitCalculator.keyPressHandler == pressHandler,
    "error in assertProperCreation"
  )

  if pcall(function() self.hitCalculatorClass:new(nil, nil, nil) end) then
    error("error in assertProperCreation")
  end

  return true

end

KeyboardHitCalculatorTests:assertProperCreation()
KeyboardHitCalculatorTests:assertDelegateToStateController()
KeyboardHitCalculatorTests:assertCalculateHit()

print("all tests passed")

return KeyboardHitCalculatorTests
