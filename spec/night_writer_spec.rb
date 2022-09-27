require 'RSpec'
require './lib/night_writer'

RSpec.describe NightWriter do 
  before(:each) do 
    @test_argv = ['message.txt', 'braille_test.txt']
    @nightwriter = NightWriter.new(@test_argv)
  end

  it 'exists' do 
    expect(@nightwriter).to be_an_instance_of(NightWriter)
  end

  it 'read from file' do 
    expect(@nightwriter.message).to eq("hello, world!\nmy name is matisse.")
  end

  it 'can write to file' do 
    expect(File.read(@test_argv[1])).to eq("hello, world!\nmy name is matisse.")
  end
end