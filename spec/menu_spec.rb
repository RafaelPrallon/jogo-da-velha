require "menu"

describe Menu do
  let :menu {Menu.new}
  describe "#new" do
    it "should return a Menu instance" do
      menu = Menu.new
      expect(menu).to   be_instance_of Menu
    end
  end
  describe "#get_input" do
    it "gets input" do
      allow(STDIN).to   receive(:gets).and_return "teste\n"
      expect(STDIN).to  receive(:gets)
      expect(menu.get_input).to   eq("teste")
    end
  end

  describe "#validate_input" do
    it "should raise InvalidOptionError" do
      options = ["a", "b"]
      allow(menu).to  receive(:get_input).and_return "c"
      expect{menu.validate_input(options)}.to raise_error(InvalidOptionError)
    end
    it "should return the input" do
      options = ["a", "b"]
      allow(menu).to  receive(:get_input).and_return "b"
      expect(menu.validate_input(options)).to eq("b")
    end
  end

  describe "#select_option" do
    it "should raise InvalidOptionError" do
      menu_text = "Test?\n"
      options = ["a", "b"]
      allow(menu).to  receive(:get_input).and_return "c"
      expect{menu.select_option(menu_text, options)}.to raise_error(InvalidOptionError)
    end
    it "should return the chosen option" do
      menu_text = "Test?\n"
      options = ["a", "b"]
      allow(menu).to  receive(:validate_input).and_return "b"
      expect(menu.select_option(menu_text, options)).to eq("b")
    end
  end

  describe "#select_difficulty" do
    it "should return the chosen difficulty" do
      allow(menu).to  receive(:validate_input).and_return "Easy"
      expect(menu.select_difficulty).to eq("Easy")
    end
    it "should raise InvalidOptionError" do
      allow(menu).to  receive(:get_input).and_return "erro"
      expect{menu.select_difficulty}.to raise_error(InvalidOptionError)
    end
  end

end
