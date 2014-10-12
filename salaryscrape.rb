
require 'nokogiri'
require 'open-uri'
require 'date'

  class CodecademyBadge

    def get_badges()
      doc = get_html()
      titles = doc.xpath("//div[@id='div_payroll']//tr[@class='']")
      putit=titles.map { |t| t.text }
      putit.each { |b| puts b}

    end

    def get_html()
      url = "http://www.basketball-reference.com/contracts/MIA.html"
      Nokogiri::HTML(open(url))
    end

  end
