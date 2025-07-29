local Key = {}
Key.__index = Key

Key.currentControllerKey = nil

Key.isKeyPressed = nil

Key.getControllerKey = function(self) end

Key.getIsKeyPressed = function(self) end

Key.setIsKeyPressed = function(self, isPressed) end

return Key
