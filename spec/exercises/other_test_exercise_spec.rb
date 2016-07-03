require 'spec_helper'

describe "green" do
  it { expect(green(2, 5)).to eq 10 }
  it { expect(green(300, 4)).to eq 1200 }
end

describe "plus_one" do
  it { expect(plus_one(5)).to eq 6 }
  it { expect(plus_one(3205)).to eq 3206 }
end

