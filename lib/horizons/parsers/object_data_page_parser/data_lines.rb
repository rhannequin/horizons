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
          values[change_name(splitted.first)] = splitted.last
        end
      end
      values
    end

    def splitted_line(line)
      v1 = line.slice(0..middle - 1).strip
      v2 = line.slice(middle..-1).strip
      [v1, v2]
    end

    def change_name(old_name)
      case old_name
      when 'Mean radius (km)'
        :mean_radius
      when 'Density (g cm^-3)'
        :density
      when 'Mass (10^23 kg )'
        :mass
      when 'Flattening, f'
        :flattening
      when 'Volume (x10^10 km^3)'
        :volume
      when 'Semi-major axis'
        :semi_major_axis
      when 'Sidereal rot. period'
        :sideral_rotation_period
      when 'Rot. Rate (x10^5 s)'
        :rotation_rate
      when 'Mean solar day'
        :mean_solar_day
      when 'Polar gravity ms^-2'
        :polar_gravity
      when 'Mom. of Inertia'
        :moment_of_inertia
      when 'Equ. gravity  ms^-2'
        :equator_gravity
      when 'Core radius (km)'
        :core_radius
      when 'Potential Love # k2'
        :potential_love
      when 'Grav spectral fact u'
        :grav_spectral_fact_u
      when 'Topo. spectral fact t'
        :topo_spectral_fact_t
      when 'Fig. offset (Rcf-Rcm)'
        :figure_offset
      when 'Offset (lat./long.)'
        :offset
      when 'GM (km^3 s^-2)'
        :standard_gravitational_parameter
      when 'Equatorial Radius, Re'
        :equatorial_radius
      when 'GM 1-sigma (km^3 s^-2)'
        :gm_1_sigma
      when 'Mass ratio (Sun/Mars)'
        :mass_ratio
      when 'Atmos. pressure (bar)'
        :atmosphere_pressure
      when 'Max. angular diam.'
        :maximum_agular_diameter
      when 'Mean Temperature (K)'
        :mean_temperature
      when 'Visual mag. V(1,0)'
        :visual_magnitude
      when 'Geometric albedo'
        :geometric_albedo
      when 'Obliquity to orbit'
        :obliquity_to_orbit
      when 'Mean sidereal orb per'
        :mean_sidereal_orbit_period
      when 'Orbit vel.  km/s'
        :orbit_velocity
      when 'Escape vel. km/s'
        :escape_velocity
      when "Hill's sphere rad. Rp"
        :hills_sphere_radius
      when 'Mag. mom (gauss Rp^3)'
        :magnitude_moment
      end
    end
  end
end
