require 'spec_helper'

module Codebreaker
describe Game do
   
  before(:each) do
       @output = double('output').as_null_object
       @game = Game.new(@output)
    end
  
   describe "start" do
    
    it "sends a welcome message" do
      @output.should_receive(:puts).with('Welcome to CodeBreaker')      
      @game.start('1234')
    end
    
    it "prompts for the first guess" do
      @output.should_receive(:puts).with('Enter your guess')      
      @game.start('1234')
    end
  end
  
  describe "guess" do
    context "with no matches" do
      it "should send a mark with ''" do
        @game.start('1234')
        @output.should_receive(:puts).with('')
        @game.guess('7777')
      end
    end

    context "with one number match" do
      it "should send a mark with '-'"do
        @game.start('1234')
        @output.should_receive(:puts).with('-')
        @game.guess('2777')
      end
    end

    context "with 1 exact match" do
      it "should send a mark with '+'" do
        @game.start('1234')
        @output.should_receive(:puts).with('+')
        @game.guess('1777')
      end
    end

    context "with 2 number matches" do
      it "should send a mark with '--'" do
        @game.start('1234')
        @output.should_receive(:puts).with('--')
        @game.guess('5325')
      end
    end

    context "with 1 number match and one exact match" do
      it "should send a mark with '+-'" do
        @game.start('1234')
        @output.receive(:puts).with('+-')
        @game.guess('5324')
      end
     end

     context "1 exact match and 3 number matches" do
        it "should send a mark with '+---'" do
        @game.start('1234')
        @output.receive(:puts).with('+----')
        @game.guess('1432')
      end
     end
      

  end
end
end

