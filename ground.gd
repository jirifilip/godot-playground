extends StaticBody2D

@export var width: float = 400.0
@export var height: float = 50.0
@export var color: Color = Color.from_string("#9e6d30", Color(0, 0, 1))


func _ready() -> void:
	update_ground()


func _process(delta):
	if Engine.is_editor_hint():
		update_ground()


func update_ground():
	var collision_shape = $CollisionShape2D
	
	if collision_shape:
		var shape = RectangleShape2D.new()
		shape.size = Vector2(width, height)
		collision_shape.shape = shape
		
	queue_redraw()
	
	
func _draw():
	draw_rect(Rect2(position.x, position.y, width, height), color)
