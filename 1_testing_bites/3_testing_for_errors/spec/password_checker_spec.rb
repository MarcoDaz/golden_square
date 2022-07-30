require 'password_checker'

RSpec.describe PasswordChecker do
    context "accepts passwords greater thn or equal to 8 characters" do
        it "accepts '12345678' as a password" do
            password = "12345678"
            password_checker = PasswordChecker.new
            expect(password_checker.check(password)).to eq true
        end
    end

    context "rejects passwords with less than 8 characters" do
        it "fails when checking the '123' as as a password" do
            password = '123'
            password_checker = PasswordChecker.new
            expect { password_checker.check(password) }.to raise_error "Invalid password, must be 8+ characters."
        end
    end
end