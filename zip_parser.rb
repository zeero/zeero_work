require 'rubygems'
require 'mechanize'
require 'zipruby'

class ZipParser < Mechanize::File
  def initialize(uri = nil, response = nil, body = nil, code = nil)
    super(uri, response, body, code)
  end

  def open
    streaming = lambda { return @body.slice!(0, 256) }

    Zip::Archive.open_buffer(streaming) {|zip_ar| yield(zip_ar)}
  end
end
