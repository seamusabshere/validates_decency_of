require File.expand_path('../test_helper', __FILE__)

describe "IsDecent" do
  before do
    @decent = 'Hello world'
    @indecent = 'Hello f*u*c*k*i*n*g world'
  end
  
  it "should not die on empty strings" do
    assert_nothing_raised do
      ''.is_decent?
    end
  end
  
  it "should recognize decent strings" do
    assert @decent.is_decent?
  end
  
  it "should recognize indecent strings" do
    assert !@indecent.is_decent?
  end
end
