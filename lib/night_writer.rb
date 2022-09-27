require './lib/braille_display'

class NightWriter 
  attr_reader :message 
  def initialize(argv)
    @message = File.read(argv[0])
    @braille_display = BrailleDisplay.from_message(@message)
    File.write(argv[1], self.process_message(@message))
    puts "Created '#{argv[1]}' containing #{@message.length} characters"
  end

  def process_message(message)
    
    message
  end
end