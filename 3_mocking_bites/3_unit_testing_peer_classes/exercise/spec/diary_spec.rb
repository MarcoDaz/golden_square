require "diary"

RSpec.describe Diary do
    it "constructs" do
        diary = Diary.new("contents")
        expect(diary.read).to eq "contents"
    end

    it "fails given empty contents" do
        expect { Diary.new("") }.to raise_error "Invalid contents"
    end
end