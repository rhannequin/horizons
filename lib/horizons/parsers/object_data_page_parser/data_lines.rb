module Horizons
  class DataLines
    attr_accessor :lines, :middles, :middle

    SEPARATOR = '='

    def initialize
      @lines = []
      @middles = []
    end

    def calculate_middle!
      freq = middles.inject(Hash.new(0)) { |h, v| h[v] += 1; h }
      @middle = middles.max_by { |v| freq[v] }
    end

    def export_values
      values = {}
      lines.each do |line|
        splitted_line(line).each do |v|
          splitted = v.split(SEPARATOR).map(&:strip)
          key = get_key(splitted.first)
          unit = get_unit(key)
          value = get_value(key, splitted.last)
          values[key] = { value: value, unit: unit, text: v.strip }
        end
      end
      values
    end

    def splitted_line(line)
      v1 = line.slice(0..middle - 1).strip
      v2 = line.slice(middle..-1).strip
      [v1, v2]
    end

    def get_key(line)
      case line
        when /Mean radius/
          :mean_radius
        when /Density/
          :density
        when /Mass \(/
          :mass
        when /Flattening/
          :flattening
        when /Volume/
          :volume
        when /Semi-major axis/
          :semi_major_axis
        when /Sidereal rot. period/
          :sideral_rotation_period
        when /Rot. Rate/
          :rotation_rate
        when /Mean solar day/
          :mean_solar_day
        when /Polar gravity/
          :polar_gravity
        when /Mom. of Inertia/
          :moment_of_inertia_factor
        when /Equ. gravity/
          :equator_gravity
        when /Core radius/
          :core_radius
        when /Potential Love # k2/
          :potential_love
        when /Grav spectral fact u/
          :grav_spectral_fact_u
        when /Topo. spectral fact t/
          :topo_spectral_fact_t
        when /offset/
          :figure_offset
        when /Offset/
          :offset
        when /GM \(km/
          :standard_gravitational_parameter
        when /Equatorial Radius, Re/
          :equatorial_radius
        when /GM 1-sigma/
          :gm_1_sigma
        when /Mass ratio/
          :mass_ratio
        when /Atmos. pressure/
          :atmosphere_pressure
        when /Max. angular diam./
          :maximum_agular_diameter
        when /Mean Temperature/
          :mean_temperature
        when /Visual mag/
          :visual_magnitude
        when /Geometric albedo/
          :geometric_albedo
        when /Obliquity to orbit/
          :obliquity_to_orbit
        when /Mean sidereal orb per/
          :mean_sidereal_orbit_period
        when /Orbit vel./
          :orbit_velocity
        when /Escape vel./
          :escape_velocity
        when /Hill's sphere rad. Rp/
          :hills_sphere_radius
        when /Mag. mom/
          :magnitude_moment
        else
          line.to_sym
      end
    end

    def get_unit(key)
      case key
        when :mean_radius then :km
        when :density then :'g/cm³'
        when :mass then :kg
        when :flattening then nil
        when :volume then :'km³'
        when :semi_major_axis then :km
        when :sideral_rotation_period then :h
        when :rotation_rate then :s
        when :mean_solar_day then :d
        when :polar_gravity then :'m/s²'
        when :moment_of_inertia_factor then :'I/MR²'
        when :equator_gravity then :'m/s²'
        when :core_radius then :km
        when :potential_love then nil
        when :grav_spectral_fact_u then nil
        when :topo_spectral_fact_t then nil
        when :figure_offset then :km
        when :offset then nil
        when :standard_gravitational_parameter then :'km³/s²'
        when :equatorial_radius then :km
        when :gm_1_sigma then :'km³/s²'
        when :mass_ratio then nil
        when :atmosphere_pressure then :bar
        when :maximum_agular_diameter then :'″'
        when :mean_temperature then :K
        when :visual_magnitude then nil
        when :geometric_albedo then nil
        when :obliquity_to_orbit then :deg
        when :mean_sidereal_orbit_period then :y
        when :orbit_velocity then :'km/s'
        when :escape_velocity then :'km/s'
        when :hills_sphere_radius then nil
        when :magnitude_moment then nil
        else
          nil
      end
    end

    def get_value(key, value)
      case key
        when :mean_radius
          to_numeric value
        when :density
          to_numeric value
        when :mass
          to_numeric value
        when :flattening
          value
        when :volume
          to_numeric value
        when :semi_major_axis
          to_numeric value
        when :sideral_rotation_period
          to_numeric value
        when :rotation_rate
          to_numeric value
        when :mean_solar_day
          to_numeric value
        when :polar_gravity
          to_numeric value
        when :moment_of_inertia_factor
          to_numeric value
        when :equator_gravity
          to_numeric value
        when :core_radius
          value.tr('~', '').to_i
        when :potential_love
          to_numeric value
        when :grav_spectral_fact_u
          value
        when :topo_spectral_fact_t
          value
        when :figure_offset
          value
        when :offset
          value
        when :standard_gravitational_parameter
          value.to_f
        when :equatorial_radius
          to_numeric value
        when :gm_1_sigma
          value
        when :mass_ratio
          value
        when :atmosphere_pressure
          value.to_f
        when :maximum_agular_diameter
          to_numeric value
        when :mean_temperature
          value.to_i
        when :visual_magnitude
          value.to_f
        when :geometric_albedo
          value.to_f
        when :obliquity_to_orbit
          to_numeric value
        when :mean_sidereal_orbit_period
          to_numeric value
        when :orbit_velocity
          value.to_f
        when :escape_velocity
          value.to_f
        when :hills_sphere_radius
          value.to_f
        when :magnitude_moment
          value
        else
          value
      end
    end

    def to_numeric(str)
      num = str.match(/\d*\.?\d*/).to_s.to_f
      num % 1 != 0 ? num.to_f : num.to_i
    end
  end
end
