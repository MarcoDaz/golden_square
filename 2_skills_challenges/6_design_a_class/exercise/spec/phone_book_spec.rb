require 'phone_book'

RSpec.describe PhoneBook do
    context "with no entries" do
        it "returns an empty list" do
            phone_book = PhoneBook.new
            expect(phone_book.list).to eq []
        end
    end

    context "given an entry with a number only" do
        it "stores the number" do
            phone_book = PhoneBook.new
            phone_book.extract_numbers("07812345678")
            expect(phone_book.list).to eq ["07812345678"]
        end
    end

    context "given an entry with a number in it" do
        it "stores the number" do
            phone_book = PhoneBook.new
            phone_book.extract_numbers("I was calling my friend 07812345678")
            list = phone_book.list
            expect(list).to eq ["07812345678"]
        end
    end

    context "given an entry with multiple different numbers" do
        it "stores all the different passwords" do
            phone_book = PhoneBook.new
            phone_book.extract_numbers("fave numbers: 07812345678, 17812345678, 27812345678")
            list = phone_book.list 
            expect(list).to eq ["07812345678", "17812345678", "27812345678"]
        end
    end

    context "given an entry with no phone numbers" do
        it "returns an empty list" do
            phone_book = PhoneBook.new
            phone_book.extract_numbers("potato")
            expect(phone_book.list).to eq []
        end
    end

    context "given multiple entries with numbers in it" do
        it "stores all the numbers" do
            phone_book = PhoneBook.new
            phone_book.extract_numbers("07812345678")
            phone_book.extract_numbers("17812345678")
            phone_book.extract_numbers("27812345678")
            list = phone_book.list
            expect(list).to eq ["07812345678", "17812345678", "27812345678"]
        end
    end

    context "given a number not of length 11 digits" do
        it "doesn't store those numbers" do
            phone_book = PhoneBook.new
            phone_book.extract_numbers("0781234567")
            phone_book.extract_numbers("078123456789")
            expect(phone_book.list).to eq []
        end
    end

    context "given multiple entries with the same number" do
        it "doesn't store repeated numbers" do
            phone_book = PhoneBook.new
            phone_book.extract_numbers("number 1: 07812345678")
            phone_book.extract_numbers("number 2: 07812345678")
            expect(phone_book.list).to eq ["07812345678"]
        end
    end
end