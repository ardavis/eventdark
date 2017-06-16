class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pledges, dependent: :destroy
  has_many :events, through: :pledges

  def attending?(event)
    pledges.where(event: event).any?
  end
end
