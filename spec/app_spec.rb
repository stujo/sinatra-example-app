require_relative('./sinatra_test_helper')

describe "Sinatra Application" do
  it "should allow accessing the home page" do
    get '/'
    expect(last_response).to be_ok
  end

  describe "Generate and Filter List" do

    let(:fake_raw_list){ ['test@example.com'] }

    it "should use the EmailGenerator" do
      expect(EmailGenerator).to receive(:generate).with(1000,0.5).and_return(fake_raw_list)
      get '/emails/generate?list_size=1000&duplication_rate=0.50'
      expect(last_response).to be_ok
    end

    it "should use the generator and filter services" do
      expect(EmailGenerator).to receive(:generate).with(1000,0.5).and_return(fake_raw_list)
      expect_any_instance_of(UniqueEmailList).to receive(:add).with(fake_raw_list.first)
      get '/emails/generate?list_size=1000&duplication_rate=0.50'
      expect(last_response).to be_ok
    end

  end

end
