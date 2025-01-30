local function SendPlayerToApt()
  local interior = GetInteriorAtCoords(Config.aptIPLCoords)
  LoadInterior(interior)
  RefreshInterior(interior)

  TriggerServerEvent('tw-bucket:server:sendPlayerToApt')

  local plr = PlayerPedId()
  SetEntityCoords(plr, Config.SpawnCoords.x, Config.SpawnCoords.y, Config.SpawnCoords.z, true, false, false, false)
  SetEntityHeading(plr, Config.SpawnCoords.w)
end

local function LeaveApartment()
  TriggerServerEvent('tw-bucket:server:resetPlayerBucket')

  local plr = PlayerPedId()
  SetEntityCoords(plr, Config.EnterCoords.x, Config.EnterCoords.y, Config.EnterCoords.z, true, false, false, false)
  SetEntityHeading(plr, Config.EnterCoords.w)
end

Citizen.CreateThread(function()
  exports.ox_target:addBoxZone ({
    coords = Config.EnterCoords.xyz,
    size = vec3(1, 1, 3),
    name = 'apt_enter_test',
    debug = Config.Debug,

    options = {{
      distance = 1.5,
      icon = '',
      label = 'Enter Apartment',
      onSelect = function ()
        SendPlayerToApt()
      end
    }}
  })
  exports.ox_target:addBoxZone({
    coords = Config.SpawnCoords.xyz,
    size = vec3(1, 1, 3),
    name = 'apt_leave_test',
    debug = Config.Debug,

    options = { {
      distance = 1.5,
      icon = '',
      label = 'Leave Apartment',
      onSelect = function()
        LeaveApartment()
      end
    } }
  })
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
end)

AddEventHandler('onResourceStart', function(resource)
  if resource ~= GetCurrentResourceName() then return end
end)

AddEventHandler('onResourceStop', function(resource)
  if resource ~= GetCurrentResourceName() then return end
end)