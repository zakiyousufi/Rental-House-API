class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :f_name, :email, :avatar
end
