-- GENERATED CODE
-- Node Box Editor, version 0.9.0
-- Namespace: test

minetest.register_node("chess:rook", {
	description = "Rook",
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
			{-0.25, 0.25, -0.25, 0.25, 0.4375, 0.25}, -- NodeBox3
			{-0.25, 0.375, -0.25, -0.125, 0.5, -0.125}, -- NodeBox4
			{-0.25, 0.3125, 0.125, -0.125, 0.5, 0.25}, -- NodeBox7
			{0.125, 0.3125, 0.125, 0.25, 0.5, 0.25}, -- NodeBox8
			{0.125, 0.3125, -0.25, 0.25, 0.5, -0.125}, -- NodeBox9
			{0.125, 0.3125, -0.0625, 0.25, 0.5, 0.0625}, -- NodeBox10
			{-0.25, 0.3125, -0.0625, -0.125, 0.5, 0.0625}, -- NodeBox11
			{-0.0625, 0.3125, 0.125, 0.0625, 0.5, 0.25}, -- NodeBox12
			{-0.0625, 0.3125, -0.25, 0.0625, 0.5, -0.125}, -- NodeBox13
		}
	}
})

