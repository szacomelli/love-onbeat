local Note = require "noteInterface"

local simpleNote = {}

simpleNote.new = function(self, time)
  local object = {}
  setmetatable(object, self)
  self.__index = self
  object.hitTime = time
  object.aliveState = false
  return object
end

simpleNote.setHitTime = function(self, newTime)
  self.hitTime = newTime
end

simpleNote.setAliveState = function(self, isAlive)
  self.aliveState = isAlive
end

simpleNote.getHitTime = function(self)
  return self.hitTime
end

simpleNote.getAliveTime = function(self)
  return self.aliveState
end

return simpleNote
