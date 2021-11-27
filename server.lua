
component = require("component")

function table_contains(table, element)
    for _, value in pairs(table) do
      if value == element then
        return true
      end
    end
    return false
  end

function getid()
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
    ids = json.decode(IDFILE:read("a"))
    IDFILE:close()
else
    ids = {}
end
print("Initialised")
ownid = getid()

parts = {}
partids = {}

for k,v in pairs(ownid) do
    print(k,v)
    table.insert(parts, v)
    table.insert(partids, k)
end

stringform = table.concat(parts, "-")
stringform = stringform:gsub("-", "")

if table_contains(parts, "data") then
    print("Using data card")
    hashed = component.data.sha256(stringform)

else
    print("No data card found, falling back to Lua hashing")
    if not file_exists("/lib/sha2/lua") then
        print("SHA256 not installed, installing now")
        os.execute("wget https://raw.githubusercontent.com/Egor-Skriptunoff/pure_lua_SHA/master/sha2.lua -O /lib/sha2.lua")
    end
    local sha = require("sha2")
    hashed = sha.sha256(stringform)
end
print("Your ID is: " .. hashed)


