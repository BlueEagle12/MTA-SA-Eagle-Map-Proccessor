print("Copying Files")


metaList = {}

function copyFile(fType,fName,fZone)
	local fromPath = "Resources/"..fName.."."..fType
	local targetPath = "zones/"..fZone.."/"..fType.."/"..fName.."."..fType
	
	
	if fileExists(fromPath) then
		if not fileExists(mapName..'/'..targetPath) then
			fileCopy (fromPath,mapName..'/'..targetPath)
		end
		
		if not metaList[targetPath] then -- // Prevents duplicate METAs
			metaList[targetPath] = true
			table.insert(meta,'	<file src="'..targetPath..'" type="client" />')
		end
		
	else
		outputDebugInternal(fromPath.." missing!")
	end
end

zoneDefinitions = {}

for _,data in pairs(globalTable['Defintions']) do
	local attributes = xmlNodeGetAttributes(data)

	zoneDefinitions[attributes['zone']] = zoneDefinitions[attributes['zone']] or {}
	table.insert(zoneDefinitions[attributes['zone']],{attributes['dff'],attributes['col'],attributes['txd']})
end

 

for fZone,data in pairs(zoneDefinitions) do

	table.insert(meta,' ')
	table.insert(meta,'	<!-- Zone|'..fZone..' -->')
	table.insert(meta,' ')
	table.insert(meta,'	<!-- TXDs -->')
	for _,dData in pairs(data) do
		copyFile('txd',dData[3],fZone)
	end
	
		table.insert(meta,' ')
		table.insert(meta,'	<!-- DFFs -->')

	for _,dData in pairs(data) do
		copyFile('dff',dData[1],fZone)
	end
	
	table.insert(meta,' ')
	table.insert(meta,'	<!-- COLs -->')
		
	for _,dData in pairs(data) do
		copyFile('col',dData[2],fZone)
	end
	
end