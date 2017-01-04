require_relative('./spec_helper')

require('unique_email_list')
require('email_generator')

describe UniqueEmailList do
  let(:list_size) { 100_000 }
  let(:duplication_rate) { 0.5 }

  it('Should filter 100,000 emails with 50 % duplication in less than 1 second') do

    # This takes longer than the filtering....
    puts "Generating #{list_size} Random Emails with #{ (duplication_rate * 100).floor }% duplication ..."
    raw_emails = EmailGenerator.generate(list_size, duplication_rate)
    expect(raw_emails.length).to eq list_size

    puts "Filtering Duplicate Emails..."
    # Start the timer
    start_timer = Time.now.to_f

    list = UniqueEmailList.new

    raw_emails.each do |email|
      list.add email
    end

    filtered_emails = list.emails

    end_timer = Time.now.to_f

    elapsed_time = end_timer - start_timer

    expect(elapsed_time).to be < 1 # second

    expect(filtered_emails.length).to eq filtered_emails.uniq.length

    puts "Filtered to #{filtered_emails.length} unique emails"

    expect(filtered_emails.length).to be_within(20000).of(66666) # Should be there somewhere

  end


end
