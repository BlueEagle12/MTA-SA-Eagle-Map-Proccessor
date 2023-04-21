
-- // Load the defintion, and placement files we outputted from blender.
meta = {}
sDebug = {}

bDefintions = xmlLoadFile("data/defintions.definition") -- // Load full list of definitions
bPlacements = xmlLoadFile("data/placements.map") -- // Load full list of map placements

local pDefintion = xmlNodeGetChildren(bDefintions)


local pPlacements = xmlNodeGetChildren(bPlacements)


-- // Define where the data will be placed
	globalTable = {}
	globalTable['Defintions'] = pDefintion
	globalTable['Placements'] = pPlacements

-- // Meta definements for definitions
	definitionMeta = {}
	dMeta = {}

-- // Meta definements for placement
	placementMeta = {}
	pMeta = {}

-- MAKE SURE TO DEFINE THESE FIRST
