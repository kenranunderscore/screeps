role_harvester = require 'role_harvester'
role_upgrader = require 'role_upgrader'

module.exports.loop = ->
    for creepName, creep of Game.creeps
        role_harvester.run creep if creep.memory.role is 'harvester'
        role_upgrader.run creep if creep.memory.role is 'upgrader'
