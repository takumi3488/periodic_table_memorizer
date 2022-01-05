require 'open-uri'
require 'nokogiri'

def get_data
  url = 'https://ja.wikipedia.org/wiki/%E5%85%83%E7%B4%A0%E3%81%AE%E4%B8%80%E8%A6%A7'
  charset = nil
  html = URI.parse(url).open do |f|
    charset = f.charset
    f.read
  end
  doc = Nokogiri::HTML.parse(html, nil, charset)

  targets = []
  File.open('targets.txt') do |f|
    f.each_line do |line|
      targets.concat eval("[*#{line.strip}]") if line.strip
    end
  end


  File.open('data.csv', 'w') do |f|
    f.puts 'number,symbol,japanese,correct'
  end

  doc.css('table.sortable>tbody>tr').each do |tr|
    next unless tr.at_css('th').text && tr.at_css('td') && targets.include?(tr.at_css('th').text.to_i)

    File.open('data.csv', 'a') do |f|
      f.puts "#{tr.at_css('th').text.strip},#{tr.at_css('td').text},#{tr.at_css('a').text.strip},x"
    end
  end
end
