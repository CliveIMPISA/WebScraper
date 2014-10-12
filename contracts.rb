
# fail ArgumentError, "Usage: badges [username]\n" if ARGV.count == 0
#user_name = ARGV[0reuire
require_relative 'salaryscrape'

code=CodecademyBadge.new()
code.get_badges()
