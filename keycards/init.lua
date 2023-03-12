keycards = {}


local modpath = minetest.get_modpath(minetest.get_current_modname())

minetest.register_craftitem("keycards:ticket", {
    description = "Reusable Ticket",
    inventory_image = "ticket.png" 
})

minetest.register_node("keycards:ticket_door", {
    description = "Ticket Door",
    inventory_image = "ticket_door.png",
    tiles = {"ticket_door.png"},
    paramtype2 = "facedir",
    groups = {cracky=3, crumbly=3, oddly_breakable_by_hand=2}
})

minetest.register_node("keycards:ticket_machine", {
    description = "Ticket Machine",
    tiles = {"machine_side.png",
        "machine_side.png",
        "machine_side.png",
        "machine_side.png",
        "machine_side.png",
        "machine_front.png"},
    is_ground_content = true,
    paramtype = "light",
    groups = {cracky=3, crumbly=3, oddly_breakable_by_hand=2},
    
    after_place_node = function(pos, node, clicker, itemstack, pointedthing, self)
        local pos = {x = pos.x, y = pos.y, z = pos.z}
        local pos2 = {x = pos.x + 1, y = pos.y, z = pos.z}
        local pos3 = {x = pos.x + 1, y = pos.y - 1, z = pos.z}
        minetest.set_node(pos2, {name = "keycards:ticket_door"})
        minetest.set_node(pos3, {name = "keycards:ticket_door"})
        end,
    
    on_rightclick = function(pos, node, clicker, itemstack, pointedthing, self)
        local name2 = clicker:get_player_name()
        local inv = minetest.get_inventory({ type="player", name=name2 })
        if inv:contains_item("main", "keycards:ticket") then
            minetest.chat_send_player(name2, "Ticket Recognised. Please proceed.")
            
            local pos = {x = pos.x, y = pos.y, z = pos.z}
            
            local pos2 = {x = pos.x + 1, y = pos.y, z = pos.z}
            minetest.remove_node(pos2)
            minetest.set_node(pos2, { name = "air" })
            
            local pos3 = {x = pos.x + 1, y = pos.y - 1, z = pos.z}
            minetest.remove_node(pos3)
            minetest.set_node(pos3, { name = "air" })
            
            minetest.after(3, function()
                minetest.set_node(pos2, {name = "keycards:ticket_door"})
                minetest.set_node(pos3, {name = "keycards:ticket_door"})
            end)

        else
            minetest.chat_send_player(name2, "No Ticket")
        end
    end
})

minetest.register_craft({
    output = "keycards:ticket",
    recipe = {
        {"default:paper", "default:diamond" },
    }
})




minetest.register_craftitem("keycards:card", {
    description = "Blue Keycard",
    inventory_image = "keycard.png" 
})

minetest.register_node("keycards:keycard_door", {
    description = "Keycard Door",
    inventory_image = "keycard_door.png",
    tiles = {"keycard_door.png"},
    paramtype2 = "facedir",
    groups = {cracky=3, crumbly=3}
})

minetest.register_node("keycards:keycard_machine", {
    description = "Keycard Machine",
    tiles = {"machine_side.png",
        "machine_side.png",
        "machine_side.png",
        "machine_side.png",
        "machine_side.png",
        "swiper_front.png"},
    is_ground_content = true,
    paramtype = "light",
    groups = {cracky=3, choppy=3},
    
    after_place_node = function(pos, node, clicker, itemstack, pointedthing, self)
        local pos = {x = pos.x, y = pos.y, z = pos.z}
        local pos2 = {x = pos.x + 1, y = pos.y, z = pos.z}
        local pos3 = {x = pos.x + 1, y = pos.y - 1, z = pos.z}
        minetest.set_node(pos2, {name = "keycards:keycard_door"})
        minetest.set_node(pos3, {name = "keycards:keycard_door"})
        end,
    
    on_rightclick = function(pos, node, clicker, itemstack, pointedthing, self)
        local name2 = clicker:get_player_name()
        local inv = minetest.get_inventory({ type="player", name=name2 })
        if inv:contains_item("main", "keycards:card") then
            minetest.chat_send_player(name2, "Keycard recognised. Please proceed.")
            
            local pos = {x = pos.x, y = pos.y, z = pos.z}
            
            local pos2 = {x = pos.x + 1, y = pos.y, z = pos.z}
            minetest.remove_node(pos2)
            minetest.set_node(pos2, { name = "air" })
            
            local pos3 = {x = pos.x + 1, y = pos.y - 1, z = pos.z}
            minetest.remove_node(pos3)
            minetest.set_node(pos3, { name = "air" })
            
            minetest.after(3, function()
                minetest.set_node(pos2, {name = "keycards:keycard_door"})
                minetest.set_node(pos3, {name = "keycards:keycard_door"})
            end)

        else
            minetest.chat_send_player(name2, "No keycard detected.")
        end
    end
})



