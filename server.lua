
function getid()
    component = require("component")
    return component.list()
end

function file_exists(name)
    local f=io.open(name,"r")
    if f~=nil then io.close(f) return true else return false end
 end

print("Initialising...")
json = require "json"
if file_exists("ids.json") then
    IDFILE = io.open("ids.json", "r")
    ids = json.decode(IDFILE:read("*all"))
    IDFILE:close()
else
    ids = {}
end

print(getid())

