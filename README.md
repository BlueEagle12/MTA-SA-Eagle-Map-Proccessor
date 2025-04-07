# MTA SA Eagle Map Proccessor

(TODO - UPDATE)

## Using the map proccessor

### File Placement

Place the following items in the specifed folders

#### 'Data' Folder

> Definitions.definition

> Placements.map
  
#### 'Resources' Folder

> .dff files

> .col files

> .txd files
  
### Map Configuration

Edit the following lines to configure your map

#### 'Config' script
  
 >map Name        (mapName)
 
 >map Author      (mAuthor)
 
 >map Offsets     (mapOffset)


## Proccessing the map

> Follow the above steps

> Start eagleMapProccessor

> Check debug.txt for any errors

> Make sure you use eagleLoader, and place the outputted folder into your 'Resources' folder, start eagleLoader first, then your map.

# Data Examples

### .map

```
<map>
    <object id="Cube" model="8585" posX="0.0" posY="0.0" posZ="0.0" rotX="0.0" rotY="0.0" rotZ="0.0"></object>
</map>
```

### .definition

```
<zoneDefinitions>
    <definition id="Cube" zone="Default" dff="Cube" col="Cube" txd="Default"></definition>
</zoneDefinitions>

```



