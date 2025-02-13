@tool
extends StaticBody2D

@export var width: float = 400.0 :
	set(value):
		width = max(value, 10)
		update_ground()

@export var height: float = 50.0 :
	set(value):
		height = max(value, 10)
		update_ground()
		
@export var color: Color = Color.SADDLE_BROWN


func _ready() -> void:
	update_ground()


func _process(delta):
	if Engine.is_editor_hint():
		queue_redraw()


func update_ground():
	var collision_shape = $CollisionShape2D
	
	if collision_shape:
		var shape = RectangleShape2D.new()
		collision_shape.position = Vector2(0, 0)
		shape.size = Vector2(width, height)
		collision_shape.shape = shape
		
	queue_redraw()
	
	
func _draw():
	draw_rect(Rect2(-width / 2, -height / 2, width, height), color)
