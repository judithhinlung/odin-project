require './lib/caesar_cipher'

describe '#caesar_cipher' do
  context "shift a string" do
    it "shifts a single word right" do
      expect(caesar_cipher("word", 4)).to eql("Asvh")
    end

    it "shifts multiple words right" do
expect(caesar_cipher("Love is patient", 3)).to eql("Oryh lv sdwlhqw")
    end

    it "shifts words with capitals" do
      expect(caesar_cipher("George Washington is the first US president", 4)).to eql("Kisvki aewlmrkxsr mw xli jmvwx YW tviwmhirx")
    end

    it "leaves numbers alone" do
      expect(caesar_cipher("3 little pigs", 5)).to eql("3 qnyyqj unlx")
    end

    it "wraps back around to uppercase when shift factor is large" do
      expect(caesar_cipher("word", 10)).to eql("GyBn")
    end
  end
end
