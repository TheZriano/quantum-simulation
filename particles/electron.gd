extends RigidBody2D

var bodies_in_range=[]
var charge=-1
var radius=10

var rep_bodies_in_range=[]




func _physics_process(_delta: float) -> void:
	for body in bodies_in_range:
		var relativepos=body.position-self.position
		var distance=sqrt(relativepos[0]**2+relativepos[1]**2)
		if distance>self.radius+body.radius+1  or (self.charge*body.charge)>0:
			var force_module= get_parent().PE_attraction
			var angle=atan2(relativepos[1],relativepos[0])
			var force=Vector2(force_module*cos(angle),force_module*sin(angle))*-1*(self.charge*body.charge)
			
			apply_central_force(force)
			
	for body in rep_bodies_in_range:
		var relativepos=body.position-self.position
		var distance=sqrt(relativepos[0]**2+relativepos[1]**2)
		if distance>self.radius+body.radius+1  or (self.charge*body.charge)>0:
			var force_module= get_parent().PE_attraction
			var angle=atan2(relativepos[1],relativepos[0])
			var force=Vector2(force_module*cos(angle),force_module*sin(angle))*-1
			
			apply_central_force(force)
			body.apply_central_force(force*-1)
		
	
	

func _on_charge_box_body_entered(body: Node2D) -> void:
	if not (body in bodies_in_range) and not (body.has_method("wall")):
		bodies_in_range.append(body)
		


func _on_charge_box_body_exited(body: Node2D) -> void:
	if body in bodies_in_range:
		bodies_in_range.erase(body)


func _on_repulsive_force_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if not (body in rep_bodies_in_range) and body. has_method("nucleon"):
		rep_bodies_in_range.append(body)


func _on_repulsive_force_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (body in rep_bodies_in_range):
		rep_bodies_in_range.erase(body)
