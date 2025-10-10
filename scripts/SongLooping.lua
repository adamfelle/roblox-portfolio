-- Place in ServerScriptService or Workspace.
-- Ensure you have a SoundPart, replace workspace:WaitForChild("SoundPart") with your actual path to the part if you have an alternative path.
-- Edit distance the player can hear the audio with RollOffMaxDistance.

local assetid = "rbxassetid://" -- Asset ID prefix

local sounds = {
	116489973488805,
	112070150852789
} -- Replace sound IDs with the sound IDs you want to loop

local soundPart = workspace:WaitForChild("SoundPart") -- Part that the sound will be put in. Change path as needed
local audio = Instance.new("Sound", soundPart) -- Places sound object in the soundPart
audio.RollOffMaxDistance = math.huge -- Infinite distance, if you want it to be more concentrated, change this number

function songFade(initNum, endNum, step, object, pause)
	for i=initNum, endNum, step do
		object.Volume = i
		wait(pause)
	end
end

while wait(0.5) do
	for _,i in pairs(sounds) do
		audio.SoundId = assetid..i -- Sets the Sound ID to the current sound in the list

    print("playing song "..i)
		audio:Play()
		
		songFade(0, 0.5, 0.01, audio, 0.1) -- Fades in
		
		repeat wait(1) until (audio.TimeLength - audio.TimePosition) <= 10 -- Wait until the audio is 10 seconds from the end
		
		songFade(0.5, 0.1, -0.01, audio, 0.1) -- Fades out
	end
end
