require 'nokogiri'
require 'open-uri'
require 'yaml'

module SalaryScraper
  # Class Pulls and Manipulates data from basketball-reference.com
  class BasketballReference
    WEBSITE = 'http://www.basketball-reference.com/contracts'
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

    def get_column_heads(team)
      doc = get_page(team)
      doc.xpath(HEAD)
    end

    def to_array_of_hashes(team)
      players_data_array = []
      head_array = []

      players_data = get_team(team)
      head = get_column_heads(team)

      players_data.each { |x| players_data_array << x.text }
      head.each { |x| head_array << x.text }
      number_arrays = get_number_arrays(players_data_array, head_array)
      assign_key_to_value(number_arrays, players_data_array, head_array)
    end

    def assign_key_to_value(number_arrays, players_data_array, head_array)
      data = []
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

    def get_number_arrays(val1, val2)
      val1.size / val2.size
    end

    def to_yaml(team_name)
      data = to_array_of_hashes(team_name)
      data.to_yaml
    end
  end
end
