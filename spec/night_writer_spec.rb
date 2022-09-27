require 'RSpec'
require './lib/night_writer'

RSpec.describe NightWriter do 
  before(:each) do 
    @nightwriter = NightWriter.new
  end

  it 'exists' do 
    expect(@nightwriter).to be_an_instance_of(NightWriter)
  end
end