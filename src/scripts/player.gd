# ==============================================================================
# Author: Enrique González Gutiérrez
# Date: 13/06/2026
# Description: Character controller script handling basic platformer physics,
#              movement mechanics, gravity, jumping, sprite facing, and dynamic
#              animation state transitions.
# ==============================================================================
extends CharacterBody2D

# Constants configured according to technical movement specifications
const SPEED: float = 510.0 # 8.5 m/s * 60 pixels scaling factor
const JUMP_VELOCITY: float = -840.0 # 14.0 m/s * 60 pixels scaling factor
const GRAVITY: float = 1920.0 # 32.0 m/s^2 * 60 pixels scaling factor

# References to child nodes
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Apply heavy down gravity when not touching solid ground
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Process jump action using custom input bindings
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get movement direction using custom input mappings
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction != 0:
		# Fast acceleration to max running speed
		velocity.x = direction * SPEED
		# Flip the character sprite horizontally to face direction of travel
		sprite.flip_h = (direction < 0)
	else:
		# Rapid deceleration when directional input is released
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Update character animations based on current physical state
	_update_animations(direction)

	# Execute physics movement using Kinematic Collision handlers
	move_and_slide()

# Decoupled function handling animation state transitions based on physics variables
func _update_animations(direction: float) -> void:
	if not is_on_floor():
		# Play jumping frame/sequence when airborne
		sprite.play("jump")
	elif direction != 0:
		# Play running loop when moving horizontally on ground
		sprite.play("run")
	else:
		# Play idle breathing loop when stationary on ground
		sprite.play("idle")
