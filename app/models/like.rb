class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :comment, optional: true

  validate :post_or_comment_presence

  private

  def post_or_comment_presence
    unless post.present? || comment.present?
      errors.add(:base, "Like deve estar associado a um post ou a um comentário.")
    end
  end

end
