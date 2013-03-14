require 'spec_helper'

describe Category, "Relations" do
  it { should have_many :classifieds }
  it { should belong_to :section }
end

describe Category, "Validations" do
  it { should validate_presence_of :name}
  it { should validate_presence_of :url}

  it { should allow_mass_assignment_of :name}
  it { should allow_mass_assignment_of :url}
  it { should allow_mass_assignment_of :section_id}

end