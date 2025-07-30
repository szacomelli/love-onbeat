NoteStateControllerTest = {}
NoteStateControllerTest.stateControllerClass = nil

NoteStateControllerTest.new = function(self, stateControllerClass)
  local object = {}
  setmetatable(object, self)
  self.__index = self
  object.stateControllerClass = stateControllerClass
  return object
end

NoteStateControllerTest.assertDecideStateChange = function(self) end

return NoteStateControllerTest
