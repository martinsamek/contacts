class Contact < ActiveRecord::Base
  attr_accessible :address, :email, :first_name, :last_name, :phones_attributes, :phone_number
  has_many :phones, :dependent => :destroy

  accepts_nested_attributes_for :phones, :reject_if => lambda { |a| a[:phone_number].blank? }, :allow_destroy => true

  validates_presence_of :first_name, :last_name,
                        :message => ' - nemoze byt prazdne !!!'
  validates_presence_of :address,
                        :message => ' - nemoze byt prazdna !!!'
  validates_presence_of :email,
                        :message => ' - nemoze byt prazdny !!!'

  # kontrola jedinecnosti mena
  validates_uniqueness_of :last_name, :scope => :first_name,
                          :case_sensitive => false,
                          :message => ' - uzivatel s danym menom uz existuje !!!'

  #kontroluje spravnost formatu emailovej adresy
  validates_format_of :email,
                      :message => ' - nespravny format emailu !!!',
                      :allow_blank => true,
                      :with =>
                          %r{^(?:[_a-z0-9-]+)(\.[_a-z0-9-]+)*@([a-z0-9-]+)(\.[a-zA-Z0-9\-\.]+)*(\.[a-z]{2,4})$}i



end
