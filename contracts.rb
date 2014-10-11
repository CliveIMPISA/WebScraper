
fail ArgumentError, "Usage: team [teamname]\n" if ARGV.count == 0
team_name = ARGV[0]
require_relative 'salaryscrape'

code=BasketballReference.new()


#code.get_team(team_name)

code.to_yaml(code.to_array_of_hashes(team_name))
