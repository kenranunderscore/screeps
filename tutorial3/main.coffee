# Game.spawns['Spawn1'].createCreep [WORK, CARRY, MOVE], 'Builder1', { role: 'builder' }

roleHarvester = require 'role.harvester'
roleBuilder = require 'role.builder'

module.exports.loop = ->
    for name, room of Game.rooms
        console.log "Room #{name} has #{room.energyAvailable} energy."

    for name, creep of Game.creeps
        roleHarvester.run creep if creep.memory.role is 'harvester'
        roleBuilder.run creep if creep.memory.role is 'builder'
