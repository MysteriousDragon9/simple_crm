class CustomersController < ApplicationController
  def index
    @customers=Customer.all
  end

  def alphabetized
    @customers =Cuutomer.order(:full_name)
  end

  def missing_email
    @customers =Customer.where(email: [ nil, "" ])
  end
end
