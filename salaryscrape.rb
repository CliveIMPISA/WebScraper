
require 'nokogiri'
require 'open-uri'
require 'yaml'

  class BasketballReference

    WEBSITE = "http://www.basketball-reference.com/contracts"
    PAYROLL = "//div[@id='div_payroll']//tbody//tr[@class='']//td"
    HEAD = "//div[@id='div_payroll']//thead//tr[@class='']//th" 

    def get_team(team)
      doc = get_page(team)
      doc.xpath(PAYROLL) 
    end

    def get_page(team)
      url = "#{WEBSITE}/#{team}.html"
      Nokogiri::HTML(open(url))
    end

    def just_text(data)
          textes_array = []
          data.each { |t| textes_array << t.text }
          textes_array
    end

#    def display(team)
 #     just_text(get_team(team)).each { |x| puts x }
  #  end

    def get_column_heads(team)
      doc = get_page(team)
      doc.xpath(HEAD)

    end


    def to_array_of_hashes(team)
 

players_data_array = Array.new
head_array = Array.new

players_data = get_team(team)
head = get_column_heads(team)

players_data.each { |x| players_data_array << x.text }
head.each {|x| head_array << x.text }

number_arrays = players_data_array.size/head_array.size
data = Array.new

number_arrays.times do
  piece_of_data = Hash.new
  head_array.each do |x|
    piece_of_data[x] = players_data_array.first
    players_data_array.shift
  end
  data << piece_of_data
end
  
  data

  end


    def to_yaml(data)
      File.open("test.yml", "w") do  |file|  
        file.puts data.to_yaml
      end
    end

  end


