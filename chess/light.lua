minetest.register_node("chess:light_rook", {
	description = "Rook",
	paramtype = "light",
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	groups = {cracky=3},
	tiles = {
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png"
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

minetest.register_node("chess:light_knight", {
	description = "Knight",
	paramtype = "light",
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	groups = {cracky=3},
	tiles = {
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, -0.3125, 0.3125, -0.4375, 0.3125}, -- NodeBox1
			{-0.1875, -0.5, -0.1875, 0.1875, 0.25, 0.1875}, -- NodeBox2
			{-0.1875, 0.1875, -0.3125, 0.1875, 0.4375, 0.1875}, -- NodeBox3
			{-0.1875, 0.4375, 0, -0.125, 0.5, 0.125}, -- NodeBox15
			{0.125, 0.4375, 0, 0.1875, 0.5, 0.125}, -- NodeBox16
		}
	}
})

minetest.register_node("chess:light_bishop", {
	description = "Bishop",
	paramtype = "light",
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	groups = {cracky=3},
	tiles = {
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, -0.3125, 0.3125, -0.4375, 0.3125}, -- NodeBox1
			{-0.1875, -0.5, -0.1875, 0.1875, 0.25, 0.1875}, -- NodeBox2
			{-0.125, 0.1875, -0.125, 0.125, 0.375, 0.125}, -- NodeBox3
			{-0.125, 0.1875, 0.03, 0.125, 0.5, 0.125}, -- NodeBox17
			{-0.125, 0.1875, -0.13, 0.125, 0.5, -0.03}, -- NodeBox18
		}
	}
})

minetest.register_node("chess:light_queen", {
	description = "Queen",
	paramtype = "light",
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	groups = {cracky=3},
	tiles = {
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, -0.3125, 0.3125, -0.4375, 0.3125}, -- NodeBox1
			{-0.1875, -0.5, -0.1875, 0.1875, 0.25, 0.1875}, -- NodeBox2
			{-0.125, 0.1875, -0.125, 0.125, 0.375, 0.125}, -- NodeBox3
			{-0.1875, 0.375, -0.1875, 0.1875, 0.4375, 0.1875}, -- NodeBox17
			{0.125, 0.375, -0.1875, 0.1875, 0.5, -0.125}, -- NodeBox19
			{-0.1875, 0.375, -0.1875, -0.125, 0.5, -0.125}, -- NodeBox20
			{-0.1875, 0.375, 0.125, -0.125, 0.5, 0.1875}, -- NodeBox21
			{0.125, 0.375, 0.125, 0.1875, 0.5, 0.1875}, -- NodeBox22
			{-0.0625, 0.375, 0.125, 0.0625, 0.5, 0.1875}, -- NodeBox23
			{-0.0625, 0.375, -0.1875, 0.0625, 0.5, -0.125}, -- NodeBox24
			{0.125, 0.375, -0.0625, 0.1875, 0.5, 0.0625}, -- NodeBox25
			{-0.1875, 0.375, -0.0625, -0.125, 0.5, 0.0625}, -- NodeBox26
		}
	}
})

minetest.register_node("chess:light_king", {
	description = "King",
	paramtype = "light",
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	groups = {cracky=3},
	tiles = {
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, -0.3125, 0.3125, -0.4375, 0.3125}, -- NodeBox1
			{-0.1875, -0.5, -0.1875, 0.1875, 0.25, 0.1875}, -- NodeBox2
			{-0.1875, 0.1875, -0.1875, 0.1875, 0.375, 0.1875}, -- NodeBox3
			{-0.1875, 0.375, -0.1875, 0.1875, 0.4375, 0.1875}, -- NodeBox17
			{0.125, 0.375, -0.25, 0.25, 0.5, -0.125}, -- NodeBox19
			{-0.25, 0.375, -0.25, -0.125, 0.5, -0.125}, -- NodeBox20
			{-0.25, 0.375, 0.125, -0.125, 0.5, 0.25}, -- NodeBox21
			{0.125, 0.375, 0.125, 0.25, 0.5, 0.25}, -- NodeBox22
			{-0.0625, 0.375, 0.125, 0.0625, 0.5, 0.25}, -- NodeBox23
			{-0.0625, 0.375, -0.25, 0.0625, 0.5, -0.125}, -- NodeBox24
			{0.125, 0.375, -0.0625, 0.25, 0.5, 0.0625}, -- NodeBox25
			{-0.25, 0.375, -0.0625, -0.125, 0.5, 0.0625}, -- NodeBox26
		}
	}
})

minetest.register_node("chess:light_pawn", {
	description = "Pawn",
	paramtype = "light",
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	groups = {cracky=3},
	tiles = {
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png"
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

-- red -Z blue +Z