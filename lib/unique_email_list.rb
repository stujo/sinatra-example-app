class UniqueEmailList

  attr_reader :emails

  def initialize
    @lookup = Hash.new(0) # Hash with default of zero
    @emails = []
  end

  def add(email_address)
    @emails.push(email_address) if (@lookup[email_address] += 1) == 1
  end

  def size
    @emails.length
  end

  private

end
