class Candidate < ApplicationRecord
    validates :name, presence: true
    validates :party, presence: true
    validates :age, presence: true
    validates :politics, presence: true


    has_many :vote_logs, dependent: :destroy
end
