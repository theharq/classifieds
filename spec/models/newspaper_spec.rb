require 'spec_helper'

describe Newspaper, "Relations" do
  it { should have_many :sections }
end

describe Newspaper, "Validations" do

  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :name}
  it { should validate_presence_of :url}

  it { should allow_mass_assignment_of :name}
  it { should allow_mass_assignment_of :url}
end