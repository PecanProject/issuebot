# Description:
#   Listen for a issue numbers of the form "#nnn" or "reponame#nnn",
#   and convert them naively to issue links in the matching PecanProject repo.
#
#   Does not check whether the resulting URL actually exists, and currently
#   counts on Slack's GitHub integration to provide previews and disambiguate
#   issues from pull requests.
#
# Examples:
#   user: What was the deal with #1825 again?
#   issuebot: https://github.com/PecanProject/pecan/issues/1825
#   user: Yeah, OK, so not actually related to bety#565
#   issuebot: https://github.com/PecanProject/bety/issues/565
#   user:  Beware: it's not smart. BTW, I'myour#1fan
#   issuebot: https://github.com/PecanProject/myour/issues/1
#
# Commands:
#   #nnnn - reply with a link to PEcAn github issue #nnnn
#   repo#nnnn - reply with a link to issue #nnnn in another PEcAnProject repo

module.exports = (robot) ->
  robot.hear /(\w+)?\#(\d+)/, (res) ->
    repoName = res.match[1] ||= "pecan"
    issueNum = res.match[2]

    # Don't respond to other bots
    if res.message.user in ["github", "Travis CI"]
      return

    res.send "https://github.com/PecanProject/#{repoName}/issues/#{issueNum}"
