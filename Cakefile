fs = require 'fs-extra'
path = require 'path'

{print} = require 'util'
{spawn} = require 'child_process'

option '-t', '--targetDir [TARGET_DIR]', 'Target directory for deployment, default: undefined'
option '-s', '--sourceDir [SRC_DIR]', 'Directory containing the source files, default: src'

coffeeExecutable = if process.platform is 'win32' then 'coffee.cmd' else 'coffee'

build = (options, callback) ->
    console.log 'Building...'
    coffee = spawn coffeeExecutable,
        ['-c', '-b', '-o', 'lib'
         options.sourceDir or 'src']
    coffee.stderr.on 'data', (data) ->
        process.stderr.write data.toString()
    coffee.stdout.on 'data', (data) ->
        print data.toString()
    coffee.on 'exit', (code) ->
        callback?() if code is 0

deploy = (options) ->
    build options, ->
        if options.targetDir?
            console.log "Deploying to #{options.targetDir}..."
            for file in fs.readdirSync 'lib'
                fileWithPath = path.resolve 'lib', file
                fs.copySync fileWithPath, "#{options.targetDir}/#{file}"
        else
            console.log "No target directory specified"

task 'build', 'Build .js from .coffee', (options) ->
    build options

task 'deploy', 'Build, then deploy lib/ contents to target folder', (options) ->
    deploy options

task 'deploy_local', 'Deploy to local private server (single player)', (options) ->
    options.targetDir = 'C:\\Users\\Johannes\\AppData\\Local\\Screeps\\scripts\\127_0_0_1___21025\\default'
    deploy options
