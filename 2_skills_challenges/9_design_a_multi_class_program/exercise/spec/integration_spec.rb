require 'diary'
require 'entry'

RSpec.describe "Integration" do
    it "can store entries" do
        diary = Diary.new
        entry_1 = Entry.new('title_1', 'contents_1')
        entry_2 = Entry.new('title_2', 'contents_2')
        diary.add_entry(entry_1)
        diary.add_entry(entry_2)
        expect(diary.entries).to eq [entry_1, entry_2]
    end

    context "given a title that has a matching entry" do
        it "returns the contents of the matching entry" do
            diary = Diary.new
            entry_1 = Entry.new('title_1', 'contents_1')
            entry_2 = Entry.new('title_2', 'contents_2')
            diary.add_entry(entry_1)
            diary.add_entry(entry_2)
            expect(diary.read('title_1')).to eq entry_1.contents
        end
    end

    context "given a title that has no matching entry" do
        it "fails" do
            diary = Diary.new
            entry_1 = Entry.new('title_1', 'contents_1')
            entry_2 = Entry.new('title_2', 'contents_2')
            diary.add_entry(entry_1)
            diary.add_entry(entry_2)
            expect { diary.read('random') }.to raise_error "No matching entry found"
        end
    end

    it "can find best entry within suitable reading time & speed" do
        diary = Diary.new
        entry_1 = Entry.new('title_1', 'one ' * 200)
        entry_2 = Entry.new('title_2', 'one ' * 300)
        entry_3 = Entry.new('title_3', 'one ' * 400)
        diary.add_entry(entry_1)
        diary.add_entry(entry_2)
        diary.add_entry(entry_3)
        expect(diary.best_entry(100, 3)).to eq entry_2
    end

    it "fails if no entry readable given reading time and speed" do
        diary = Diary.new
        entry_1 = Entry.new('title_1', 'one ' * 400)
        entry_2 = Entry.new('title_2', 'one ' * 500)
        diary.add_entry(entry_1)
        diary.add_entry(entry_2)

        expect { diary.best_entry(100, 3) }.to raise_error "No entries readable within the given time and speed"
    end

    it "can store numbers from added entries" do
        diary = Diary.new
        entry_1 = Entry.new('title_1', 'no. 07812345678')
        entry_2 = Entry.new('title_2', 'no. 17812345678')
        diary.add_entry(entry_1)
        diary.add_entry(entry_2)
        expect(diary.contacts).to eq ['07812345678', '17812345678']
    end

    it "can store multiple numbers from one entry" do
        diary = Diary.new
        entry_1 = Entry.new('title_1', 'no.s 07812345678, 27812345678')
        entry_2 = Entry.new('title_2', 'no. 17812345678')
        diary.add_entry(entry_1)
        diary.add_entry(entry_2)
        expect(diary.contacts).to eq ['07812345678', '27812345678', '17812345678']
    end

    it "doesn't create duplicate numbers in contacts" do
        diary = Diary.new
        entry_1 = Entry.new('title_1', 'no.s 07812345678, 07812345678')
        entry_2 = Entry.new('title_2', 'no.s 07812345678, 17812345678')
        diary.add_entry(entry_1)
        diary.add_entry(entry_2)
        expect(diary.contacts).to eq ['07812345678', '17812345678']
    end
end