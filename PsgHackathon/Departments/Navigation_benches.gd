extends TileMap

var data={}
var area="Development"
export(Dictionary) var scene_dict={
	1:preload("res://Objects/Objects.tscn")
}

onready var bench= $"../Benches"

func _ready():
	yield(get_tree(),"idle_frame")
	replace_tiles_with_scene(scene_dict)

func replace_tiles_with_scene(scene_dict):
	for tiles in get_used_cells():
		var tile_id=get_cell(tiles.x,tiles.y)
		if scene_dict.has(tile_id):
			var object_scene=scene_dict[tile_id]
			replace_tiles_with_objects(tiles,object_scene)


func replace_tiles_with_objects(tile,object_scene):
	if get_cell(tile.x,tile.y)!=INVALID_CELL:
		set_cellv(tile,-1)
	
	var obj=object_scene.instance()
	var obj_pos=map_to_world(tile)+(cell_size/2)
	obj.global_position=obj_pos
	bench.add_child(obj)
	TableAndBenches.total_dev_benches.append(obj)
	TableAndBenches.current_dev_employees.append(0)



