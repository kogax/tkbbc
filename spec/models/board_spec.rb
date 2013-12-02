# encoding: utf-8

require 'spec_helper'

describe Board do
    let(:long_string_101) {'a'*101}
  describe "#create" do
    it "should have title text" do
      Board.create(title: 'hoge')
      expect(Board.find(1).title.present?).to be_true
    end

    it "should not be valid without title" do
      @board = Board.new
      expect(@board).not_to be_valid
    end
    
    it "should not be valid if title is empty" do
      @board = Board.new
      expect(@board).not_to be_valid
    end
    
    it "should not be valid if body contains only space characters" do
      @board = Board.new(title: '  ')
      expect(@board).not_to be_valid
    end
    
    it "should not be valid if title contains only \\n characters" do
      @board = Board.new(title: "\n\n")
      expect(@board).not_to be_valid
    end

    it "should not be valid with title(more than 1000 characters)" do
      @board = Board.new(title: long_string_101)
      expect(@board).not_to be_valid
    end
  end

  describe "#destroy" do
    before(:each) do
      @board = Board.create(title: 'hoge')
    end

    it "should be decremented count when " do
      expect{@board.destroy}.to change{Board.count}.by(-1)
    end
  end
end
