print("Writing Client Defintions")

defintionData = {}
placementDefinitionData = {}


definitionOrder = {'id','zone','dff','col','txd','alphaTransparency','lod','lodID','lodDistance','timeIn','timeOut','lodOnly'}

function writeDefinitionAttributes(child,data)
	for _,attribute in ipairs(definitionOrder) do
		if data[attribute] then
			xmlNodeSetAttribute(child,attribute,data[attribute])
		end
	end
end


for _,data in pairs(globalTable['Defintions']) do
	local attributes = xmlNodeGetAttributes(data)
	local zone = attributes['zone']
	local id = attributes['id']

	defintionData[zone] = defintionData[zone] or {} -- // Checking if table already exists, if not create a new empty table
	
	table.insert(defintionData[zone],attributes) -- // Write defintion
	placementDefinitionData[id] = zone
end


for zone,data in pairs(defintionData) do
	local file = xmlCreateFile (mapName..'/zones/'..zone..'/'..zone..'.definition','zoneDefinitions' )
	
	definitionMeta['zones/'..zone..'/'..zone..'.definition'] = true -- // Adds our 'zone defintion' to a list of META Inputs
	for i,v in pairs(data) do
		local child = xmlCreateChild(file, "definition")
		writeDefinitionAttributes(child,v)
	end
	xmlSaveFile(file)
	xmlUnloadFile(file)
end


table.insert(dMeta,' ')



for meta,_ in pairs (definitionMeta) do
	table.insert(dMeta,'	<file src="'..meta..'" type="client" />') -- // Insert all of the defined META inputs into a formatted table
end