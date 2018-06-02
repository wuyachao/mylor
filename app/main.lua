local app = require("app.server") -- 1.执行app文件夹下的server文件，返回app对象
local helper = require "tools.helper"
helper:print_r("main:")
app:run() -- 2.执行app方法的run函数
