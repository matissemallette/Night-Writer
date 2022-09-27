
class BrailleDisplay 
  def initialize
    @lines = []
  end

  def self.from_message(message)
    BrailleDisplay.new.write(message)
  end

  def write(message)
    # do all the shit here 
    self
  end

  def to_s
  
  end

  def print
    print self.to_s
  end

end