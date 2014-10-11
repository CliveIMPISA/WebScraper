
# fail ArgumentError, "Usage: badges [username]\n" if ARGV.count == 0
#user_name = ARGV[0reuire
require_relative 'salaryscrape'

code=BasketballReference.new()

contracts_data = code.get_team("MIA")

contracts_text = code.just_text(contracts_data)
      
code.display(contracts_text)