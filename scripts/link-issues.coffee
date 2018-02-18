
# Listen for a issue numbers of the form "#nnn" or "reponame#nnn",
# and convert them naively to issue links in the PecanProject repo

# Examples:
# <infotroph> What was the deal with #18 again?
# <issuebot> https://github.com/PecanProject/pecan/issues/18
# <infotroph> Yeah, OK, like bety#22
# <issuebot> https://github.com/PecanProject/bety/issues/22
# <infotroph>  Beware: it's not smart. BTW, I'myour#1fan
# <issuebot> https://github.com/PecanProject/myour/issues/1

module.exports = (robot) ->
  robot.hear /(\w+)?\#(\d+)/, (res) ->
    repoName = res.match[1] ||= "pecan"
    issueNum = res.match[2]
    res.send "https://github.com/PecanProject/#{repoName}/issues/#{issueNum}"
