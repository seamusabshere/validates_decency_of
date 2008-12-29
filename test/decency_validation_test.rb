require File.expand_path('../test_helper', __FILE__)

describe "DecencyValidation" do
  before do
    DecencyValidationTest::Initializer.setup_database
    @decent = Message.create :title => 'Hello world', :description => 'I am clean'
    @indecent = Message.create :title => 'Hello f*u*c*k*i*n*g world', :description => 'I am ~-S-h-I-t-T-y-~'
  end
  after do
    DecencyValidationTest::Initializer.teardown_database
  end

  it "should not die on empty strings" do
    @decent.description = nil
    assert @decent.valid?
  end

  it "should recognize decent strings" do
    assert @decent.valid?
  end
  
  it "should recognize indecent strings" do
    assert !@indecent.valid?
    assert_not_nil @indecent.errors.on(:title)
    assert_not_nil @indecent.errors.on(:description)
  end
end
