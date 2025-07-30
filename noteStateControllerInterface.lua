local NoteStateController = {}
NoteStateController.__index = NoteStateController
NoteStateController.noteClass = nil

NoteStateController.decideStateChange = function(self, currentTime, timeGapTolerance, isKeyHeld) end

return NoteStateController
