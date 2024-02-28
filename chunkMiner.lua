args = {...}

local home = vector.new(0,0,0)
local digto = vector.new(args[1],args[2],args[3])

print(home)
print(digto)

local finished = false
local turn = false

for y = home.y, digto.y, -1 do
    for x = home.x, digto.x, 1 do
        for z = home.z, digto.z, 1 do
                turtle.dig()
                turtle.forward()
                print(x," ",y," ",z)
        end
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
    if turtle.getFuelLevel() ~= "unlimited" and turtle.getFuelLevel() < 1 then
        turtle.refuel()
    end
    turtle.turnRight()
    for index = 0, digto.x do
        turtle.forward()
    end
    turtle.turnRight()
    turtle.down()
    turtle.digDown()
end