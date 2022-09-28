require './lib/braille_display'
require './lib/braille'

RSpec.describe BrailleDisplay do 
  include Braille
  before(:each) do 
    @braille_display = BrailleDisplay.new
  end

  it 'exists' do 
    expect(@braille_display).to be_an_instance_of(BrailleDisplay)
  end

  it 'has readable attributes' do 
    expect(@braille_display.braille_data).to be_an_instance_of(Array)
  end
  
  it 'can store data based on input' do 
    @braille_display.write("a")
    expect(@braille_display.braille_data).to eq([[to_braille("a")]])
    @braille_display.write("b")

    expect(@braille_display.braille_data).to eq([[to_braille("a"), to_braille("b")]])

    @braille_display.write("\nc")
    expect(@braille_display.braille_data).to eq([[to_braille("a"), to_braille("b")], [to_braille("c")]])
  end

  it 'can clear its data' do 
    @braille_display.write("a")
    expect(@braille_display.braille_data).to eq([[to_braille("a")]])
    @braille_display.clear 
    expect(@braille_display.braille_data).to eq([])
  end

  it 'can convert its braille data into an easily printable string' do 
    @braille_display.clear
    @braille_display.write("a b c")
  end
end