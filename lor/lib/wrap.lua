local setmetatable = setmetatable

local _M = {}

-- 6.__call元方法执行create_app(),也就是调用createApplication()方法，返回一个实例，然后删除
-- 实现创建的实例只存在于当前请求，即每个请求都会生成一个app实例

function _M:new(create_app, Router, Group, Request, Response)
    local instance = {}
--    instance.router = Router
    instance.group = Group
--    instance.request = Request
--    instance.response = Response
    local helper = require "tools.helper"
    helper:print_r("wrap:new")
    instance.fn = create_app
    instance.app = nil
    setmetatable(instance, {
        __index = self,
        __call = self.create_app
    })

    return instance
end

-- Generally, this should only be used by `lor` framework itself.
function _M:create_app(options)
    local helper = require "tools.helper"
    helper:print_r("wrap:create_app")
    self.app = self.fn(options)
    return self.app
end
--
function _M:Router(options)
    return self.group:new(options)
end

--function _M:Request()
--    return self.request:new()
--end
--
--function _M:Response()
--    return self.response:new()
--end

return _M
