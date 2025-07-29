local Note = {}
Note.__index = Note

Note.hitTime = nil

Note.aliveState = nil

--Note.setHitTime = function(self, newTime) end

Note.setAliveState = function(self, isAlive) end

Note.getHitTime = function(self) end

Note.getAliveState = function(self) end

return Note
