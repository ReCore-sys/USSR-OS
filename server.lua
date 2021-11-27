component = require("component")
function getid()
    return component.list()
    
end

print("Initialising...")
json = require "json"
IDFILE = io.open("ids.json", "r")
if IDFILE then
    ids = json.decode(IDFILE:read("*all"))
    IDFILE:close()
else
    ids = {}
    IDFILE:close()
end

print(getid())

