require './lib/braille_display'
require './lib/text_formatter'

class NightWriter 
  attr_reader :message 
  def initialize(argv)
    @message = File.read(argv[0])
    @braille_display = BrailleDisplay.new.write(@message)
    File.write(argv[1], @braille_display.to_s)
    puts "Created '#{argv[1]}' containing #{@message.length} characters"
    print File.read(argv[1])
  end
end