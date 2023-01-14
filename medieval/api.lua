--mobs (creatura)
crocodile_def = {
	max_health = 10 -- Maximum Health
	damage = 4 -- Damage dealt by mob
	speed = 3 -- Maximum Speed
	tracking_range = 10 -- Maximum range for finding entities/blocks
	despawn_after = 1500 -- Despawn after being active for this amount of time

	max_fall = 5 -- How far a mob can fall before taking damage (set to 0 to disable fall damage)
	turn_rate = 8 -- Turn Rate in rad/s
	bouyancy_multiplier = 1 -- Multiplier for bouyancy effects (set to 0 to disable bouyancy)
	hydrodynamics_multiplier = 1 -- Multiplier for hydroynamic effects (set to 0 to disable hydrodynamics)

	hitbox = { -- Hitbox params (Uses custom registration to force get_pos() to always return bottom of box)
		width = 0.5,
		height = 1
	}

	animations = {
		anim = {range = {x = 1, y = 10}, speed = 30, frame_blend = 0.3, loop = true}
	}

	drops = {
		{name = ("medieval:crocodile_meat"), min = 1, max = 3, chance = 1},
	}
	follow = {}

	utility_stack = {
		-- Every second, all utilities in the stack are evaluated
		-- Whichever utilitiy's get_score function returns the highest number will be executed
		-- If multiple utilities have the same score, the one with the highest index is executed
		[1] = {
			`utility` -- name of utility to evaluate
			`get_score` -- function (only accepts `self` as an arg) that returns a number
		}
	}

	activate_func = function(self, staticdata, dtime_s) -- called upon activation
	step_func = function(self, dtime, moveresult) -- called every server step
	death_func = function(self) -- called when mobs health drops to/below 0
}
--mobs (mobs_api)


if minetest.global_exists('3d_armor') then
	--do 3d_armor stuff (add armor)
end

if minetest.global_exists('mobs_api') then
	--do mobs_api stuff (add mobs)
elseif minetest.global_exists('creatura') then
	crocodile_name = "Crocodile"
	creatura.register_mob(crocodile_name, crocodile_def)
	--do creatura stuff (add creatures)
end

if minetest.global_exists('x_bows') then
	--do x_bows stuff (add bows)
end 

