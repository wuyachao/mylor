local type = type

local version = require("lor.version")
local Group = require("lor.lib.router.group")
local Router = require("lor.lib.router.router")
local Request = require("lor.lib.request")
local Response = require("lor.lib.response")
local Application = require("lor.lib.application")
local Wrap = require("lor.lib.wrap")

LOR_FRAMEWORK_DEBUG = true

-- 5.index文件new一个lor对象，lor()就是执行createApplication创建一个实例，且加载路由，请求回应
-- 7.实例化一个Application对象然后返回出来，执行初始化等操作

local createApplication = function(options)
    if options and options.debug and type(options.debug) == 'boolean' then
        LOR_FRAMEWORK_DEBUG = options.debug
    end
    local helper = require "tools.helper"
    helper:print_r("index:createApplication")
    local app = Application:new()
    app:init(options)

    return app
end

local lor = Wrap:new(createApplication, Router, Group, Request, Response)
lor.version = version

return lor
