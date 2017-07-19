# Description:
#   Beep
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
  robot.hear /beep beep/i, (msg) ->
    msg.send "https://s3-eu-west-1.amazonaws.com/uploads-eu.hipchat.com/48569/756403/1q7TJaJ8lhde4tz/Screen%20Shot%202015-06-01%20at%2009.59.24.png"

    