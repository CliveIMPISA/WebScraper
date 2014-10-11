
fail ArgumentError, "Usage: ruby contracts.rb [teamname]\nPlease check the readme file for team names abbreviation\n" if ARGV.count == 0
team_name = ARGV[0]
require_relative 'salaryscrape'

code=BasketballReference.new()

contracts_data = code.get_team(team_name)

contracts_text = code.just_text(contracts_data)

code.display(contracts_text)
