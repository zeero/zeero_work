require 'rubygems'
require 'nokogiri'

# init
if ($*.size == 0)
  puts "Usage: ruby #{__FILE__} FILE XPATH"
  puts ""
  puts " ex) ruby #{__FILE__} nessus_report.html \'//tr[@class=\"plugin_sev_high\"]/td/text()\'"
  exit 1
end
filepath = ARGV[0]
query = ARGV[1]

doc = Nokogiri::HTML(open(filepath))
puts doc.xpath(query)

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
# >> Apache mod_ssl ssl_engine_log.c mod_proxy Hook Function Remote Format String
