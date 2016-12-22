module Fixtures
  def self.mars
    File.read('spec/fixtures/bodies/mars.txt')
  end

  def self.jupiter
    File.read('spec/fixtures/bodies/jupiter.txt')
  end

  def self.without_layout(body)
    lines = body.split("\n")
    lines.reject! { |l| l.include?('***') }
    lines.join("\n")
  end
end
