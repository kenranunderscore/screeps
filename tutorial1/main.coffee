# Game.spawns['Spawn1'].createCreep [WORK, CARRY, MOVE], 'Harvester1'

roleHarvester = require 'role.harvester'

module.exports.loop = ->
	for name in Game.creeps
		creep = Game.creeps[name]
		roleHarvester.run(creep)