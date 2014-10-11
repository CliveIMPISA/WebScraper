
require 'nokogiri'
require 'open-uri'
require 'date'

  class CodecademyBadge

    SOURCE = "http://www.basketball-reference.com"

    def get_badges(team)
      doc = get_html(team)
      titles = doc.xpath("//div[@id='div_payroll']//tr[@class='']")
      putit=titles.map { |t| t.text }
      putit.each { |b| puts b}

    end

    def get_html(team)
      url = "#{SOURCE}/contracts/#{team}.html"
      Nokogiri::HTML(open(url))
    end

  end
