-- CUSTOM CODE
local RSGCore = exports['rsg-core']:GetCoreObject()

local newsstands = {"p_cs_newspaper_02x_noanim","p_newspapergroup02x","p_group_newspaper02","p_newspaperlivestock01x", 
                    "p_group_newspaper03","p_group_newspaper04","p_group_newspaperstack",}

local newspaper = CreateObject(GetHashKey("prop_cliff_paper"), 0, 0, 0, true, true, true)

local function AddItemToNewsStand(storyType, paper, paperIcon, stands)
    exports['rsg-target']:AddTargetModel(stands, {
        options = {{
            label = paper,
            icon = paperIcon,
            action = function(entity)

                if IsPedAPlayer(entity) then
                    return false
                end

                TriggerServerEvent('newspaper:buy', storyType)
                TriggerEvent('animations:client:EmoteCommandStart', {"pickup"})
            end
        }},
        distance = 1.5
    })
end

AddItemToNewsStand('newspaper', Config.BuyNewspaperText, Config.BuyNewspaperIcon, newsstands)

RegisterNetEvent('newspaper:client:openNewspaper', function()
    RequestAnimDict("missfam4")
    SetNuiFocus(true, true)
    RSGCore.Functions.TriggerCallback('newspaper:server:getStories',
        function(news, jail, isReporter, reporterLevel, reporterOnDuty, playerName)
            SendNUIMessage({
                stories = news,
                sentences = jail,
                isReporter = isReporter,
                reporterLevel = reporterLevel,
                reporterOnDuty = reporterOnDuty,
                playerName = playerName
            })
        end)

    while not HasAnimDictLoaded("missfam4") do
        Citizen.Wait(5)
    end

    TaskPlayAnim(PlayerPedId(), "missfam4", "base", 3.0, 2.0, -1, 33, 0.0, false, false, false)
    AttachEntityToEntity(newspaper, PlayerPedId(), GetPedBoneIndex(GetPlayerPed(-1), 18905), 0.26, 0.06, 0.16, 320.0,
        310.0, 0.0, true, true, false, true, 1, true)


end)

RegisterNUICallback('publishStory', function(data)
    TriggerServerEvent('newspaper:server:publishStory', data)
end)

RegisterNUICallback('updateStory', function(data)
    TriggerServerEvent('newspaper:server:updateStory', data)
end)

RegisterNUICallback('deleteStory', function(data)
    TriggerServerEvent('newspaper:server:deleteStory', data)
end)

RegisterNUICallback('newspaper:client:closeNewspaper', function(_, cb)
    cb({})
    SetNuiFocus(false, false)
    ClearPedTasks(PlayerPedId())
    Wait(200)
    DeleteObject(newspaper)
end)

