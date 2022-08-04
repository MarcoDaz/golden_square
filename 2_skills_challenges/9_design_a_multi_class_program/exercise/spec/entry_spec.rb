require 'entry'

RSpec.describe Entry do
    context "given an empty string for title or contents" do
        it "fails" do
            fail_msg = "Please enter valid title and contents"
            expect { entry = Entry.new("title", "") }.to raise_error fail_msg
            expect { entry = Entry.new("", "contents") }.to raise_error fail_msg
            expect { entry = Entry.new("", "")}.to raise_error fail_msg
        end
    end
    
    it "can return title and contents" do
        entry = Entry.new("title", "contents")
        expect(entry.title).to eq "title"
        expect(entry.contents).to eq "contents"
    end    

    it "can return unique contact no.s" do
        entry = Entry.new("title", "07812345678 07812345678")
        expect(entry.contacts).to eq ['07812345678']
    end
    
    it "doesn't grab other numbers" do
        entry_1 = Entry.new("title", "07812345678 1234567891")
        entry_2 = Entry.new("title", "giving my 10000000000000% call 07812345678")
        expect(entry_1.contacts).to eq ['07812345678']
        expect(entry_2.contacts).to eq ['07812345678']
    end

    it "can return sum of words in contents" do
        entry = Entry.new("title", "one " * 200)
        expect(entry.count_words).to eq 200
    end
end