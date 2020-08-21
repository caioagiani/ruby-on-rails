class Contact < ApplicationRecord
  def author
    "Caio Agiani"
  end

  def as_json(options = {})
    super(methods: :author, only: [:name, :email, :birthdate, :created_at])
  end
end
