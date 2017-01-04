require('faker')

module EmailGenerator

  def self.generate(list_size = 100, duplication_ratio = 0.5)
    emails = []

    while emails.length < list_size
      email = Faker::Internet.email
      emails.push email
      if rand < duplication_ratio && emails.length < list_size
        emails.push email
      end
    end

    emails.shuffle!
  end
end
