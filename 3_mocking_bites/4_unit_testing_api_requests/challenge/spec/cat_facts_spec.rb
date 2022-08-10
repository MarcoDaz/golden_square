require 'json'
require 'net/http'
require 'cat_facts'


RSpec.describe CatFacts do
    it "returns formatted cat fact" do
        request = double :request
        expect(request).to receive(:get)
            .with(URI("https://catfact.ninja/fact"))
            .and_return('{
                "fact": "Cats are subject to gum disease and to dental caries. They should have their teeth cleaned by the vet or the cat dentist once a year.",
                "length": 133
            }')
            cat_fact = CatFacts.new(request)
            expect(cat_fact.provide).to eq "Cat fact: Cats are subject to gum disease and to dental caries. They should have their teeth cleaned by the vet or the cat dentist once a year."
    end
end