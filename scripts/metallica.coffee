# Description:
#   Metallica
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   master of puppets - Display animated Metallica 
#
# Author:
#   matt

metallicas = [
  "http://images4.fanpop.com/image/photos/20000000/gifs-metallica-20051260-500-325.gif"
  "http://data.whicdn.com/images/28654827/tumblr_lxjmx7Fz231r5j9pco1_500_large.gif"
  "http://favim.com/image/372918/"
  "http://37.media.tumblr.com/053d9292392adefe7bb749f8cd2e9a4e/tumblr_mhaqmenGkM1rnqwsco2_400.gif"
  "http://37.media.tumblr.com/8c377f5f4a7f236a1096a3fbcb325ea2/tumblr_mhc5q5WEAI1rpzymeo1_250.gif"
  "http://37.media.tumblr.com/3f3f05ef75046b4aa2e9e35349919a2e/tumblr_mi4dhgqneO1s5dmszo1_500.gif"
  "http://37.media.tumblr.com/ee97aca5e2f7cd961cd732336f1aa951/tumblr_mgn3ffwK8w1qmti6wo1_500.gif"
  "http://31.media.tumblr.com/0d25e8d31c12275a3feb7148f4a7f8f1/tumblr_mftizaPWek1rpzymeo1_500.gif"
]

module.exports = (robot) ->
  robot.hear /\b(master of puppets)|(puppet master)\b/i, (msg) ->
    msg.send msg.random metallicas

