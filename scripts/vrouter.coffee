# Vrouter failover alerts
#
# Every five minutes Marvin checks the number of vrouter failovers from the last ten minutes.
# If the number is higher than 10 it sends a message to the #support channel and pms some others
#
hostname = process.env.HUBOT_ELASTIC_HOST
module.exports = (robot) ->
  cronJob = require('cron').CronJob
  tz = 'Europe/London'
  new cronJob('0 */5 * * * *', (() -> EveryFiveMinutes(robot)), null, true, tz)
  EveryFiveMinutes = (robot) ->
    query = """ {"sort": { "@timestamp": {"order" : "desc"}},"from": 0, "size" : 30,"_source": "message","query": {"bool": {"filter": [{ "range": { "@timestamp": { "gt": "now-10m"}}},{ "term": { "type": "neutron_state_change" }},{ "term": { "message": "wrote" }}]}}} """
    tixcurlhack = require "child_process"
    tixcurlhack.exec "curl -XGET '#{hostname}:9200/_all/_search?' -H 'Content-Type: application/json' -d'#{query}' ", (error, stdout, stderr) ->
      if error
        res.send "Error: #{error.code} - #{stderr}"
      else
        jsonresponsedata = JSON.parse stdout
        counter = "#{jsonresponsedata.hits.total}"
        if counter > 10
          robot.messageRoom '#support',"The number of vrouter failovers in the last ten minutes is", "#{counter}"
          counter = --counter
          output = "There you go:\n"
          while counter >=0
            output = output + "#{jsonresponsedata.hits.hits[counter]._source.message}\n"
            counter = --counter
          robot.messageRoom '#support', "\`\`\` #{output}\`\`\`"
          robot.messageRoom('@matt', 'The number of vrouter failovers in the last ten minutes is", "#{counter}')
          robot.messageRoom('@matt', "\`\`\` #{output}\`\`\`")
