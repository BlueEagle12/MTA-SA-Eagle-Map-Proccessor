
print("Writing Meta")


local file = fileCreate (mapName..'/meta.xml' )



fileWrite(file,'<meta>')
fileWrite(file,'\n	<info type="script" name="'..mapName..'" author="'..mAuthor..'" description="Blender Converted Map" version="1" eagleLoad="1" />')

--fileWrite(file,'\n	<!-- Scripts -->') --

--[[ 
To ensure the best compatability, 
resource files are no longer loaded on the resource side, 
instead the loader hooks onto the individual resources.
]]--



for i,v in pairs(pMeta) do -- // Write defintion META
    fileWrite(file,"\n"..v)
end

for i,v in pairs(dMeta) do -- // Write defintion META
    fileWrite(file,"\n"..v)
end



for i,v in pairs(meta) do
    fileWrite(file,"\n"..v)
end



fileWrite(file,"\n</meta>")

fileClose(file) -- done



