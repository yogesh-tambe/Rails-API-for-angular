object @author

attributes :id, :first_name, :last_name

child :books do
  extends "book"
end