class Pick < ActiveRecord::Base
    acts_as_votable
    belongs_to :user
    belongs_to :category
    has_many :comments
    #validates :idea, presence: true, length: { maximum: 140 } # ideas are stopped at 140 characters
    
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
