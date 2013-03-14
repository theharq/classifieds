require 'spec_helper'

describe Classified, "Validations" do

  it { should belong_to :category }

  it { should validate_uniqueness_of :content }
  it { should validate_presence_of :content}

  it { should allow_mass_assignment_of :content}
end