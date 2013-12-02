# encoding: utf-8

require 'spec_helper'

describe Post do
    let(:long_string_1001) {'a'*1001}
  describe "#create" do
    it "should have body text" do
      Post.create(body: 'hoge')
      expect(Post.find(1).body.present?).to be_true
    end

    it "should not be valid with body(more than 1000 characters)" do
      @post = Post.new(body: long_string_1001)
      expect(@post).not_to be_valid
    end

    it "should not be valid if body is empty" do
      @post = Post.new
      expect(@post).not_to be_valid
    end

    it "should not be valid if body contains only space characters" do
      @post = Post.new(body: '  ')
      expect(@post).not_to be_valid
    end

    it "should not be valid if body contains only \\n characters" do
      @post = Post.new(body: "\n\n")
      expect(@post).not_to be_valid
    end

    it "should be valid only if body is unique" do
      Post.create(body: 'hoge')
      @post = Post.new(body: 'hoge')
      expect(@post).not_to be_valid
    end
  end

  describe "#board" do
    it "should belong to a board" do
      @board = Board.create(title: 'hoge')
      @post = Post.new(body: 'hoge')
      @post.board = @board
      expect(@post.board).to be_present
    end
  end

  describe "#update" do
    before do
      Post.create(body: 'hoge')
    end

    it "should update Post.body value" do
      @post = Post.find(1)
      @post.update(body: 'foo')
      expect(@post.body).to eq('foo')
    end

    it "should not be valid if Post.body(more than 1000 characters)" do
      @post = Post.find(1)
      expect(@post.update(body: long_string_1001)).to be_false
    end
  end

  describe "#destroy" do
    before do
      Post.create(body: 'hoge')
    end

    it "should destroy Post.first" do
      @post = Post.first
      expect{@post.destroy}.to change{Post.count}.by(-1)
    end
  end
end
