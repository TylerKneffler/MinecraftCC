print("Hello World")

location = {x = 0, y = 0, z = 0}

function location:new(o,x,y,z)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
	self.x = x
	self.y = y
	self.z = z
	return o
end

home = location:new(nil,1,1,1)

print(home.x," ",home.y," ",home.z)