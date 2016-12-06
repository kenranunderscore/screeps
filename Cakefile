fs = require 'fs-extra'
path = require 'path'

{print} = require 'util'
{spawn} = require 'child_process'

coffeeExecutable = if process.platform == 'win32' then 'coffee.cmd' else 'coffee'

build = ->
    coffee = spawn coffeeExecutable, ['-c', '-o', 'lib', 'src']
    coffee.stderr.on 'data', (data) ->
        process.stderr.write data.toString()
    coffee.stdout.on 'data', (data) ->
        print data.toString()

deploy = ->
    for file in fs.readdirSync 'lib'
        fileWithPath = path.resolve 'lib', file
        fs.copySync fileWithPath, 'tmp/' + file

task 'build', 'Build lib/ from src/', ->
    build()

task 'deploy', 'Deploy lib/ contents to target folder', ->
    deploy()