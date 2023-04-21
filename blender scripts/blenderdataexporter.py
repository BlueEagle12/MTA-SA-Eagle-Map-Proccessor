import os
import bpy

    
# Replace this with the path to the folder you want to export
folder_path = 'C:/Program Files (x86)/MTA San Andreas 1.5/server/mods/deathmatch/resources/eagleMapProccessor/data/'

os.makedirs(folder_path, exist_ok=True)

# Replace this with the name of the file you want to export the data to
definitionString = 'defintions.definition'
definitionPath = folder_path + definitionString

placementString = 'placements.map'
placementPath = folder_path + placementString

definitionProperties = ['alphaTransparency','lod','lodID','lodDistance','timeIn','timeOut','lodOnly']



def addData(file, dataName,dataString):

    file.write(f' {dataName}="{dataString}"')
    return True


with open(definitionPath, 'w') as file:
    file.write('<zoneDefinitions>\n')
    for obj in bpy.context.scene.objects:
        if obj.type == 'MESH':

            file.write('    <definition')
            
            
            addData(file, "id", obj.name)
            if 'zone' in obj.keys():
                addData(file, "zone", obj.zone)
            else:
                addData(file, "zone", 'Default')
                
            addData(file, "dff", obj.name)
            addData(file, "col", obj.name)
            
            if 'txd' in obj.keys():
                addData(file, "txd", obj.txd)
            else:
                addData(file, "txd", 'Default')
             
            for index, data in enumerate(definitionProperties):
                if data in obj.keys():
                    addData(file, data, obj[data])
            
            file.write('></definition>\n')
        
    file.write('</zoneDefinitions>')
    
    file.close()
    
    
placementProperties = ['interior','collisions','alpha','doublesided','scale','dimension']

    
# 'id','posX','posY','posZ','rotX','rotY','rotZ','interior','collisions','alpha','doublesided','scale','dimension'

with open(placementPath, 'w') as file:
    file.write('<map>\n')

    for obj in bpy.context.scene.objects:
        if obj.type == 'MESH':
            
            file.write('    <object')
            
            addData(file, "id", obj.name)
            
            location = obj.location
            rotation = obj.rotation_euler
            
            addData(file, "posX", location.x)
            addData(file, "posY", location.y)
            addData(file, "posZ", location.z)
            
            addData(file, "rotX", rotation.x)
            addData(file, "rotY", rotation.y)
            addData(file, "rotZ", rotation.z)
            
            if data in obj.keys():
                addData(file, "model", obj['model'])
            else:
                addData(file, "model",'8585')
            
            for index, data in enumerate(placementProperties):
                if data in obj.keys():
                    addData(file, data, obj[data])
                    
            file.write('></object>\n')
        
    file.write('</map>')      
    
    file.close()
    # Write the object's name and information to data file



# Print a message to let the user know the export is complete
print('Definition Export Complete!')




