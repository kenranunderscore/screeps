role_harvester = require 'role_harvester'

module.exports.loop = ->
    for creepName, creep of Game.creeps
        role_harvester.run creep
