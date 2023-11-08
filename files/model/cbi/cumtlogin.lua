require("luci.sys")


m = Map("cumtlogin", translate("校园网自动登录"), translate("Auto login in to CUMT School Network in the morning. Powered by J1an"))

s = m:section(TypedSection, "server","用户配置")
s.addremove = false
s.anonymous = true


enable = s:option(Flag, "enable", translate("Enable"))

username = s:option(Value, "username", translate("Username"))
pass = s:option(Value, "password", translate("Password"))
pass.password = true

nettype=s:option(ListValue, "nettype", translate("上网类型"))
nettype:value("@cmcc", translate("China Mobile"))
nettype:value("@unicom", translate("China Unicom"))
nettype:value("@telecom", translate("China Telecom"))
nettype:value("", translate("SchoolNet"))

domain = s:option(Value, "domain", translate("测试主机"))

testtime = s:option(Value, "testtime", translate("测试时间"))

testfunc = s:option(ListValue, "testfunc", translate("测试方法"))
testfunc:value("ping", translate("ping"))
testfunc:value("curl", translate("curl"))

local apply = luci.http.formvalue("cbi.apply")
if apply then
    io.popen("/etc/init.d/cumtlogin restart > /dev/null &")
end

return m