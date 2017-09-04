# Description:
#   FU
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   

fucks = [
          "http://3.bp.blogspot.com/-cAuTulCwNDg/T8gEhvXbhlI/AAAAAAAACf4/YzrNBhETCoQ/s1600/office_space_Jennifer_Aniston_flair_button.gif"
          "https://carwreckdebangs.files.wordpress.com/2014/06/rik-mayall.jpg"
        ]

module.exports = (robot) ->
  robot.hear /fuck off marvin/i, (msg) ->
    msg.send msg.random fucks

  robot.hear /f\*ck off marvin/i, (msg) ->
    msg.send msg.random fucks

  robot.hear /f\*\*k off marvin/i, (msg) ->
    msg.send msg.random fucks