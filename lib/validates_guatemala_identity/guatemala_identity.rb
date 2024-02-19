# frozen_string_literal: true

module ValidatesGuatemalaIdentity
  class GuatemalaIdentity
    REGEX = /\A([0-9]{8})([0-9])([0-9]{2})([0-9]{2})\z/i.freeze

    def initialize(value)
      @value = value.to_s

      return unless @value.present?

      @value.match(REGEX)
      @number = Regexp.last_match(1)
      @checksum = Regexp.last_match(2).to_i
      @birth_state_code = Regexp.last_match(3).to_i
      @birth_city_code = Regexp.last_match(4).to_i
    end

    def valid?
      return true if @value.blank?
      return false if @number.nil?
      return false if @birth_state_code.zero? || @birth_state_code > biggest_state_code
      return false if @birth_city_code.zero? || @birth_city_code > biggest_city_code_for(@birth_state_code)

      checksum_matches?
    end

    private

    def checksum_matches?
      multiplied_numbers =
        (0..7).map do |index|
          (@number[index].to_i * (index + 2))
        end

      multiplied_numbers.sum % 11 == @checksum
    end

    def biggest_city_code_for(state_code)
      city_county_by_state[state_code]
    end

    def biggest_state_code
      city_county_by_state.keys.max
    end

    def city_county_by_state
      {
        1 => 17, # Guatemala
        2 => 8, # El Progreso
        3 => 16, # Sacatepéquez
        4 => 16, # Chimaltenango
        5 => 13, # Escuintla
        6 => 14, # Santa Rosa
        7 => 19, # Sololá
        8 => 8, # Totonicapán
        9 => 24, # Quetzaltenango
        10 => 20, # Suchitepéquez
        11 => 9, # Retalhuleu
        12 => 29, # San Marcos
        13 => 32, # Huehuetenango
        14 => 22, # Quiché
        15 => 8, # Baja Verapaz
        16 => 17, # Alta Verapaz
        17 => 12, # Petén
        18 => 5, # Izabal
        19 => 10, # Zacapa
        20 => 11, # Chiquimula
        21 => 7, # Jalapa
        22 => 17 # Jutiapa
      }
    end
  end
end
