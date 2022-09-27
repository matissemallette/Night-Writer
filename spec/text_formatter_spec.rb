require 'rspec'
require './lib/text_formatter'
require './lib/braille_display'

RSpec.describe TextFormatter do 
  it 'can tokenize a string' do 
    expect(TextFormatter.tokenize("hello\nworld!")).to eq(["hello", "\n", "world!"])
  end

  it 'can break up tokens that are too big to fit on a single line' do 
    oversized_tokens = TextFormatter.tokenize("aabbccddeeffgghhiijjkkllmmnnooppqqrrssttuuvvwwxxyyzz")
    expect(TextFormatter.break_up_large_tokens(oversized_tokens, 40)).to eq(["aabbccddeeffgghhiijjkkllmmnnooppqqrrsstt", "uuvvwwxxyyzz"])
  end

  it 'can apply word wrap to an array of tokens' do 
    unformatted_string = "\n\n\ni am using quite extremely long verbiage to demonstrate the word wrapping functionality"
    wrapped_tokens = TextFormatter.word_wrap(TextFormatter.tokenize(unformatted_string), 40)
    wrapped_tokens.each do |token|
      print token 
      print " " unless token == "\n"
    end
    expect(wrapped_tokens.include?("\n")).to eq(true)
  end
end