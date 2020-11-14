module Asistefe
  class SystemManager

    # how to get cursor pos?
    # xdotool getmouselocation --shell

    NETWORK_SLEEP_TIME = 1 * 4 # seconds (weekends = 1.5, week = 4)
    MOVEMENT_SLEEP_TIME = 0.4 # seconds

    CONSOLE                    = [2000, 400]
    EMPTYNESS                  = [27,   555]

    CHROME_HOME_BUTTON         = [118,   76]

    NEW_ENTRY_BUTTON           = [1186, 417]

    DOCTOR_COMBO               = [748,  356]

    FIRST_DOCTOR_OF_COMBO      = [588,  391]

    DATE_INPUT                 = [744,  326]

    AFFILIATE_INPUT            = [1419, 329]
    CLEAN_AFFILIATE_BUTTON     = [1062, 462]
    PATIENT_NUMBER_INPUT       = [914,  427]
    KINSHIP_NUMBER_COMBO       = [1530, 429]
    AFFILIATE_SEARCH_BUTTON    = [953,  461]
    FIRST_AFFILIATE_OF_LIST    = [892,  531]

    DIAGNOSIS_INPUT            = [969,  492]
    DIAGNOSIS_CODE_INPUT       = [220,  531]
    DIAGNOSIS_SEARCH_BUTTON    = [479,  565]
    FIRST_DIAGNOSIS_OF_LIST    = [368,  635]
    PRIMARY_DIAGNOSIS_OPTION   = [1014, 481]
    SECONDARY_DIAGNOSIS_OPTION = [1015, 510]
    ADD_DIAGNOSIS_BUTTON       = [1400, 495]

    PRACTICE_INPUT             = [117,  768]
    PRACTICE_CODE_INPUT        = [123,  671]
    FIRST_PRACTICE_OF_LIST     = [191,  732]
    # PRACTICE_CODE_INPUT        = [139,  639]
    # FIRST_PRACTICE_OF_LIST     = [202,  700]
    TIME_INPUT                 = [730,  769]
    QTY_INPUT                  = [866,  769]
    MODALITY_COMBO             = [1136, 770]
    FIRST_MODALITY_OF_COMBO    = [1015, 800]
    ADD_PRACTICE_BUTTON        = [1410, 769]

    ACCEPT_BUTTON              = [136,  824]
    CANCEL_BUTTON              = [231,  826]

    ERROR_ACCEPT_BUTTON        = [788,  283]

    def initialize(output_interface)
      @output_interface = output_interface
    end

    def prepare
      click_over(EMPTYNESS)
      movement_sleep
      click_over(DOCTOR_COMBO)
      click_over(FIRST_DOCTOR_OF_COMBO)
    end

    def send_date(date_or_time)
      click_over(DATE_INPUT)
      movement_sleep
      today = Date.today
      days_to_move = (today - date_or_time.to_date).to_i
      days_to_move.times do
        send_keys('{LEFT}', false)
      end
      movement_sleep
      send_keys(' ') # space
      movement_sleep
      send_keys('{HOME}')
      movement_sleep
    end

    def send_affiliate(patient_number, kinship_number)
      click_over(AFFILIATE_INPUT)
      # click_over(CLEAN_AFFILIATE_BUTTON)
      network_delay
      click_over(PATIENT_NUMBER_INPUT)
      send_keys(patient_number)
      click_over(KINSHIP_NUMBER_COMBO)
      send_keys(keys_for_kinship(kinship_number))
      send_keys('{RETURN}')
      click_over(AFFILIATE_SEARCH_BUTTON)
      network_delay
      click_over(FIRST_AFFILIATE_OF_LIST)
      network_delay
    end

    def send_diagnosis(diagnosis_code, primary = true)
      send_keys('{END}')
      movement_sleep
      click_over(DIAGNOSIS_INPUT)
      click_over(DIAGNOSIS_CODE_INPUT)
      send_keys(diagnosis_code)
      click_over(DIAGNOSIS_SEARCH_BUTTON)
      2.times { network_delay }
      click_over(FIRST_DIAGNOSIS_OF_LIST)
      click_over(primary ? PRIMARY_DIAGNOSIS_OPTION : SECONDARY_DIAGNOSIS_OPTION)
      network_delay
      click_over(ADD_DIAGNOSIS_BUTTON)
    end

    def send_practice(practice_code, time)
      click_over(PRACTICE_INPUT)
      click_over(PRACTICE_CODE_INPUT)
      send_keys(practice_code)
      send_keys('{RETURN}')
      2.times { network_delay }
      click_over(FIRST_PRACTICE_OF_LIST)
      network_delay
      click_over(TIME_INPUT)
      time_str = time.strftime('%H%M')
      send_keys(time_str)
      click_over(QTY_INPUT)
      send_keys('1')
      movement_sleep
      click_over(MODALITY_COMBO)
      movement_sleep
      click_over(FIRST_MODALITY_OF_COMBO)
      movement_sleep
      click_over(ADD_PRACTICE_BUTTON)
    end

    def send!
      click_over(ACCEPT_BUTTON)
      3.times { network_delay }
    end

    def cancel
      click_over(CANCEL_BUTTON)
      2.times { network_delay }
    end

    def restart
      # click_over(EMPTYNESS)
      # send_keys('{F5}')
      click_over(CHROME_HOME_BUTTON)
      3.times { network_delay }
      click_over(ERROR_ACCEPT_BUTTON)
      network_delay
      click_over(NEW_ENTRY_BUTTON)
      network_delay
    end

    def return_to_program
      click_over(CONSOLE)
    end

    private

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
      sleep(NETWORK_SLEEP_TIME)
    end

    def movement_sleep
      sleep(MOVEMENT_SLEEP_TIME)
    end

    def keys_for_kinship(kinship_number)
      case kinship_number
      when '00'
        '0'
      when '01'
        '00'
      when '02'
        '000'
      when '03'
        '0000'
      when '04'
        '00000'
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
