print("Writing Debug")

local file = fileCreate ('debug.txt' )
for i,v in pairs(sDebug) do
    fileWrite(file,"\n"..v)
end

fileClose(file) -- done





xmlUnloadFile (bPlacements)
xmlUnloadFile (bDefintions)