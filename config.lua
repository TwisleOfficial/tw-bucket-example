Config = {}

Config.Debug = true

Config.aptIPLCoords = vec3(-787.7805, 334.9232, 215.8384)

Config.EnterCoords = vec4(-775.13, 313.15, 85.7, 356.51)

Config.SpawnCoords = vec4(-787.37, 315.66, 217.64, 268.88)
 
function dbug(...)
  if Config.Debug then print('^3[DEBUG]^7', ...) end
end
