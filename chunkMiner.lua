args = {...}

local home = vector.new(1,1,1)
local digto = vector.new(args[1],args[2],args[3])

print(home)
print(digto)

local turn = true

for y = home.y, digto.y, -1 do
    for x = home.x, digto.x, 1 do
        for z = home.z, digto.z, 1 do
            turtle.dig()
            turtle.forward()
            print(x," ",y," ",z)
        end
        print(x," ~= ",digto.x)
        if x ~= digto.x then
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
    for index = 0, digto.x do
        turtle.forward()
    end
    turtle.turnRight()
    turtle.digDown()
    turtle.down()
    turn = true
end