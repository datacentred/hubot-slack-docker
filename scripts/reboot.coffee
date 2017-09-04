# Description:
#   Allows rebooting of Marvin from Hipchat
#
# Dependencies:
#   None
#
# Commands:
#   hubot reboot
#
module.exports = (robot) ->

  sys = require 'sys'
  exec = require('child_process').exec

  puts = (error, stdout, stderr) ->
    robot.logger.error error
    sys.puts stdout

  delay = (ms, func) ->
    setTimeout func, ms

  robot.respond /reboot/i, (msg) ->
    robot.logger.info "Rebooting..."
    msg.reply "Rebooting..."
    delay 1000, ->
      exec("sudo restart marvin", puts)
