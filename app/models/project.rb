# == Schema Information
#
# Table name: projects
#
#  id                 :integer          not null, primary key
#  pi                 :string(255)
#  projectnumber      :string(255)
#  sampleid           :string(255)
#  totalreads         :string(255)
#  averageqscore      :string(255)
#  percent5xcoverage  :string(255)
#  percent10xcoverage :string(255)
#  percent20xcoverage :string(255)
#  percent30xcoverage :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

class Project < ActiveRecord::Base
  
  # scope :red, -> { where(color: 'red') }
  scope :passQ, -> { where('averageqscore >= 25') }
  scope :pass5, -> { where('percent5xcoverage >= 98') }
  scope :pass10, -> { where('percent10xcoverage >= 90') }
  scope :pass20, -> { where('percent20xcoverage >= 75') }
  scope :pass30, -> { where('percent30xcoverage >= 65') }
  
  def self.piList
    self.pluck(:pi).uniq
  end
  
  def self.projectList
    self.pluck(:projectnumber).uniq
  end
  
  def passableQ?
    return "passing" if averageqscore >= 25
    "failed"
  end
  
  def passable5coverage?
    return "passing" if percent5xcoverage >= 98
    "failed"
  end
  
  def passable10coverage?
    return "passing" if percent10xcoverage >= 90
    "failed"
  end
  
  def passable20coverage?
    return "passing" if percent20xcoverage >= 75
    "failed"
  end
  
  def passable30coverage?
    return "passing" if percent30xcoverage >= 65
    "failed"
  end
  
  
end
