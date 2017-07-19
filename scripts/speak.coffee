# Description:
#   Allows marvin to be instructed to speak on a specific channel
# Dependencies:
#   None
#
# Commands:
#   hubot speak <message>
#
module.exports = (robot) ->

  robot.respond /speak (.+) (.+)$/i, (msg) ->
    robot.messageRoom msg.match[1], msg.match[2]