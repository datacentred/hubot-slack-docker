module.exports = (robot) ->
  zap = "https://pbs.twimg.com/media/B7a0ZegIUAEBqeV.jpg"
  robot.hear /zap/i, (msg) ->
    msg.send zap
  robot.hear /laser/i, (msg) ->
    msg.send zap
  robot.hear /hypnotise/i, (msg) ->
    msg.send zap