class Contact < ApplicationRecord
  # Assiciations
  belongs_to :kind #, optional: true
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true

  def as_json(options = {})
    hash = super(options)
    hash[:birthdate] =  (I18n.l(self.birthdate) unless self.birthdate.blank?)
    hash
  end

  # def to_br
  #   {
  #     name: self.name,
  #     email: self.email,
  #     birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
  #   }
  # end

  # def author
  #   "Caio Agiani"
  # end

  # def kind_desc
  #   self.kind.description
  # end

  # def as_json(options = {})
  #   super(
  #     only: [
  #       :name, 
  #       :email, 
  #       :birthdate, 
  #       :created_at
  #     ],
  #     methods: [:kind_desc, :author], 
  #     # include: { kind: { only: :description }}, 
  #   )
  # end
end
