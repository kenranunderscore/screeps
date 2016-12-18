module.exports =
    run: (creep) ->
        if creep.carry.energy < creep.carryCapacity
            sources = creep.room.find FIND_SOURCES
            if creep.harvest(sources[0]) is ERR_NOT_IN_RANGE
                creep.moveTo sources[0]
        else
            spawn = Game.spawns['Spawn1']
            if creep.transfer(spawn) is ERR_NOT_IN_RANGE
                creep.moveTo spawn
