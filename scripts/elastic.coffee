# Elastic thingy
#
# Commands:
#   marvin show log <type> on <host> <x> - shows the last x lines of a specific log on a given host. Defaults to 10.
#   marvin show requid <> from <> - shows the messages containing a given request_id from a service (eg. nova_api). If no service given, it lists all (up to 30 entries).
#
hostname = process.env.HUBOT_ELASTIC_HOST
module.exports = (robot) ->
  robot.respond /show log (\S+) on (\S+) (\d+)$/i, (res) ->
    type = res.match[1]
    host = res.match[2]
    times = res.match[3]
    times = ++times
    query = """ {"sort": { "@timestamp": {"order" : "desc"}},"from": 0, "size" : "#{times}","_source": "message","query": {"bool": {"filter": [{ "term": { "type": "#{type}" }},{ "term": { "host": "#{host}" }}]}}} """
    tixcurlhack = require "child_process"
    tixcurlhack.exec "curl -XGET '#{hostname}:9200/_all/_search?' -H 'Content-Type: application/json' -d'#{query}' ", (error, stdout, stderr) ->
      if error
        res.send "Error: #{error.code} - #{stderr}"
      else
        jsonresponsedata = JSON.parse stdout
        count = "#{times}"
        output = while count -=1
          "#{jsonresponsedata.hits.hits[count]._source.message}\n"
        res.send("\`\`\` #{output}\`\`\`")
  robot.respond /show log (\S+) on (\S+)$/i, (res) ->
    type = res.match[1]
    host = res.match[2]
    times = 11
    query = """ {"sort": { "@timestamp": {"order" : "desc"}},"from": 0, "size" : "#{times}","_source": "message","query": {"bool": {"filter": [{ "term": { "type": "#{type}" }},{ "term": { "host": "#{host}" }}]}}} """
    tixcurlhack = require "child_process"
    tixcurlhack.exec "curl -XGET '#{hostname}:9200/_all/_search?' -H 'Content-Type: application/json' -d'#{query}' ", (error, stdout, stderr) ->
      if error
        res.send "Error: #{error.code} - #{stderr}"
      else
        jsonresponsedata = JSON.parse stdout
        count = "#{times}"
        output = while count -=1
          "#{jsonresponsedata.hits.hits[count]._source.message}\n"
        res.send("\`\`\` #{output}\`\`\`")
  robot.respond /show requid (\S+)$/i, (res) ->
    id = res.match[1]
    query = """ {"sort": { "@timestamp": {"order" : "desc"}},"from": 0, "size" : 30,"_source": "message","query": {"bool": {"filter": [{ "term": { "request_id_list.raw": "#{id}" }}]}}} """
    tixcurlhack = require "child_process"
    tixcurlhack.exec "curl -XGET '#{hostname}:9200/_all/_search?' -H 'Content-Type: application/json' -d'#{query}' ", (error, stdout, stderr) ->
      if error
        res.send "Error: #{error.code} - #{stderr}"
      else
        jsonresponsedata = JSON.parse stdout
        counter = "#{jsonresponsedata.hits.total}"
        counter = --counter
        output = "There you go:\n"
        while counter >=0
          output = output + "#{jsonresponsedata.hits.hits[counter]._source.message}\n"
          counter = --counter
        res.send("\`\`\` #{output}\`\`\`")
  robot.respond /show requid (\S+) from (\S+)$/i, (res) ->
    logtype = res.match[2]
    id = res.match[1]
    query = """ {"sort": { "@timestamp": {"order" : "desc"}},"from": 0, "size" : "30","_source": "message","query": {"bool": {"filter": [{ "term": { "type": "#{logtype}" }},{ "term": { "request_id_list.raw": "#{id}" }}]}}} """
    tixcurlhack = require "child_process"
    tixcurlhack.exec "curl -XGET '#{hostname}:9200/_all/_search?' -H 'Content-Type: application/json' -d'#{query}' ", (error, stdout, stderr) ->
      if error
        res.send "Error: #{error.code} - #{stderr}"
      else
        jsonresponsedata = JSON.parse stdout
        counter = "#{jsonresponsedata.hits.total}"
        counter = --counter
        output = "There you go:\n"
        while counter >=0
          output = output + "#{jsonresponsedata.hits.hits[counter]._source.message}\n"
          counter = --counter
        res.send("\`\`\` #{output}\`\`\`")
