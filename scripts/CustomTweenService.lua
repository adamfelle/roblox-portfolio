-- Adam Felle
-- ModuleScript in ReplicatedStorage named "CustomTweenService"
-- Call by doing require(game.ReplicatedStorage.CustomTweenService).TweenService(object, {TraitExample=Vector3.new()}, Enum.EasingStyle.Example, 3, false)

local CustomTweenService = {}

function CustomTweenService.TweenService(obj, result, easingStyle : Enum.EasingStyle?, length : number?, reversing : boolean?)
  return game:GetService("TweenService"):Create(obj, TweenInfo.new(
    length,
    easingStyle, -- EasingStyle
    Enum.EasingDirection.InOut, -- EasingDirection
    0, -- RepeatCount (when less than zero the tween will loop indefinitely)
    reversing, -- Reverses (tween will reverse once reaching its goal)
    0 -- DelayTime
  ), result)
end

return CustomTweenService
