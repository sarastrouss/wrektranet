# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
#  eventable_id   :integer
#  eventable_type :string(255)
#  name           :string(255)
#  start_time     :datetime
#  end_time       :datetime
#  all_day        :boolean          default(FALSE)
#  created_at     :datetime
#  updated_at     :datetime
#  public         :boolean          default(TRUE)
#

require 'spec_helper'

describe Event do
  it "has a valid factory" do
    FactoryGirl.create(:event).should be_valid
  end
end
