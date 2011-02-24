require 'logger'

require 'rubygems'
require 'nokogiri'

class XPash

  DEFAULT_PATH = "//"

  attr_reader :query, :list

  def initialize(filepath)
    @doc = Nokogiri::HTML(open(filepath))
    @query = DEFAULT_PATH

    @log = Logger.new(STDOUT)
    @log.level = Logger::WARN if ! $DEBUG
  end

  def eval(input)
    if "" == input
      return
    end

    input_a = input.split
    command = input_a.shift
    args = input_a.join
    @log.debug("args: #{args}")

    if self.respond_to?(command)
      self.send(command, args)
    else
      puts "Error: \'#{command}\' is not xpash command."
    end
  end

  def cd(path)

    case path
    when /^\//
      query = path
    when /^\.\./
      arr = @query.split("/")
      arr.pop
      query = arr.join("/")
    else
      if /\/$/ =~ @query
        query = @query + path
      else
        query = @query + "/" + path
      end
    end

    @list = @doc.xpath(query)
    @query = query
    @list.size
  end

  def ls(args)
    puts @list
  end

  def quit(args)
    exit
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
    xpash.cd(ARGV[1])
    puts xpash.ls
    exit
  end

  # main loop
  Signal.trap(:INT, nil)
  while true do
    begin
      print "xpash[#{xpash.query}]> "

      input = gets
      if ! input
        puts
        next
      end

      result = xpash.eval(input.chomp)

      puts "=> #{result}" if result
    rescue Nokogiri::XML::XPath::SyntaxError => e
      puts "Error: #{e}"
    end
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
