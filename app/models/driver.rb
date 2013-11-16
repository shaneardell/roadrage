class Driver < ActiveRecord::Base

  has_many :reports

  def self.search(search)
    if search
      find(:all, :conditions => ['license_plate_number LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end

