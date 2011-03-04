require File.dirname(__FILE__) + '/spec_helper.rb'

describe XPash, 'cd command' do
  before do
    @xpash = XPash.new("#{File.dirname(__FILE__)}/../test/test.html")
  end
  
  it 'should return number of found elements.' do
    @xpash.cd("div").should == 3
  end

  it 'should add "/" and argument string to @query.' do
    @xpash.cd("div")
    @xpash.query.should == "//div"
  end

end
  
describe XPash, 'cd command, when input starts with ".."' do
  before do
    @xpash = XPash.new("#{File.dirname(__FILE__)}/../test/test.html")
  end

  it 'should update @query to upper path' do
    @xpash.cd("div")
    @xpash.cd("article")
    @xpash.cd("..").should == 3
    @xpash.query.should == "//div"
  end

end

