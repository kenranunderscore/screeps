roleHarvester = require 'role.harvester'
roleUpgrader = require 'role.upgrader'
roleBuilder = require 'role.builder'

module.exports.loop = ->
    tower = Game.getObjectById 'b4f0504a9fb2fde82816a965'
    if tower
        closestDamagedStructure = tower.pos.findClosestByRange FIND_STRUCTURES, filter: (structure) ->
            structure.hits < structure.hitsMax
        tower.repair closestDamagedStructure if closestDamagedStructure
        closestHostile = tower.pos.findClosestByRange FIND_HOSTILE_CREEPS
        tower.attack closestHostile if closestHostile

    for name, creep of Game.creeps
        roleHarvester.run creep if creep.memory.role is 'harvester'
        roleBuilder.run creep if creep.memory.role is 'builder'
        roleUpgrader.run creep if creep.memory.role is 'upgrader'
