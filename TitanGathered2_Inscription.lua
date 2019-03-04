TITAN_INSCRIPTION_ID = "Inscription"
tgiPluginDb = {}

TitanGathered2_Inscription = {}
-- Reduce the chance of functions and variables colliding with another addon.
local tgi = TitanGathered2_Inscription
local infoBoardData = {}
local tg = TitanGathered2

tgi.id = TITAN_INSCRIPTION_ID
tgi.addon = "TitanGathered2_Inscription"
tgi.email = "bajtlamer@gmail.com"
tgi.www = "www.rrsoft.cz"

--  Get data from the TOC file.
tgi.version = tostring(GetAddOnMetadata(tgi.addon, "Version")) or "Unknown"
tgi.author = tostring(GetAddOnMetadata(tgi.addon, "Author")) or "Unknown"


for _, _category in pairs(TGI_PLUGIN_CATEGORIES) do
    table.insert(TG_CATEGORIES, _category)
end


function tgi.Button_OnLoad(self)
	echo(tgi.addon.." ("..TitanUtils_GetGreenText(tgi.version).."|cffff8020) loaded! Created By "..tgi.author)
    tgi.registerPlugin()
    tgi.registerPluginMinable()
end


function tgi.registerPlugin()
    table.insert(tgPlugins, tgic)
end


function tgi.registerPluginMinable()
    for _, _m in pairs(TGI_MINABLES)do
        table.insert(TG_MINABLES, _m)
    end
end

-- Event
function tgi.Button_OnEvent(self, event)
    -- EMPTY
end


function tgi.getGatherableSourceObject(objectId)
    for _, _m in pairs(TGI_MINABLES) do
        if (_m.id == objectId) then
            return _m
        end
    end
    return {id = objectId, name = nil}
end
