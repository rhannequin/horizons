module Fixtures
  def self.mercury
    File.read('spec/fixtures/bodies/mercury.txt')
  end

  def self.venus
    File.read('spec/fixtures/bodies/venus.txt')
  end

  def self.earth
    File.read('spec/fixtures/bodies/earth.txt')
  end

  def self.mars
    File.read('spec/fixtures/bodies/mars.txt')
  end

  def self.jupiter
    File.read('spec/fixtures/bodies/jupiter.txt')
  end

  def self.saturn
    File.read('spec/fixtures/bodies/saturn.txt')
  end

  def self.uranus
    File.read('spec/fixtures/bodies/uranus.txt')
  end

  def self.neptune
    File.read('spec/fixtures/bodies/neptune.txt')
  end

  def self.planets
    %w( mercury venus earth mars jupiter saturn uranus neptune )
  end

  def self.without_layout(body)
    lines = body.split("\n")
    lines.reject! { |l| l.include?('***') }
    lines.join("\n")
  end
end
