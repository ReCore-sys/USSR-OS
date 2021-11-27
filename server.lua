component = require("component")
function getid()
    return component.list()
    
end

print("Initialising...")
json = require "json"
idfile = io.open("ids.json", "r")
if idfile then
    ids = json.decode(idfile:read("*all"))
    idfile:close()
else
    ids = {}
    idfile:close()
end

print(getid())

