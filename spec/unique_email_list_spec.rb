require_relative('./spec_helper')

require('unique_email_list')

describe UniqueEmailList do

  let(:list){ UniqueEmailList.new }
  let(:athena_email){ 'athena@greece.org' }
  let(:emails){ ['alan@helpful.org', 'bob@smith.com', 'sarah@work.com', 'mary@jones.com', 'paula@example.org', 'bob@smith.com', 'bob@smith.com', 'sarah@work.com'] }
  let(:emails){ ['alan@helpful.org', 'bob@smith.com', 'sarah@work.com', 'mary@jones.com', 'paula@example.org'] }

  it('starts empty') do
    expect(list.size).to eq 0
  end

  describe('#add') do

    it('adds email to list') do
      list.add(athena_email)
      expect(list.size).to eq 1
    end

    it('adds correct email') do
      list.add(athena_email)
      expect(list.emails).to include(athena_email)
    end

  end

end
