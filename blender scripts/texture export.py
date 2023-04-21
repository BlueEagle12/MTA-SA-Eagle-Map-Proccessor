import bpy
import os
import re

# Set your output dictonary to whereever you want blender to output the scene images
output_dir = ""
saved_textures = set()

# Iterate through all materials in the scene
for material in bpy.data.materials:
    # Check if the material has a node tree
    if material.node_tree:
        # Iterate through all nodes in the material's node tree
        for node in material.node_tree.nodes:
            # Check if the node is a texture node
            if node.type == "TEX_IMAGE":
                # Get the texture and its image
                texture = node.image
                # Check if the texture has an image and hasn't already been saved
                # Remove the ".(numbers)" suffix from the texture name
                texture_name = re.sub(r'\.\d+$', '', texture.name)
                
                if texture and texture_name not in saved_textures:

                    # Generate a filename for the image based on the texture name
                    filename = texture_name + ".png"
                    # Construct the full output path
                    output_path = os.path.join(output_dir, filename)
                    # Save the image as a PNG file
                    texture.save_render(output_path)
                    # Add the texture to the saved textures set
                    saved_textures.add(texture_name)
                    # Print the name of the exported texture
                    print("Exported texture:", texture_name)