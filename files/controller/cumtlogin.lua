module("luci.controller.cumtlogin", package.seeall)

function index()
    entry({"admin", "services", "cumtlogin"}, cbi("cumtlogin"), _("矿大校园网"), 1)
end