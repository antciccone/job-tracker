require 'rails_helper'

describe Contact do
  describe "validations" do
    it "is valid with a full_name" do
      contact = Contact.create(full_name: "Anthony")

      expect(contact).to be_valid
  end

    it "is valid with a postion" do
      contact = Contact.create(position: "HR")

      expect(contact).to be_valid
  end


    it "is valid with a email" do
      contact = Contact.create(position: "HR")

      expect(contact).to be_valid
  end


    it "is valid with a company_id" do
      company = Company.create(name: "Bonobos", city: "NYC")
      contact = Contact.create(company_id: company.id )

      expect(contact).to be_valid
    end
  end

  describe "relationships" do
    it "a contact belong to a company" do
      company = Company.create(name: "Bonobos", city: "NYC")
      contact = Contact.create(company_id: company.id )

      expect(contact.company_id).to eq(company.id)
    end
  end
end
