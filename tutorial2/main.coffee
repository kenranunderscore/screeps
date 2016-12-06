# Game.spawns['Spawn1'].createCreep [WORK, CARRY, MOVE], 'Upgrader1'

# Game.creeps['Harvester1'].memory.role = 'harvester';
# Game.creeps['Upgrader1'].memory.role = 'upgrader';

roleHarvester = require 'role.harvester'
roleUpgrader = require 'role.upgrader'

module.exports.loop = ->
	for name in Game.creeps
		creep = Game.creeps[name]
		roleHarvester.run creep if creep.memory.role is 'harvester'
		roleUpgrader.run creep if creep.memory.role is 'ugrader'