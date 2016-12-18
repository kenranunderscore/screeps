module.exports =
    run: (creep) ->
        if creep.carry.energy < creep.carryCapacity
            sources = creep.room.find FIND_SOURCES
            if creep.harvest(sources[0]) is ERR_NOT_IN_RANGE
                creep.moveTo sources[0]
        else
            if creep.upgradeController(creep.room.controller) is ERR_NOT_IN_RANGE
                creep.moveTo creep.room.controller
