local HitCalculator = {}
 HitCalculator.__index = HitCalculator

HitCalculator.noteList = nil
HitCalculator.keyPressHandler = nil

HitCalculator.calculateHit = function(self, timeGapTolerance) end

return HitCalculator
