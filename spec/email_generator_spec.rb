require_relative('./spec_helper')

require('email_generator')

describe EmailGenerator do

  describe('#generate') do
    let(:generated_with_duplicates) { EmailGenerator.generate(5, 1) }

    it('generates an array') do
      expect(generated_with_duplicates).to be_an Array
    end

    it('generates and array length 5') do
      expect(generated_with_duplicates.length).to eq 5
    end

    it('with duplicates') do
      expect(generated_with_duplicates.uniq.length).to be < 5
    end

  end
end
