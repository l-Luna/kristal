local ColliderGroup, super = Class(Collider)

function ColliderGroup:init(parent, colliders)
    super:init(self, 0, 0, parent)

    self.colliders = colliders or {}
    for _,collider in ipairs(self.colliders) do
        collider.parent = collider.parent or self.parent
    end
end

function ColliderGroup:addCollider(collider)
    collider.parent = collider.parent or self.parent
    table.insert(self.colliders, collider)
end

function ColliderGroup:collidesWith(other)
    other = self:getOtherCollider(other)
    if not self:collidableCheck(other) then return false end

    for _,collider in ipairs(self.colliders) do
        if collider:collidesWith(other) then
            return true
        end
    end

    return super:collidesWith(self, other)
end

function ColliderGroup:draw(r,g,b,a)
    for _,collider in ipairs(self.colliders) do
        collider:draw(r,g,b,a)
    end
end

return ColliderGroup