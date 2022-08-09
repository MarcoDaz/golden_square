require "secret_diary"
require "diary"

RSpec.describe "Integration" do
    it "constructs" do
        diary = Diary.new("contents")
        secret_diary = SecretDiary.new(diary)
        expect(secret_diary.read).to eq "contents"
    end

    it "can locks & unlocks" do
        diary = Diary.new("contents")
        secret_diary = SecretDiary.new(diary)

        secret_diary.lock
        expect { secret_diary.read }.to raise_error "Go away!"

        secret_diary.unlock
        expect(secret_diary.read).to eq "contents"
    end 
end