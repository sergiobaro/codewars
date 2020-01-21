#!/bin/ruby


def calculate_damage(type, enemy_type, attack, defense)
    effectiveness = calculate_effectiveness(type, enemy_type)
    return (50 * (attack / defense) * effectiveness).to_i
end

NOT_VERY_EFFECTIVE = 0.5
NEUTRAL = 1.0
SUPER_EFFECTIVE = 2.0

FIRE_TYPE = "fire"
GRASS_TYPE = "grass"
WATER_TYPE = "water"
ELECTRIC_TYPE = "electric"

STRONG = { 
    FIRE_TYPE => GRASS_TYPE,
    WATER_TYPE => FIRE_TYPE,
    GRASS_TYPE => WATER_TYPE,
    ELECTRIC_TYPE => WATER_TYPE
}

def calculate_effectiveness(type, enemy_type) 
    return NOT_VERY_EFFECTIVE if type == enemy_type
    return SUPER_EFFECTIVE if STRONG[type] == enemy_type
    return NOT_VERY_EFFECTIVE if STRONG[enemy_type] == type

    return NEUTRAL
end

# fire > grass
# fire < water
# fire = electric
# water < grass
# water < electric
# grass = electric

#          | fire | water | grass | electric
# fire     | 0.5  | 0.5   | 2.0   | 1.0    
# water    | 2.0  | 0.5   | 0.5   | 0.5
# grass    | 0.5  | 2.0   | 0.5   | 1.0
# electric | 1.0  | 2.0   | 1.0   | 0.5

# FIRE
puts calculate_effectiveness("fire", "fire") == 0.5
puts calculate_effectiveness("fire", "water") == 0.5
puts calculate_effectiveness("fire", "grass") == 2.0
puts calculate_effectiveness("fire", "electric") == 1.0

# WATER
puts calculate_effectiveness("water", "fire") == 2.0
puts calculate_effectiveness("water", "water") == 0.5
puts calculate_effectiveness("water", "grass") == 0.5
puts calculate_effectiveness("water", "electric") == 0.5

# GRASS
puts calculate_effectiveness("grass", "fire") == 0.5
puts calculate_effectiveness("grass", "water") == 2.0
puts calculate_effectiveness("grass", "grass") == 0.5
puts calculate_effectiveness("grass", "electric") == 1.0

# ELECTRIC
puts calculate_effectiveness("electric", "fire") == 1.0
puts calculate_effectiveness("electric", "water") == 2.0
puts calculate_effectiveness("electric", "grass") == 1.0
puts calculate_effectiveness("electric", "electric") == 0.5



# puts "fire <> water, 100, 100 => 25 :: " + (calculate_damage("fire", "water", 100, 100)).to_s
# puts "grass <> water, 100, 100 => 100 :: " + (calculate_damage("grass", "water", 100, 100)).to_s
# puts "electric <> fire, 100, 100 => 50 :: " + (calculate_damage("electric", "fire", 100, 100)).to_s
# puts "grass <> electric, 57, 19 => 150 :: " + (calculate_damage("grass", "electric", 57, 19)).to_s
# puts "grass <> water, 40, 40 => 100 :: " + (calculate_damage("grass", "water", 40, 40)).to_s
# puts "grass <> fire, 35, 5 => 175 :: " + (calculate_damage("grass", "fire", 35, 5)).to_s
# puts "fire <> electric, 10, 2 => 250 :: " + (calculate_damage("fire", "electric", 10, 2)).to_s

