require 'spec_helper'

describe "boards/show" do
  let(:valid_title) {"valid_title"}
  before(:each) do
    @board = assign(:board, stub_model(Board, title: valid_title))
  end

  it "renders attributes in <p>" do
    render

    assert_select("p", valid_title)
  end
end
