require 'spec_helper'

describe Alert, "Validations" do

  it { should validate_uniqueness_of :email }
  it { should validate_presence_of :keywords}
  it { should validate_presence_of :email}

  it { should allow_mass_assignment_of :keywords}
  it { should allow_mass_assignment_of :email}
end

# describe Alert, "Instance Methods" do
#   describe "#method_name" do
#     it "should do something" do
#       pending
#     end
#   end
# end

# describe Alert, "Class Methods" do
#   describe ".class_method" do
#     it "should do something" do
#       pending
#     end
#   end
# end