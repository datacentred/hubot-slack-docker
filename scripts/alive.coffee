# Description:
#   It's alive!
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
  robot.respond /it\'s alive/i, (msg) ->
    msg.send "http://media.tumblr.com/3e41b50d68cb91be270dba49a3debf36/tumblr_inline_mkdredxqV31qz4rgp.gif"
