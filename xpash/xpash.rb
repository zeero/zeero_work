require 'rubygems'
require 'nokogiri'

class XPash
  attr_reader :query
  attr_reader :list

  def initialize(filepath)
    @doc = Nokogiri::HTML(open(filepath))
    @query = "//"
  end

  def eval(input)
    input_a = input.split
    command = input_a.shift
    args = input_a.join

    if command == nil
      return
    end

    if self.respond_to?(command)
      self.send(command, args)
    else
      puts "Error: #{command} is not xpash command."
    end
  end

  def xpath(query)
    @query += query
    @list = @doc.xpath(@query)
    @list.size
  end

  def ls(test)
    puts @list
  end

end

if __FILE__ == $0

  if ARGV[0] != nil
    if File::ALT_SEPARATOR
      filepath = ARGV[0].gsub(File::ALT_SEPARATOR, File::SEPARATOR)
    else
      filepath = ARGV[0]
    end
  else
    #puts "file path?"
    filepath = "../sample.html"
  end
  xpash = XPash.new(filepath)

  if ARGV[1] != nil
    xpash.xpath(ARGV[1])
    puts xpash.ls
    exit
  end

  # main loop
  while true do
    print "xpash[#{xpash.query}]> "
    input = gets.chop
    xpash.eval(input)
  end

end

# >> Apache Chunked Encoding Remote Overflow
# >> Apache &lt; 1.3.27 Multiple Vulnerabilities (DoS, XSS)
# >> Apache &lt; 1.3.37 mod_rewrite LDAP Protocol URL Handling Overflow
# >> Apache &lt; 1.3.28 Multiple Vulnerabilities (DoS, ID)
# >> Apache &lt; 1.3.29 Multiple Modules Local Overflow
# >> PHP &lt; 4.4.3 / 5.1.4 Multiple Vulnerabilities
# >> PHP &lt; 4.3.3 Multiple Vulnerabilities
# >> PHP &lt; 4.3.11 / 5.0.3 Multiple Unspecified Vulnerabilities
# >> PHP &lt; 4.4.9 Multiple Vulnerabilities
# >> PHP &lt; 4.4.5 Multiple Vulnerabilities
# >> PHP &lt; 4.4.1 / 5.0.6 Multiple Vulnerabilities
# >> PHP &lt; 4.3.10 / 5.0.3 Multiple Vulnerabilities
# >> mod_ssl ssl_util_uuencode_binary Remote Overflow
# >> Apache mod_ssl ssl_engine_log.c mod_proxy Hook Function Remote Format inputing
