local SpareSparkle, super = Class(Sprite)

function SpareSparkle:init(x, y)
    super:init(self, "effects/spare/star", x, y)

    self:play(0.25, true)

    self:setColor(1, 1, 1)
    self:setOrigin(0.5, 0.5)
    self:setScale(2)

    self:fadeOutAndRemove(0.1)

    self.speed_x = -3
    self.friction = 0.05

    self.alpha = 2
    self.spin = 10
end

function SpareSparkle:update(dt)
    self.rotation = self.rotation + math.rad(self.spin) * DTMULT

    super:update(self, dt)
end

return SpareSparkle