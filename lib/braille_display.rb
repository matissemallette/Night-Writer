require './lib/braille'

class BrailleDisplay 
  include Braille

  def initialize
    @text_formatter = TextFormatter.new(40)
    @braille_grid = Array.new {Array.new(3, String.new)}
  end 

  def self.from_message(message)
    BrailleDisplay.new.write(message)
  end

  def write(message)
    p @message
  end

  def to_s
    
  end
end