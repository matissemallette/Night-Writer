require 'rspec'
require './lib/braille.rb'

RSpec.describe Braille do 
  include Braille 

  before(:each) do 
    @map = {
      "a" => ["0.", "..", ".."],
      "b" => ["0.", "0.", ".."],
      "c" => ["00", "..", ".."],
      "d" => ["00", ".0", ".."],
      "e" => ["0.", ".0", ".."],
      "f" => ["00", "0.", ".."],
      "g" => ["00", "00", ".."],
      "h" => ["0.", "00", ".."],
      "i" => [".0", "0.", ".."],
      "j" => [".0", "00", ".."],
      "k" => ["0.", "..", "0."],
      "l" => ["0.", "0.", "0."],
      "m" => ["00", "..", "0."],
      "n" => ["00", ".0", "0."],
      "o" => ["0.", ".0", "0."],
      "p" => ["00", "0.", "0."],
      "q" => [".0", "00", "00"],
      "r" => ["0.", "00", "0."],
      "s" => [".0", "0.", "0."],
      "t" => [".0", "00", "0."],
      "u" => ["0.", "..", "00"],
      "v" => ["0.", "0.", "00"],
      "w" => [".0", "00", ".0"],
      "x" => ["00", "..", "00"],
      "y" => ["00", ".0", "00"],
      "z" => ["0.", ".0", "00"],
      " " => ["..", "..", ".."] 
      }
  end

  it 'provides a hash mapping ascii characters to braille characters' do 
    expect(braille_map).to eq(@map)
  end

  it 'can tell you if a character has a corresponding braille value' do 
    expect(legal_character?("a")).to eq(true)
    expect(legal_character?("\n")).to eq(true)
    expect(legal_character?("1")).to eq(false)
    expect(legal_character?(",")).to eq(false)
    expect(legal_character?("!")).to eq(false)
  end
end