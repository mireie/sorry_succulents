class Product < ApplicaitonRedcord
  has_many :reviews, dependent: :destory
end