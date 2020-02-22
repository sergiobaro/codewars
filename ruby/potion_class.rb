#!/usr/bin/ruby

require 'test/unit'
extend Test::Unit::Assertions

class Potion
    attr_reader :color
    attr_reader :volume
  
    def initialize(color, volume)
      @color = color
      @volume = volume
    end
    
    def mix(other)
        red = weightedAverage(@color[0], @volume, other.color[0], other.volume)
        green = weightedAverage(@color[1], @volume, other.color[1], other.volume)
        blue = weightedAverage(@color[2], @volume, other.color[2], other.volume)

        Potion.new([red, green, blue], @volume + other.volume)
    end
    
    def weightedAverage(color, volume, otherColor, otherVolume)
        (((color.to_f * volume) + (otherColor.to_f * otherVolume)) / (volume + otherVolume)).ceil()
    end
end

potions = [
    Potion.new([153, 210, 199], 32),
    Potion.new([135,  34,   0], 17),
    Potion.new([18,   19,  20], 25),
    Potion.new([174, 211,  13],  4),
    Potion.new([255,  23, 148], 19),
    Potion.new([51,  102,  51],  6)
]
a = potions[0].mix(potions[1])
b = potions[0].mix(potions[2]).mix(potions[4])
c = potions[1].mix(potions[2]).mix(potions[3]).mix(potions[5])
d = potions[0].mix(potions[1]).mix(potions[2]).mix(potions[4]).mix(potions[5])
e = potions[0].mix(potions[1]).mix(potions[2]).mix(potions[3]).mix(potions[4]).mix(potions[5])

assert_equal(a.color, [147, 149, 130])
assert_equal(a.volume, 49)

assert_equal(b.color, [135, 101, 128])
assert_equal(b.volume, 76)

assert_equal(c.color, [74, 50, 18])
assert_equal(c.volume, 52)

assert_equal(d.color, [130, 91, 102])
assert_equal(d.volume, 99)

assert_equal(e.color, [132, 96, 99])
assert_equal(e.volume, 103)