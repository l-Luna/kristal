local Hitbox, super = Class(Collider)

function Hitbox:init(parent, x, y, width, height)
    super:init(self, parent, x, y)

    self.width = width or 0
    self.height = height or 0
end

function Hitbox:collidesWith(other)
    other = self:getOtherCollider(other)
    if not self:collidableCheck(other) then return false end

    if other:includes(Hitbox) then
        return self:collidesWithHitbox(other) or other:collidesWithHitbox(self, true)
    elseif other:includes(LineCollider) then
        return CollisionUtil.rectLine(self.x,self.y,self.width,self.height, other:getShapeFor(self))
    elseif other:includes(CircleCollider) then
        return CollisionUtil.rectCircle(self.x,self.y,self.width,self.height, other:getShapeFor(self))
    elseif other:includes(PointCollider) then
        return CollisionUtil.rectPoint(self.x,self.y,self.width,self.height, other:getShapeFor(self))
    elseif other:includes(PolygonCollider) then
        return CollisionUtil.rectPolygon(self.x,self.y,self.width,self.height, other:getShapeFor(self))
    elseif other:includes(ColliderGroup) then
        return other:collidesWith(self)
    end

    return super:collidesWith(self, other)
end

function Hitbox:collidesWithHitbox(other)
    Utils.pushPerformance("Hitbox#collidesWithHitbox")

    local tf1, tf2 = self:getTransformsWith(other)

    local x1, y1 = other.x, other.y
    local x2, y2 = other.x + other.width, other.y
    local x3, y3 = other.x + other.width, other.y + other.height
    local x4, y4 = other.x, other.y + other.height

    if tf2 then
        x1, y1 = tf2:transformPoint(x1, y1)
        x2, y2 = tf2:transformPoint(x2, y2)
        x3, y3 = tf2:transformPoint(x3, y3)
        x4, y4 = tf2:transformPoint(x4, y4)
    end

    if tf1 then
        x1, y1 = tf1:inverseTransformPoint(x1, y1)
        x2, y2 = tf1:inverseTransformPoint(x2, y2)
        x3, y3 = tf1:inverseTransformPoint(x3, y3)
        x4, y4 = tf1:inverseTransformPoint(x4, y4)
    end

    Utils.popPerformance()

    return (x1 >= self.x and x1 < self.x + self.width and y1 >= self.y and y1 < self.y + self.height) or
           (x2 > self.x and x2 < self.x + self.width and y2 >= self.y and y2 < self.y + self.height) or
           (x3 > self.x and x3 < self.x + self.width and y3 > self.y and y3 < self.y + self.height) or
           (x4 >= self.x and x4 < self.x + self.width and y4 > self.y and y4 < self.y + self.height)
end

function Hitbox:draw(r,g,b,a)
    love.graphics.setColor(r,g,b,a)
    love.graphics.setLineWidth(1)
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
    love.graphics.setColor(1, 1, 1, 1)
end

return Hitbox