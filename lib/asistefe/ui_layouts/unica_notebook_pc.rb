module Asistefe
  module UiLayouts
    class UnicaNotebookPc
      # how to get cursor pos?
      # xdotool getmouselocation --shell

      def console;                    [974,  753]; end
      def emptyness;                  [27,   555]; end

      def chrome_home_button;         [116,  80];  end

      def new_entry_button;           [1016, 436]; end

      def doctor_combo;               [680,  368]; end
      def first_doctor_of_combo;      [489,  401]; end

      def date_input;                 [678,  336]; end

      def affiliate_input;            [1250, 337]; end
      def clean_affiliate_button;     [823,  440]; end
      def patient_number_input;       [701,  340]; end
      def kinship_number_combo;       [1302, 407]; end
      def affiliate_search_button;    [720,  441]; end
      def first_affiliate_of_list;    [677,  509]; end


      def go_down_at_begining?; false; end


      def diagnosis_input;            [818,  365]; end
      def diagnosis_code_input;       [230,  401]; end
      def diagnosis_search_button;    [471,  435]; end
      def first_diagnosis_of_list;    [362,  498]; end
      def primary_diagnosis_option;   [865,  348]; end
      def secondary_diagnosis_option; [865,  375]; end
      def add_diagnosis_button;       [1200, 360]; end

      def practice_input;             [567,  639]; end
      def practice_code_input;        [160,  540]; end
      def first_practice_of_list;     [339,  568]; end
      def time_input;                 [618,  639]; end
      def qty_input;                  [735,  639]; end
      def modality_combo;             [965,  639]; end
      def first_modality_of_combo;    [890,  667]; end
      def add_practice_button;        [1209, 637]; end

      def accept_button;              [131,  691]; end
      def cancel_button;              [216,  691]; end

    end
  end
end
