print("Writing Placement Files")

placementData = {}


placementOrder = {'id','posX','posY','posZ','rotX','rotY','rotZ','interior','collisions','alpha','doublesided','scale','dimension'}

 
function writePlacementAttributes(child,data)
	for id,attribute in ipairs(placementOrder) do
		if data[attribute] then
			if (attribute == 'posX') then
				xmlNodeSetAttribute(child,'model',8585) -- // Set placeholder model ID makes MTA happy.
			end
			--[[
			if attribute == 'id' then
				xmlNodeSetAttribute(child,'definitionID',data[attribute]) -- // Set fallback elementData incase elementID doesn't read properly.
			end
			]]--
			xmlNodeSetAttribute(child,attribute,data[attribute])
		end
	end
end


for _,data in pairs(globalTable['Placements']) do
	local attributes = xmlNodeGetAttributes(data)
	
	local id = attributes['id']
	local zone = placementDefinitionData[id]
	
	
	placementData[zone] = placementData[zone] or {} -- // Checking if table already exists, if not create a new empty table

	table.insert(placementData[zone],attributes) -- // Write defintion
end


for zone,data in pairs(placementData) do
	local file = xmlCreateFile (mapName..'/zones/'..zone..'/'..zone..'.map','map' )
	
	placementMeta['zones/'..zone..'/'..zone..'.map'] = true -- // Adds the 'zone placement' to a list of META Inputs
	for i,v in pairs(data) do
		local child = xmlCreateChild(file, "object")
		writePlacementAttributes(child,v)
	end
	xmlSaveFile(file)
	xmlUnloadFile(file)
end


	
	table.insert(pMeta,'')
	table.insert(pMeta,'	<!-- Map Files -->')
for meta,_ in pairs (placementMeta) do
	table.insert(pMeta,'	<map src="'..meta..'" type="server" />') -- // Insert all of the defined META inputs into a formatted table
end
