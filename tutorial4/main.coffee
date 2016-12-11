roleHarvester = require 'role.harvester'
roleUpgrader = require 'role.upgrader'

module.exports.loop = ->
    for name of Memory.creeps
        if not Game.creeps[name]?
            delete Memory.creeps[name]
            console.log "Clearing non-existent memory for creep #{name}"

    harvesters = _.filter(Game.creeps, (creep) -> creep.memory.role == 'harvester')
    console.log "Harvesters: #{harvesters.length}"

    if harvesters.length < 2
        name = Game.spawns['Spawn1'].createCreep [WORK, CARRY, MOVE], undefined, role: 'harvester'
        console.log "Spawning new harvester: #{name}"

    for name, creep of Game.creeps
        roleHarvester.run creep if creep.memory.role == 'harvester'
        roleUpgrader.run creep if creep.memory.role == 'upgrader'
