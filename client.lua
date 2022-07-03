local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
PdeF = Tunnel.getInterface("script_bang")


CreateThread(function()
    while true do
         Wait(5)
         local ped = PlayerPedId()
         local player = GetEntityCoords(ped)
         local blip = vector3(90.58,-1990.08,20.42)   -- 90.58,-1990.08,20.42  localização do blip 
         local distancia = #(player - blip)
         if distancia <= 4 then
            DrawMarker(20, blip.x, blip.y , blip.z, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255, 255, 255, 255, 1, 0, 2, 0 )
            DrawText3D(blip.x, blip.y, blip.z + 0.50,"APERTE ~g~E~w~  PARA CRIAR") -- DIGITE A AÇÃO DESEJADA NO LUGAR "PARA CRIAR"
            if IsControlJustPressed(0,38) then
                if PdeF.checkItem() then
                    TriggerEvent("Progress",10000,"craiando...")
                    vRP.playAnim(false,{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"},true)
                    Wait(10000)
                    ClearPedTasks(ped)
                    PdeF.checkPayment()
                end
            end
         end
     end
end)

function DrawText3D(x,y,z,text)
    local onScreen,_x,_y = GetScreenCoordFromWorldCoord(x,y,z)
    if onScreen then
        BeginTextCommandDisplayText("STRING")
        AddTextComponentSubstringKeyboardDisplay(text)
        SetTextColour(255,255,255,150)
        SetTextScale(0.35,0.35)
        SetTextFont(4)
        SetTextCentre(1)
        EndTextCommandDisplayText(_x,_y)
        
        local width = string.len(text) / 160 * 0.45
        DrawRect(_x,_y + 0,1,width,0,0,0,0,150)
    end
end