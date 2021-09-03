local Tinkr = ...
local ObjectManager = Tinkr.Util.ObjectManager
local Common = Tinkr.Common
local Draw = Tinkr.Util.Draw:New()
local BoundRemnant = {
    157561,
    169480, 
    169666, 
    169783, 
    169902, 
    169782, 
    169785, 
    178629, 
    180672,
    169662,
    169663,
    180775, 
    169635, 
    169640, 
    169716, 
    169717, 
    169787, 
    169641, 
    169628, 
    180774
}
local Anima = {
    357344, 
    336799, 
    369112, 
    369114, 
    323351, 
    324031, 
    336801,
    164906, 
    181630, 
    181635, 
    181627, 
    181632, 
    178453,
    325740, 
    338483,
    324030
}
local Ashen = {
    167986,
    164698,
    178523,
    179882,
    179514,
    165533,
    167987,
    165523,
    170525
}
Draw:Sync(function(draw)
    if GetMapID() ~= 2162 then return end
    for object in ObjectManager:Objects() do
        local px,py,pz = ObjectPosition("player")
        --Destroy Ashen Phly...something
        for i=1,#Ashen do
            if ObjectId(object) == Ashen[i] then
                local ox,oy,oz = ObjectPosition(object)
                if FastDistance(px,py,pz,ox,oy,oz) <= 5 then
                    ObjectInteract(object)
                end
            end
        end
        --Coil of Rope
        if ObjectId(object) == 349591 then
            local ox,oy,oz = ObjectPosition(object)
            local dist = FastDistance(px,py,pz,ox,oy,oz)
            draw:Text((ObjectName(object)) .. " (" .. Common.Round(dist, 1) .. ")", "SourceCodePro", ox,oy,oz + 1)
        end
        --Grapple Point
        if ObjectId(object) == 166360 then
            local ox,oy,oz = ObjectPosition(object)
            local dist = FastDistance(px,py,pz,ox,oy,oz)
            draw:Text((ObjectName(object)) .. " (" .. Common.Round(dist, 1) .. ")", "SourceCodePro", ox,oy,oz + 1)
        end
        --Interact BoundRemnant
        for i=1,#BoundRemnant do
            if ObjectId(object) == BoundRemnant[i] and GetUnitSpeed("player") == 0 then
                local ox,oy,oz = ObjectPosition(object)
                if FastDistance(px,py,pz,ox,oy,oz) <= 6 then
                    ObjectInteract(object)
                end
            end
        end
        --Lever
        if ObjectId(object) == 166660 then
            local ox,oy,oz = ObjectPosition(object)
            local dist = FastDistance(px,py,pz,ox,oy,oz)
            draw:Text((ObjectName(object)) .. " (" .. Common.Round(dist, 1) .. ")", "SourceCodePro", ox,oy,oz + 1)
        end
        --Rune Locked Vault
        if ObjectId(object) == 164624 then
            local ox,oy,oz = ObjectPosition(object)
            local dist = FastDistance(px,py,pz,ox,oy,oz)
            draw:Text((ObjectName(object)) .. " (" .. Common.Round(dist, 1) .. ")", "SourceCodePro", ox,oy,oz + 1)
            draw:SetWidth(2)
            draw:SetAlpha(150)        
            draw:Circle(ox,oy,oz,3)
        end
        --Lever Locked Chest
        if ObjectId(object) == 291046 then
            local ox,oy,oz = ObjectPosition(object)
            local dist = FastDistance(px,py,pz,ox,oy,oz)
            draw:Text("Left to Right: 1213-1214-1213-121", "SourceCodePro", ox,oy,oz + 3)
            draw:Text((ObjectName(object)) .. " (" .. Common.Round(dist, 1) .. ")", "SourceCodePro", ox,oy,oz + 1)
        end
        --Spectral Bound Chest
        if ObjectId(object) == 164542 then
            local ox,oy,oz = ObjectPosition(object)
            local dist = FastDistance(px,py,pz,ox,oy,oz)
            draw:Text((ObjectName(object)) .. " (" .. Common.Round(dist, 1) .. ")", "SourceCodePro", ox,oy,oz + 1)
        end
        --Spectral Key
        if ObjectId(object) == 164549 then
            local ox,oy,oz = ObjectPosition(object)
            local dist = FastDistance(px,py,pz,ox,oy,oz)
            draw:Text((ObjectName(object)) .. " (" .. Common.Round(dist, 1) .. ")", "SourceCodePro", ox,oy,oz + 1)
        end
        --Anima Draw
        for i=1,#Anima do
            if ObjectId(object) == Anima[i] and ObjectLootable(object) then
                local ox,oy,oz = ObjectPosition(object)
                local dist = FastDistance(px,py,pz,ox,oy,oz)
                draw:Text((ObjectName(object)) .. " (" .. Common.Round(dist, 1) .. ")", "SourceCodePro", ox,oy,oz + 1)
                draw:SetWidth(2)
                draw:SetAlpha(150)        
                draw:Circle(ox,oy,oz,3)
            end
        end
    end
end)
Draw:Enable()
