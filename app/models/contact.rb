class Contact < ApplicationRecord
  belongs_to :kind #, optional: true

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
