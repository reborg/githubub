require 'rss' 
require 'open-uri' 
open('http://github.com/reborg.atom') do |http|
response = http.read 
result = RSS::Parser.parse(response, false) 
result.items.each_with_index do |item, i|
puts "#{i+1}. #{item.inspect}" if i < 3 
end
end
