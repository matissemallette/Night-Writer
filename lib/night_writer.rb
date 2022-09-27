require './lib/braille_display'

class NightWriter 
  attr_reader :message 
  def initialize(argv)
    @message = File.read(argv[0])
    @braille_display = BrailleDisplay.from_message(@message)
    File.write(argv[1], @braille_display.to_s)
    puts "Created '#{argv[1]}' containing #{@message.length} characters"
  end
end