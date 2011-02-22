text = Array.new
text << ["cd", "add query string."]
text << ["ls", "display match elements. default, maxdepth=1."]
text << ["help", "display this document."]
text << ["quit", "quit."]

puts "commands:"
for line in text
  puts sprintf(" %-10s%-20s", line[0], line[1])
end

# >> commands:
# >>  cd        add query string.   
# >>  ls        display match elements. default, maxdepth=1.
# >>  help      display this document.
# >>  quit      quit.               
