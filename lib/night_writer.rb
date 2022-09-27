
class NightWriter 
  attr_reader :message 
  def initialize(argv)
    @message = File.read(argv[0])
    File.write(argv[1], @message)
    puts "Created '#{argv[1]}' containing #{@message.length} characters"
  end
end