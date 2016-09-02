require 'rails_helper'

RSpec.describe Contact, type: :model do
  it "is a thing" do
    expect{Contact.new}.to_not raise_error
  end
  it "has a first name, last name, email, and address" do
    contact = Contact.new
    contact.first_name = 'Mikey'
    contact.last_name = 'Way'
    contact.email = 'mway@mcr.com'
    contact.address = '124 Jersey Way'
    expect(contact.save).to be true
    c2 = Contact.find_by_first_name('Mikey')
    expect(c2.first_name).to eq 'Mikey'
    expect(c2.last_name).to eq 'Way'
    expect(c2.email).to eq 'mway@mcr.com'
    expect(c2.address).to eq '124 Jersey Way'
  end
end
