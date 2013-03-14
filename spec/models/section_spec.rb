require 'spec_helper'

describe Section, "Relations" do
  it { should have_many :categories }
  it { should belong_to :newspaper }
end

describe Section, "Validations" do

  it { should validate_presence_of :name}

  it { should allow_mass_assignment_of :name}
  it { should allow_mass_assignment_of :newspaper_id}

end
