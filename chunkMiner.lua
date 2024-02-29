args = {...}

local home = vector.new(1,1,1)
local digto = vector.new(args[1],args[2],args[3])
local current = vector.new(1,1,1)

print(home)
print(digto)

local turn = true

function ivFull()
    for i = 1,16 do
        if turtle.getItemCount(i) > 0 then
        return false
        end
    end
    return true
end

function updatePos(x,y,z)
    current.x = x
    current.y = y
    current.z = z
    print(x," ",y," ",z)
end


function resupply(x,y,z)
    for y = current.y, home.y, 1 do
        turtle.up()
    end
    turtle.turnRight()
    turtle.turnRight()
    for i = 2,16 do
        turtle.select(i)
        turtle.drop(64)
    end
    turtle.select(1)
    
    turtle.turnRight()
    turtle.turnRight()
    
    for y = current.y, home.y, 1 do
        turtle.down()
    end
end

for y = home.y, digto.y, -1 do
    for x = home.x, digto.x, 1 do
        for z = home.z, digto.z, 1 do
            if z < digto.z then
                turtle.dig()
                turtle.forward()
                updatePos(x,y,z)
            end
        end
        print(x," ~= ",digto.x)
        if x < digto.x then
            if turn then
                turtle.turnRight()
                turtle.dig()
                turtle.forward()
                turtle.turnRight()
            else 
                turtle.turnLeft()
                turtle.dig()
                turtle.forward()
                turtle.turnLeft()
            end
            turn = not turn
        end
    end
    if turtle.getFuelLevel() ~= "unlimited" and turtle.getFuelLevel() < 1 then
        turtle.refuel()
    end
    turtle.turnRight()
    for i = 1, digto.x -1 do
        turtle.forward()
    end
    turtle.turnRight()
    turtle.digDown()

    if ivFull() then
        resupply(current.x,current.y,current.z)
    end
    turtle.down()
    turn = true
end