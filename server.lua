local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
PdeF = {}
Tunnel.bindInterface("script_bang",PdeF)

item = "item01"
item2 = "item02"

function PdeF.checkItem()
    local user_id = vRP.getUserId(source)
    if vRP.getInventoryItemAmount(user_id, "item01") >= 10 and vRP.getInventoryItemAmount (user_id,"item02") >= 10 then
        return true    
    else
        TriggerClientEvent("Notify",source,"vermelho","Você precisa de 10 item01 e 10 item02 para criar.",5000)
    end
end

function PdeF.checkPayment()
    local qtd = 10 -- quantidade de item01 e de item02 que irar ser tirado e recebido do inventario
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        vRP.upgradeStress(user_id,1)
        vRP.removeInventoryItem(user_id, "item01", qtd,true)
        vRP.removeInventoryItem(user_id, "item02", qtd,true)
        vRP.giveInventoryItem(user_id,"item03", qtd,true) -- troque o "item03" pelo nome do item que sera criado
    end
end