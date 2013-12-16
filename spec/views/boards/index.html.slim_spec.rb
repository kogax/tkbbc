require 'spec_helper'

describe "boards/index" do
  context "single Board" do
    let(:board_title) {'board_title'}
    before(:each) do
      assign(:boards, [
        stub_model(Board, title: board_title)
      ])
    end

    it "renders a board" do
      render

      assert_select("table") do
        assert_select("thead") do
          assert_select("th", "Title")
        end
        assert_select("tbody") do
          assert_select("td", board_title)
          assert_select("td", 4)
        end
      end
    end
  end

  context "multiple Boards" do
    before(:each) do
      assign(:boards, [
        stub_model(Board, title: 'board1'),
        stub_model(Board, title: 'board2')
      ])
    end

    it "renders a list of boards" do
      render

      assert_select("table tbody") do
        assert_select("tr", 2)
      end
    end
  end
end
