Timer = {}
Timer.__index = Timer

function Timer:new(duration)
  local instance = setmetatable({},Timer)
  instance.duration = duration
  instance.elapsed = 0
  instance.running = true
  return instance
end

function Timer:update(dt)
  if self.running then
    self.elapsed = self.elapsed + dt
    if self.elapsed >= self.duration then
      print("dfsx")
      self.running = false
    end
  end
end

