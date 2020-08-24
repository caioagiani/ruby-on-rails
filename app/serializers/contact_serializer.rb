class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate 

  has_many :phones
  has_one :address

  belongs_to :kind do
    link(:related) { kind_url(object.id) }
  end

  # link(:self) { contact_url(object.id) }
  # meta do
  #   { author: "Caio Agiani" }
  # end

  def attributes(*args)
    hash = super(*args)
    hash[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    hash
  end

end
 