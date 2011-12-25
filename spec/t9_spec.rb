require 'spec_helper'
require 't9'

describe T9 do

  before :each do
    @o = T9.new
  end

  it "should decode the key" do
    @o.decode_key(2).should ==  %w(a b c)
    @o.decode_key(9).should ==  %w(w x y z)
  end

  it "should make nil mapped hash " do
    @o.map_nil(['a','b','c']).should == { 'a' => nil, 'b' => nil, 'c' => nil }
  end

  it "should find the possible combinations" do
    @o.words([3]).should == {'d' => nil, 'e' => nil ,'f' => nil}
    @o.words([3,3]).should == { 'd' => {'d' => nil, 'e' => nil , 'f' => nil }, 'e' => {'d' => nil, 'e' => nil , 'f' => nil }, 'f' => {'d' => nil, 'e' => nil , 'f' => nil } }
  end

  it "should humanize the hash" do
    @o.humanize([3,3]).should == ['dd','de','df', 'ed','ee','ef', 'fd','fe','ff']
  end

end
