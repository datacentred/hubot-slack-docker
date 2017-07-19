# Description:
#   Daddy?
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
  robot.respond /who\'s your daddy\?/i, (msg) ->
    msg.send "http://www.rutherfordjournal.org/images/TAHC_Turing_1B.jpg"

    