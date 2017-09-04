# Description:
#   Ghostbusters!
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
  robot.respond /who you gonna call\?/i, (msg) ->
    msg.send "Ghostbusters!"

    