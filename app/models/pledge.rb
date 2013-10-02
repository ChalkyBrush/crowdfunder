class Pledge < ActiveRecord::Base
  attr_accessible :amount, :project_id, :user_id

  belongs_to :user
  belongs_to :project
  validates_numericality_of :amount, :greater_than => 0, :only_integer => true
  validates_presence_of :user_id, :project_id, :amount, :on => :create
  
  def formatted_pledge
    formatted_n = "$" + amount.to_s.reverse.gsub(/...(?=.)/,'\&,').reverse
  end

end
