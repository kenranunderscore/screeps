fs = require 'fs-extra'
path = require 'path'

{print} = require 'util'
{spawn} = require 'child_process'

coffeeExecutable = if process.platform is 'win32' then 'coffee.cmd' else 'coffee'

build = (callback) ->
    coffee = spawn coffeeExecutable, ['-c', '-o', 'lib', 'src']
    coffee.stderr.on 'data', (data) ->
        process.stderr.write data.toString()
    coffee.stdout.on 'data', (data) ->
        print data.toString()
    coffee.on 'exit', (code) ->
        callback?() if code is 0

deploy = ->
    build ->
        for file in fs.readdirSync 'lib'
            fileWithPath = path.resolve 'lib', file
            fs.copySync fileWithPath, 'tmp/' + file

task 'build', 'Build lib/ from src/', ->
    build()

task 'deploy', 'Build, then deploy lib/ contents to target folder', ->
    deploy()