# Description:
#   An echo mode for debugging
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# URLS:
#   None
module.exports = (robot) ->
  robot.brain.set 'echo_mode', 'off'
  robot.respond /toggle echo/, (msg) ->
    if robot.brain.get('echo_mode') == 'off'
      msg.reply 'Echo mode is on'
      robot.brain.set 'echo_mode', 'on'
    else
      msg.reply 'Echo mode is off'
      robot.brain.set 'echo_mode', 'off'

  robot.hear /^.*$/, (msg) ->
    if robot.brain.get('echo_mode') == 'on'
      msg.send msg.message.text