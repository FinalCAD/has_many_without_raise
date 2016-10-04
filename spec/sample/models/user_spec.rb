require 'spec_helper'

describe User do
  let(:user)  { User.find_by_name('John Doe') }
  let(:skill) { Skill.find_by_name('Tidy') }

  before { user.skills << skill }

  after { user.skills.destroy_all }

  subject { user.skills << skill }

  it { expect { subject }.to_not raise_error }

  it do
    expect {
      subject
    }.to_not change {
      user.skills.size
    }
  end

end
