require 'spec_helper'

describe "boards/edit" do
  let(:valid_title) {"valid_title"}
  before(:each) do
    @board = assign(:board, stub_model(Board, title: valid_title))
  end

  it "renders the edit board form" do
    render

    assert_select("form[action=?][method=?]", board_path(@board), "post") do
      assert_select("label[for=?]", "board_title")
      assert_select("input[name=?][value=?]", "board[title]", valid_title)
      assert_select("input[type=?]", "submit")
    end
  end
end
