
require 'nokogiri'
require 'open-uri'

  class BasketballReference

    WEBSITE = "http://www.basketball-reference.com/contracts"

    def get_team(team)
      doc = get_page(team)
      doc.xpath("//div[@id='div_payroll']//tr[@class='']")
      
    end

    def get_page(team)
      url = "#{WEBSITE}/#{team}.html"
      Nokogiri::HTML(open(url))
    end

    def just_text(data)
      data.map { |t| t.text }
    end

    def display(data)
      data.each { |x| puts x }
    end

  end
