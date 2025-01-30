local aptInUse = 1

RegisterNetEvent('tw-bucket:server:sendPlayerToApt', function ()
  local src = source

  aptInUse = aptInUse + 1

  SetPlayerRoutingBucket(src, aptInUse)
end)

RegisterNetEvent('tw-bucket:server:resetPlayerBucket', function()
  local src = source
  SetPlayerRoutingBucket(src, 0)
end)



RegisterCommand('bucket', function(source)
  dbug(GetPlayerRoutingBucket(source))
end, false)
