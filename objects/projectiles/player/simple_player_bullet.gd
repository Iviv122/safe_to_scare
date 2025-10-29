extends Projectile
class_name SimplePlayerBullet

func on_collide() -> void:
    for i in result:
        if i.collider is Enemy:
            i.collider.damage(PlayerStatsInstance.damage * damage_modifier)
            queue_free()

func move() -> void:
    global_position += dir*speed