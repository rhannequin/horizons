module Fixtures
  def self.mars
    File.read('spec/fixtures/bodies/mars.txt')
  end

  def self.jupiter
    File.read('spec/fixtures/bodies/jupiter.txt')
  end
end
