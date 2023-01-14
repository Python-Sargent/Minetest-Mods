-- GENERATED CODE
-- Node Box Editor, version 0.9.0
-- Namespace: test

minetest.register_node("chess:pawn", {
	description = "Pawn",
	paramtype = "light",
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	groups = {cracky=3},
	tiles = {
		"my_mod_ruby_block.png",
		"my_mod_ruby_block.png",
		"my_mod_ruby_block.png",
		"my_mod_ruby_block.png",
		"my_mod_ruby_block.png",
		"my_mod_ruby_block.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, -0.3125, 0.3125, -0.4375, 0.3125}, -- NodeBox1
			{-0.1875, -0.5, -0.1875, 0.1875, 0.25, 0.1875}, -- NodeBox2
			{-0.125, 0.1875, -0.125, 0.125, 0.375, 0.125}, -- NodeBox3
			{-0.125, 0.375, -0.125, 0.125, 0.5, 0.125}, -- NodeBox17
		}
	}
})

