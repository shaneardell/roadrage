class Report < ActiveRecord::Base

  belongs_to :driver

  validates_presence_of :driver
  validates_presence_of :offense

end

