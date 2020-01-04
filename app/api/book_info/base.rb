module BookInfo
  class Base < Grape::API
    mount BookInfo::V1::Books
  end
end