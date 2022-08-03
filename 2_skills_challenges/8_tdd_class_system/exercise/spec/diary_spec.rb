require 'diary'

RSpec.describe Diary do
    context "no entries are added" do
        it "it should return an empty list of entries" do
            diary = Diary.new
            expect(diary.all).to eq []
        end

        it "it should return 0 for count_words" do
            diary = Diary.new
            expect(diary.count_words).to eq 0
        end
    end

    describe "#reading_time" do
        context "given wpm less than or equal to 0" do
            it "fails" do
                diary = Diary.new
                expect { diary.reading_time(0) }.to raise_error "Please enter a reading speed greater than 0"
            end
        end
    end

    describe "#find_best_entry_for_reading_time" do
        context "given wpm or minutes less than or equal to 0" do
            it "fails" do
                diary = Diary.new
                expect { diary.find_best_entry_for_reading_time(10, 0) }.to raise_error "Please enter a reading speed and time greater than 0"
                expect { diary.find_best_entry_for_reading_time(0, 10) }.to raise_error "Please enter a reading speed and time greater than 0"
                expect { diary.find_best_entry_for_reading_time(0, 0) }.to raise_error "Please enter a reading speed and time greater than 0"
            end
        end
    end
end