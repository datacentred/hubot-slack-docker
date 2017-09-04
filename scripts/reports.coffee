# Description:
#   Reports, please
# Dependencies:
#   None
#
module.exports = (robot) ->

  robot.hear /reports/i, (msg) ->
    name = msg.message.user.name.toLowerCase()
    time = new Date
    if (!!~ name.indexOf "jarvis")
      msg.reply "http://33.media.tumblr.com/d0d096f3814170a77412a279f0c42613/tumblr_inline_nesrgoa1HY1raprkq.gif"
