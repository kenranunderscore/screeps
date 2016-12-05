fs = require 'fs'

{print} = require 'util'
{spawn} = require 'child_process'

coffeeExecutable = if process.platform == 'win32' then 'coffee.cmd' else 'coffee'

build = (callback) ->
  coffee = spawn coffeeExecutable, ['-c', '-o', 'lib', 'src']
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()
  coffee.on 'exit', (code) ->
    callback?() if code is 0
	
task 'build', 'Build lib/ from src/', ->
  build()