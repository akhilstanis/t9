require 'spec_helper'
require 't9'

describe T9 do

  before :each do
    @o = T9.new
  end

  it "should find all the combinations" do
    @o.combinations([3]).should == ['d','e','f']
    @o.combinations([3,6,6]).should == ["dmm", "dmn", "dmo", "dnm", "dnn", "dno", "dom", "don", "doo", "emm", "emn", "emo", "enm", "enn", "eno", "eom", "eon", "eoo", "fmm", "fmn", "fmo", "fnm", "fnn", "fno", "fom", "fon", "foo"]
  end

  it "should find valid words from combinations" do
    @o.valid_words_using([4,3,5,5,6]).should == ["hello"]
  end

end
