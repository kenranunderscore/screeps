roleHarvester = require 'role_harvester'
roleUpgrader = require 'role_upgrader'

minimumNumberOfHarvesters = 10

module.exports.loop = ->
    for creepName, creep of Game.creeps
        roleHarvester.run creep if creep.memory.role is 'harvester'
        roleUpgrader.run creep if creep.memory.role is 'upgrader'

    harvesterCount = _.sum(Game.creeps, (c) => c.memory.role is 'harvester')
    console.log "Number of harvesters: #{harvesterCount}"

    if harvesterCount < minimumNumberOfHarvesters
        newName = Game.spawns['Spawn1'].createCreep [WORK, WORK, CARRY, MOVE], undefined, role: 'harvester'
        console.log "Spawned new harvester: #{newName}" if newName?
    else
        newName = Game.spawns['Spawn1'].createCreep [WORK, CARRY, MOVE, MOVE], undefined, role: 'upgrader'
        console.log "Spawned new upgrader: #{newName}" if newName?
