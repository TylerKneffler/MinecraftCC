args = {...}

local home = vector.new(args[1][0],args[1][1],args[1][2])
local current = vector.new(args[1][0],args[1][1],args[1][2])
local digto = vector.new(args[2][0],args[2][1],args[2][2])

print(home)
print(digto)

local finished = false
local turn = false

for y = home.y, digto.y, -1 do
    for x = home.x, digto.x, 1 do
        for z = home.z, digto.z, 1 do
                turtle.dig()
                turtle.forward()
        end
        if x == digto.x then
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
        end
    end
    if turtle.getFuelLevel() ~= "unlimited" and turtle.getFuelLevel() < 1 then
        turtle.refuel()
    end
    if y == digto.y then
        turtle.turnRight()
        for index = 0, digto.x do
            turtle.forward()
        end
        turtle.turnRight()
        turtle.digDown()
    end
end