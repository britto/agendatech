require 'spec_helper'

describe Admin do
  %w(email password password_confirmation remember_me).each do |field|
    it { should allow_mass_assignment_of field }
  end
end
