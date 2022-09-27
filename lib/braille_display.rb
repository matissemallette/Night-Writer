
class BrailleDisplay 
  def initialize
    
  end

  def self.from_message(message)
    BrailleDisplay.new.write(message)
  end

  def write(message)
    # do all the shit here 
    self
  end

  def to_s
    "foo"
  end
end