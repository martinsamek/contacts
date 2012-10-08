class Phone < ActiveRecord::Base
  attr_accessible :contact_id, :phone_number, :phone_type, :contacts_attributes
  belongs_to :contacts

  # kontroluje spravnost mobilneho telefonneho cisla v medzinarodnom formate +421 911 123 456
  validates_format_of :phone_number,
                      :presence => true,
                      :message => ' - nespravny format - zadaj v medzinarodnom formate +123123123',
                      :with =>
                          %r{^[+]\d}i
end
