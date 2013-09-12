require_relative '../../db/config'
require 'date'

class Student < ActiveRecord::Base

  validates :email, :uniqueness => true
  validates :email, :format => { :with => /\w+[@]\w+[.]\w.+/ }
  validates :age, :numericality => { :greater_than => 4}
  validates :phone, :format => { :with => /\d{3}.*\d{3}.*\d{4}/ }

  def name
    self.first_name + " " + self.last_name
  end

  def age
    now = Date.today
    now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
  end
end
