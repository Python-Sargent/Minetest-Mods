scoreboard = {}
modpath = minetest.get_modpath("scoreboard")

--[[
scoreboard.teams = {}

scoreboard.add_team = function(name)
	if name == nil then
		print("[ERROR]Scoreboard failed to add team to list: empty name")
		return 	
	end
	scoreboard.teams.[name] = {}
end

scoreboard.remove_team = function(name)
	if name == nil then
		print("[ERROR]Scoreboard failed to remove team: empty name")
		return 	
	end
	scoreboard.teams.[name] = nil
end

scoreboard.team_add_player = function(def)
	if def == nil then
		print("[ERROR]Scoreboard failed to add player to team: empty definition table")
		return 	
	end
	scoreboard.teams.[def.teamname].[def.playername]={level=def.playerlevel}
end

scoreboard.team_remove_player = function(team,pname)
	if def == nil then
		print("[ERROR]Scoreboard failed to add player to team: empty definition table")
		return 	
	end
	scoreboard.teams.[team].[pname]=nil
end

scoreboard.objectives = {}

scoreboard.add_objective = function(def)
	scoreboard.objectives[def.name]={}
end

]]--

dofile(modpath.."/example.lua")
