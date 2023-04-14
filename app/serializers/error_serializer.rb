class ErrorSerializer
  include JSONAPI::Serializer
  attribute :message do |object|
    if object.class == User
      "User could not be created"
    end
  end

  attribute :errors do |object|
    errors = object.errors.map do |error|
      error.full_message
    end
  end

  def self.user_not_found
    {errors: "Account not found"}
  end

  def self.incorrect_password
    {errors: "Incorrect password"}
  end
end