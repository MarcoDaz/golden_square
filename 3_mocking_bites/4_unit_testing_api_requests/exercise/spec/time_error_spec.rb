require 'date'
require 'json'

class TimeError
    # Returns difference in seconds between server time
    # and the time on this computer
    def initialize(requester, time)
        @requester = requester
        @time = time
    end
    
    def error
        return get_server_time.to_i - @time.to_i
    end

    private

    def get_server_time
        text_response = @requester.get(URI("https://worldtimeapi.org/api/ip"))
        json = JSON.parse(text_response)
        time =  DateTime.parse(json["utc_datetime"]).to_time
        return time
    end
end

RSpec.describe TimeError do
    describe "#error" do
        it "returns difference in seconds between server time and time on computer" do
            current_time = Time.now
            fake_time = current_time + 100
            fake_json = {"utc_datetime" => fake_time.to_s}.to_json
            requester = double :requester
            expect(requester).to receive(:get)
                .with(URI("https://worldtimeapi.org/api/ip"))
                .and_return(fake_json)

            time_error = TimeError.new(requester, current_time)
            expect(time_error.error).to eq 100
        end
    end
end