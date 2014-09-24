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

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
