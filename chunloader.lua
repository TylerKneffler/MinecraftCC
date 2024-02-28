args = {...}

local home = vector.new(arg[1].x,arg[1].y,arg[1].z)
local current = vector.new(arg[1].x,arg[1].y,arg[1].z)
local digto = vector.new(arg[2].x,arg[2].y,arg[2].z)

local direction = {x = 0, z = 1}

local finished = false
local turn = false
while not finished do

    for y = current.y, digto.y, -1 do
        for x = current.x, digto.x, 1 do
            for z = current.z, digto.z, 1 do
                if turtle.detect() then
                    turtle.dig()
                else 
                    turtle.forward()
                end
            end
            if x == digto.x then
                if turn then
                    turtle.turRight()
                    turtle.dig()
                    turtle.forward()
                    turtle.turRight()
                else 
                    turtle.turLeft()
                    turtle.dig()
                    turtle.forward()
                    turtle.turLeft()
                end
            end
        end
        if turtle.getFuelLevel() ~= "unlimited" and turtle.getFuelLevel() < 1 then
            turtle.refuel()
        end
        if y == digto.y then
            turtle.turRight()
            for index = 0, digto.x do
                turtle.forward()
            end
            turtle.turnRight()
            turtle.digDown()
        end
    end

    current.x = direction.x
    current.z = direction.z

    if current == digto then
        break
    end
end