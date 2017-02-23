class User < ApplicationRecord
  has_many :evaluations
  has_many :favorites
  has_many :courses, through: :favorites

  def favorites_addition(user_id, course_id)
    Favorite.create(user_id: user_id, course_id: course_id)
  end

  def favorites_deletion(user_id, course_id)
    favorite = Favorite.where("user_id = ? AND course_id = ?", user_id, course_id)
    Favorite.destroy(favorite.first.id)
  end
end
