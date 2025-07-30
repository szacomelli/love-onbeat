local HitCalculatorTestInterface = {}
HitCalculatorTestInterface.hiCalculatorClass = nil

HitCalculatorTestInterface.new = function(self, hitCalculatorClass)
  local object = {}
  setmetatable(object, self)
  self.__index = self
  object.hitCalculatorClass = hitCalculatorClass
  return object
end

HitCalculatorTestInterface.assertCalculateHit = function(self) end

return HitCalculatorTestInterface
