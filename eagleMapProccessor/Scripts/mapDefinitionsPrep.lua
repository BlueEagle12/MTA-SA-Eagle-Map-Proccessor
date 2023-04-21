
local file = fileCreate (mapName..'/eagleZones.txt' )

-- Create a eagleZones.txt file and write all of the zones seperated by lines.

for zone,data in pairs(placementData) do
	fileWrite(file,zone.."\n")
end


fileClose(file)

table.insert(dMeta,'') 
table.insert(dMeta,'	<file src="eagleZones.txt" type="client" />') -- // Insert all of the defined META inputs into a formatted table