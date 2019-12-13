module Asistefe
  module UiLayouts
    class UnicaDesktopPc

      # how to get cursor pos?
      # xdotool getmouselocation --shell

      def console;                    [2000, 400]; end
      def emptyness;                  [27,   555]; end

      def chrome_home_button;         [101,  71];  end

      def new_entry_button;           [1186, 417]; end

      def doctor_combo;               [488,  220]; end
      def first_doctor_of_combo;      [489,  247]; end

      def date_input;                 [482,  186]; end

      def affiliate_input;            [1304, 186]; end
      def clean_affiliate_button;     [1055, 324]; end
      def patient_number_input;       [915,  290]; end
      def kinship_number_combo;       [1371, 289]; end
      def affiliate_search_button;    [950,  324]; end
      def first_affiliate_of_list;    [728,  391]; end


      def go_down_at_begining?; true; end


      def diagnosis_input;            [150,  497]; end
      def diagnosis_code_input;       [222,  532]; end
      def diagnosis_search_button;    [479,  566]; end
      def first_diagnosis_of_list;    [231,  630]; end
      def primary_diagnosis_option;   [1014, 481]; end
      def secondary_diagnosis_option; [1015, 510]; end
      def add_diagnosis_button;       [1400, 495]; end

      def practice_input;             [117,  768]; end
      def practice_code_input;        [123,  671]; end
      def first_practice_of_list;     [191,  732]; end
      def time_input;                 [730,  769]; end
      def qty_input;                  [866,  769]; end
      def modality_combo;             [1136, 770]; end
      def first_modality_of_combo;    [1015, 800]; end
      def add_practice_button;        [1410, 769]; end

      def accept_button;              [136,  824]; end
      def cancel_button;              [231,  826]; end

    end
  end
end
