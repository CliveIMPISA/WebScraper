
fail ArgumentError, "Usage: ruby contracts.rb [teamname]\n
Please check the readme file for team names abbreviation\n" if ARGV.count == 0

team_name = ARGV[0]
require_relative 'salaryscrape'
include SalaryScraper

code = BasketballReference.new

# code.get_team(team_name)

puts code.to_yaml(team_name)
