require 'spec_helper'

describe Alert, "Relations" do
  it { should belong_to :category }
end

describe Alert, "Validations" do

  it { should validate_uniqueness_of :email }
  it { should validate_presence_of :keywords}
  it { should validate_presence_of :email}

  it { should allow_mass_assignment_of :keywords}
  it { should allow_mass_assignment_of :email}
end