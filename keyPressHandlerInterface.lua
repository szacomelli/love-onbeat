local KeyPressHandler = {}
KeyPressHandler.__index = KeyPressHandler

KeyPressHandler.key = nil
KeyPressHandler.isKeyHeld = nil

KeyPressHandler.pressKey = function(self, keyCharacter) end

KeyPressHandler.releaseKey = function(self, keyCharacter) end

KeyPressHandler.getCurrentControllerKey = function(self) end

KeyPressHandler.getIsKeyPressed = function(self) end

KeyPressHandler.getIsKeyHeld = function(self) end

KeyPressHandler.setIsKeyHeld = function(self, isHeld) end

return KeyPressHandler
