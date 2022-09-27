require './lib/braille'
require './lib/text_formatter'

class BrailleDisplay 
  include Braille

  def initialize
    @ascii_line_length_limit = 40
  end 

  def self.from_message(message)
    BrailleDisplay.new.write(message)
  end

  def write(message)
    @message = TextFormatter.format_text(message, @ascii_line_length_limit)
    self
  end

  def to_s
    @message
  end
end