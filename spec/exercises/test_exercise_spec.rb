require 'spec_helper'

describe "multiply" do
  it { expect(multiply(2, 5)).to eq 10 }
  it { expect(multiply(300, 4)).to eq 1200 }
end

describe "add_it_up" do
  it { expect(add_it_up(2, 5)).to eq 7 }
  it { expect(add_it_up(3202, 4)).to eq 3206 }
end

