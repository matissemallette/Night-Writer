require './lib/braille_display'

RSpec.describe BrailleDisplay do 
  before(:each) do 
    @braille_display = BrailleDisplay.from_message('hello, world!')
  end

  it 'exists' do 
    expect(@braille_display).to be_an_instance_of(BrailleDisplay)
  end
end