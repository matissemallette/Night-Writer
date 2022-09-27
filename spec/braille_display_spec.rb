require './lib/braille_display'

RSpec.describe BrailleDisplay do 
  before(:each) do 
    @braille_display = BrailleDisplay.new
  end

  it 'exists' do 
    expect(@braille_display).to be_an_instance_of(BrailleDisplay)
  end

  it 'can tokenize a string' do 
    expect(@braille_display.tokenize("hello\nworld!")).to eq(["hello", "\n", "world!"])
  end

  it 'can break up tokens that are too big to fit on a single line' do 
    oversized_tokens = @braille_display.tokenize("aabbccddeeffgghhiijjkkllmmnnooppqqrrssttuuvvwwxxyyzz")
    expect(@braille_display.break_up_large_tokens(oversized_tokens, 40)).to eq(["aabbccddeeffgghhiijjkkllmmnnooppqqrrsstt", "uuvvwwxxyyzz"])
  end

  it 'can apply word wrap to an array of tokens' do 
    unformatted_string = "hi i am typing -\n a long thing so i can see if this function can successfully wrap the words! blah blah blaaaaaaaaaaaah bwwwwawawawawawawawawawawawawawawawawawawawawawawawawawawawawawawaw"
    wrapped_tokens = @braille_display.word_wrap(@braille_display.tokenize(unformatted_string))
    wrapped_tokens.each do |token|
      print token 
      print " " unless token == "\n"
    end
  end
end