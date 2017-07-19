# Description:
#   Sad Robot
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

sads = [
  "http://www.pinkjooz.com/wp-content/uploads/2013/01/sad-robot.jpg"
  "http://media.tumblr.com/tumblr_lhfstoTssY1qd88jc.gif"
  "http://levantium.com/wp-content/uploads/2012/03/2010-08-12-Sad-Robot.jpg"
  "http://media-cache-ak0.pinimg.com/236x/7a/71/04/7a7104fd0f6eb4b39cacf05dda329ee3.jpg"
  "http://media.jefita.com/files/img/primary_image_78.jpeg"
  "http://fc02.deviantart.net/fs71/i/2010/124/d/1/Sad_Robot_by_VEisenmann.jpg"
  "http://fc05.deviantart.net/fs71/i/2010/318/d/0/lil_sad_bot_by_dominguezr-d32vwv9.jpg"
]

module.exports = (robot) ->
  robot.hear /poor marvin/i, (msg) ->
    msg.send msg.random sads