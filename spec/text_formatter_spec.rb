require 'rspec'
require './lib/text_formatter'
require './lib/braille_display'

RSpec.describe TextFormatter do 
  before(:each) do 
    @text_formatter = TextFormatter.new(40)
  end
  it 'can tokenize a string' do 
    expect(@text_formatter.tokenize("hello\nworld!")).to eq(["hello", "\n", "world!"])
  end

  it 'can remove characters which do not belong' do 
    expect(@text_formatter.legalize_string("hello, world!\nmy name is matisse.")).to eq("hello world\nmy name is matisse")
  end
  
  it 'can concatenate an array of tokens into a string' do 
    tokens = ["hello", "world", "\n", "my", "name", "is", "matisse"]
    expect(@text_formatter.concatenate(tokens)).to eq("hello world\nmy name is matisse")
  end

  it 'can break up tokens that are too big to fit on a single line' do 
    oversized_tokens = @text_formatter.tokenize("aabbccddeeffgghhiijjkkllmmnnooppqqrrssttuuvvwwxxyyzz")
    expect(@text_formatter.break_up_large_tokens(oversized_tokens)).to eq(["aabbccddeeffgghhiijjkkllmmnnooppqqrrsstt", "uuvvwwxxyyzz"])
  end

  it 'can apply word wrap to an array of tokens' do 
    unformatted_string = "\n\n\ni am using quite extremely long verbiage to demonstrate the word wrapping functionality"
    wrapped_tokens = @text_formatter.word_wrap(@text_formatter.tokenize(unformatted_string))
    expect(wrapped_tokens.include?("\n")).to eq(true)
  end
end