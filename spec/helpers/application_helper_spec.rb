require 'spec_helper'

describe ApplicationHelper do
  describe "#tab_link_to" do
    subject { helper.tab_link_to('My Link', {:controller => 'sobre'}) }

    context "when the link points to the current page" do
      before { helper.stub(:current_page?) { true } }

      it("mark tab as selected") { should =~ /class="menu_select"/ }
    end

    context "when the link doesn't points to the current page" do
      before { helper.stub(:current_page?) { false } }

      it("unmark tab") { should =~ /class="menu_inicial"/ }
    end
  end
end
