# Game.spawns['Spawn1'].createCreep [WORK, CARRY, MOVE], 'Harvester1'

roleHarvester = require 'role.harvester'

module.exports.loop = ->
	for name, creep of Game.creeps
        roleHarvester.run creep
