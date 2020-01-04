module AuthorInfo
  class Base < Grape::API
    mount AuthorInfo::V1::Authors
  end
end