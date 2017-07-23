require "menu"

describe Menu do
  let :menu {Menu.new}
  describe "#new" do
    it "should return a Menu instance" do
      menu = Menu.new
      expect(menu).to   be_instance_of Menu
    end
  end
  describe "#select_option" do
    it "should validate" do
      menu_text = "Test?\n"
      options = ["a", "b"]
      allow(menu).to  receive(:get_input).and_return "c"
      expect{menu.select_option(menu_text, options)}.to raise_error(InvalidOptionError)
    end
  end
end
