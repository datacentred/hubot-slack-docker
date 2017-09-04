# Description:
#   Ponysay for hipchat
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot ponysay message

module.exports = (robot) ->
  robot.respond /ponysay (.*)/i, (msg) ->
    text = msg.match[1]
    msg.http("http://pony.datacentred.io?say=#{encodeURI(text)}")
      .get() (err, res, body) ->
        msg.send body
