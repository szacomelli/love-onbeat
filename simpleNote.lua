local Note = require "noteInterface"

local simpleNote = {}

setmetatable(simpleNote, Note)

simpleNote.new = function(self, time)
  assert(type(time) == "number", "simpleNote.new: time is " .. type(time))
  local object = {}
  setmetatable(object, self)
  self.__index = self
  object.hitTime = time
  object.aliveState = false
  return object
end

simpleNote.setAliveState = function(self, isAlive)
  assert(type(isAlive) == "boolean", "simpleNote.setAliveState: isAlive is " .. type(isAlive))
  self.aliveState = isAlive
end

simpleNote.getHitTime = function(self)
  return self.hitTime
end

simpleNote.getAliveState = function(self)
  return self.aliveState
end

return simpleNote
