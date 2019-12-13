module Asistefe
  class SystemManager

    def initialize(output_interface, ui_layout, speed_control)
      @output_interface = output_interface
      @ui_layout = ui_layout
      @speed_control = speed_control
    end

    def prepare
      go_down if @ui_layout.go_down_at_begining?
      movement_sleep
      click_over(@ui_layout.doctor_combo)
      click_over(@ui_layout.first_doctor_of_combo)
    end

    def send_date(date_or_time)
      click_over(@ui_layout.date_input)
      movement_sleep
      today = Date.today
      days_to_move = (today - date_or_time.to_date).to_i
      days_to_move.times do
        send_keys('{LEFT}', false)
      end
      send_keys(' ') # space
      send_keys('{HOME}')
    end

    def send_affiliate(patient_number, kinship_number)
      click_over(@ui_layout.affiliate_input)
      # click_over(@ui_layout.clean_affiliate_button)
      network_delay
      click_over(@ui_layout.patient_number_input)
      send_keys(patient_number)
      click_over(@ui_layout.kinship_number_combo)
      send_keys(keys_for_kinship(kinship_number))
      send_keys('{RETURN}')
      click_over(@ui_layout.affiliate_search_button)
      network_delay
      click_over(@ui_layout.first_affiliate_of_list)
      network_delay
    end

    def send_diagnosis(diagnosis_code, primary = true)
      go_down unless @ui_layout.go_down_at_begining?
      click_over(@ui_layout.diagnosis_input)
      click_over(@ui_layout.diagnosis_code_input)
      send_keys(diagnosis_code)
      click_over(@ui_layout.diagnosis_search_button)
      2.times { network_delay }
      click_over(@ui_layout.first_diagnosis_of_list)
      click_over(primary ? @ui_layout.primary_diagnosis_option : @ui_layout.secondary_diagnosis_option)
      network_delay
      click_over(@ui_layout.add_diagnosis_button)
    end

    def send_practice(practice_code, time)
      click_over(@ui_layout.practice_input)
      click_over(@ui_layout.practice_code_input)
      send_keys(practice_code)
      send_keys('{RETURN}')
      2.times { network_delay }
      click_over(@ui_layout.first_practice_of_list)
      network_delay
      click_over(@ui_layout.time_input)
      time_str = time.strftime('%H%M')
      send_keys(time_str)
      click_over(@ui_layout.qty_input)
      send_keys('1')
      movement_sleep
      click_over(@ui_layout.modality_combo)
      movement_sleep
      click_over(@ui_layout.first_modality_of_combo)
      movement_sleep
      click_over(@ui_layout.add_practice_button)
    end

    def send!
      click_over(@ui_layout.accept_button)
      3.times { network_delay }
    end

    def cancel
      click_over(@ui_layout.cancel_button)
      2.times { network_delay }
    end

    def restart
      # click_over(@ui_layout.emptyness)
      # send_keys('{F5}')
      click_over(@ui_layout.chrome_home_button)
      4.times { network_delay }
      click_over(@ui_layout.new_entry_button)
      network_delay
    end

    def return_to_program
      click_over(@ui_layout.console)
    end

    private

    def go_down
      click_over(@ui_layout.emptyness)
      send_keys('{END}')
    end

    def move_to(xy)
      movement_sleep
      @output_interface.move_mouse(xy)
      movement_sleep
    end

    def click
      @output_interface.click
    end

    def send_keys(keys_as_string, with_sleep = true)
      movement_sleep if with_sleep
      @output_interface.send_keys(keys_as_string)
    end

    def click_over(xy)
      move_to(xy)
      click
    end

    def network_delay
      @speed_control.network_delay
    end

    def movement_sleep
      @speed_control.movement_sleep
    end

    def keys_for_kinship(kinship_number)
      case kinship_number
      when '00'
        '0'
      when '01'
        '00'
      when '16'
        '1111111'
      when '99'
        '9999999999'
      else
        raise "No sequence of keys available for kinship '#{kinship_number}'"
      end
    end

  end
end
