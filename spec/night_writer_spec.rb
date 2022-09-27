require 'rspec'
require './lib/night_writer'
require './lib/braille_display'

RSpec.describe NightWriter do 
  before(:each) do 
    @test_argv = ['message.txt', 'braille_test.txt']
    @night_writer = NightWriter.new(@test_argv)
  end

  it 'exists' do 
    expect(@night_writer).to be_an_instance_of(NightWriter)
  end

  it 'read from file' do 
    expect(@night_writer.message).to eq("hello, world!\nmy name is matisse.")
  end

  it 'can write to file' do 
    expect(File.read(@test_argv[1])).to eq("hello, world!\nmy name is matisse.")
  end
end