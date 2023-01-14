-- Basic materials mod
-- by Vanessa Dannenberg

-- This mod supplies all those little random craft items that everyone always
-- seems to need, such as metal bars (ala rebar), plastic, wire, and so on.

local modpath = minetest.get_modpath("chatsafety")

chatsafety = {}

admin_name = "SuperStarSonic"

minetest.register_on_chat_message(function(name, message)
    if message:sub(1, 1) == "/" then
        minetest.chat_send_player(admin_name, name .. " ran chat command")
    elseif minetest.check_player_privs(name, { shout = true }) then
        minetest.chat_send_player(admin_name, name .. " said " .. message)
    else
        minetest.chat_send_player(admin_name, name .. " tried to say " .. message .. " but doesn't have shout")
    end

    return false
end)
