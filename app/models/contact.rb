class Contact < ApplicationRecord
  # Assiciations
  belongs_to :kind #, optional: true
  has_many :phones

  def to_br
    {
      name: self.name,
      email: self.email,
      birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
    }
  end

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
