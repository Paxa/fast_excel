module Libxlsxwriter
  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:format_underlines).</em>
  # 
  # === Options:
  # :underline_single ::
  #   Single underline
  # :underline_double ::
  #   Double underline
  # :underline_single_accounting ::
  #   Single accounting underline
  # :underline_double_accounting ::
  #   Double accounting underline
  # 
  # @method _enum_format_underlines_
  # @return [Symbol]
  # @scope class
  enum :format_underlines, [
    :underline_single, 1,
    :underline_double, 2,
    :underline_single_accounting, 3,
    :underline_double_accounting, 4
  ]

  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:format_scripts).</em>
  # 
  # === Options:
  # :font_superscript ::
  #   Superscript font
  # :font_subscript ::
  #   Subscript font
  # 
  # @method _enum_format_scripts_
  # @return [Symbol]
  # @scope class
  enum :format_scripts, [
    :font_superscript, 1,
    :font_subscript, 2
  ]

  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:format_alignments).</em>
  # 
  # === Options:
  # :align_none ::
  #   No alignment. Cell will use Excel's default for the data type
  # :align_left ::
  #   Left horizontal alignment
  # :align_center ::
  #   Center horizontal alignment
  # :align_right ::
  #   Right horizontal alignment
  # :align_fill ::
  #   Cell fill horizontal alignment
  # :align_justify ::
  #   Justify horizontal alignment
  # :align_center_across ::
  #   Center Across horizontal alignment
  # :align_distributed ::
  #   Left horizontal alignment
  # :align_vertical_top ::
  #   Top vertical alignment
  # :align_vertical_bottom ::
  #   Bottom vertical alignment
  # :align_vertical_center ::
  #   Center vertical alignment
  # :align_vertical_justify ::
  #   Justify vertical alignment
  # :align_vertical_distributed ::
  #   Distributed vertical alignment
  # 
  # @method _enum_format_alignments_
  # @return [Symbol]
  # @scope class
  enum :format_alignments, [
    :align_none, 0,
    :align_left, 1,
    :align_center, 2,
    :align_right, 3,
    :align_fill, 4,
    :align_justify, 5,
    :align_center_across, 6,
    :align_distributed, 7,
    :align_vertical_top, 8,
    :align_vertical_bottom, 9,
    :align_vertical_center, 10,
    :align_vertical_justify, 11,
    :align_vertical_distributed, 12
  ]

  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:format_diagonal_types).</em>
  # 
  # === Options:
  # :border_up ::
  #   
  # :border_down ::
  #   
  # :border_up_down ::
  #   
  # 
  # @method _enum_format_diagonal_types_
  # @return [Symbol]
  # @scope class
  enum :format_diagonal_types, [
    :border_up, 1,
    :border_down, 2,
    :border_up_down, 3
  ]

  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:defined_colors).</em>
  # 
  # === Options:
  # :color_black ::
  #   Black
  # :color_blue ::
  #   Blue
  # :color_brown ::
  #   Brown
  # :color_cyan ::
  #   Cyan
  # :color_gray ::
  #   Gray
  # :color_green ::
  #   Green
  # :color_lime ::
  #   Lime
  # :color_magenta ::
  #   Magenta
  # :color_navy ::
  #   Navy
  # :color_orange ::
  #   Orange
  # :color_pink ::
  #   Pink
  # :color_purple ::
  #   Purple
  # :color_red ::
  #   Red
  # :color_silver ::
  #   Silver
  # :color_white ::
  #   White
  # :color_yellow ::
  #   Yellow
  # 
  # @method _enum_defined_colors_
  # @return [Symbol]
  # @scope class
  enum :defined_colors, [
    :color_black, 16777216,
    :color_blue, 255,
    :color_brown, 8388608,
    :color_cyan, 65535,
    :color_gray, 8421504,
    :color_green, 32768,
    :color_lime, 65280,
    :color_magenta, 16711935,
    :color_navy, 128,
    :color_orange, 16737792,
    :color_pink, 16711935,
    :color_purple, 8388736,
    :color_red, 16711680,
    :color_silver, 12632256,
    :color_white, 16777215,
    :color_yellow, 16776960
  ]

  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:format_patterns).</em>
  # 
  # === Options:
  # :pattern_none ::
  #   Empty pattern
  # :pattern_solid ::
  #   Solid pattern
  # :pattern_medium_gray ::
  #   Medium gray pattern
  # :pattern_dark_gray ::
  #   Dark gray pattern
  # :pattern_light_gray ::
  #   Light gray pattern
  # :pattern_dark_horizontal ::
  #   Dark horizontal line pattern
  # :pattern_dark_vertical ::
  #   Dark vertical line pattern
  # :pattern_dark_down ::
  #   Dark diagonal stripe pattern
  # :pattern_dark_up ::
  #   Reverse dark diagonal stripe pattern
  # :pattern_dark_grid ::
  #   Dark grid pattern
  # :pattern_dark_trellis ::
  #   Dark trellis pattern
  # :pattern_light_horizontal ::
  #   Light horizontal Line pattern
  # :pattern_light_vertical ::
  #   Light vertical line pattern
  # :pattern_light_down ::
  #   Light diagonal stripe pattern
  # :pattern_light_up ::
  #   Reverse light diagonal stripe pattern
  # :pattern_light_grid ::
  #   Light grid pattern
  # :pattern_light_trellis ::
  #   Light trellis pattern
  # :pattern_gray_125 ::
  #   12.5% gray pattern
  # :pattern_gray_0625 ::
  #   6.25% gray pattern
  # 
  # @method _enum_format_patterns_
  # @return [Symbol]
  # @scope class
  enum :format_patterns, [
    :pattern_none, 0,
    :pattern_solid, 1,
    :pattern_medium_gray, 2,
    :pattern_dark_gray, 3,
    :pattern_light_gray, 4,
    :pattern_dark_horizontal, 5,
    :pattern_dark_vertical, 6,
    :pattern_dark_down, 7,
    :pattern_dark_up, 8,
    :pattern_dark_grid, 9,
    :pattern_dark_trellis, 10,
    :pattern_light_horizontal, 11,
    :pattern_light_vertical, 12,
    :pattern_light_down, 13,
    :pattern_light_up, 14,
    :pattern_light_grid, 15,
    :pattern_light_trellis, 16,
    :pattern_gray_125, 17,
    :pattern_gray_0625, 18
  ]

  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:format_borders).</em>
  # 
  # === Options:
  # :border_none ::
  #   No border
  # :border_thin ::
  #   Thin border style
  # :border_medium ::
  #   Medium border style
  # :border_dashed ::
  #   Dashed border style
  # :border_dotted ::
  #   Dotted border style
  # :border_thick ::
  #   Thick border style
  # :border_double ::
  #   Double border style
  # :border_hair ::
  #   Hair border style
  # :border_medium_dashed ::
  #   Medium dashed border style
  # :border_dash_dot ::
  #   Dash-dot border style
  # :border_medium_dash_dot ::
  #   Medium dash-dot border style
  # :border_dash_dot_dot ::
  #   Dash-dot-dot border style
  # :border_medium_dash_dot_dot ::
  #   Medium dash-dot-dot border style
  # :border_slant_dash_dot ::
  #   Slant dash-dot border style
  # 
  # @method _enum_format_borders_
  # @return [Symbol]
  # @scope class
  enum :format_borders, [
    :border_none, 0,
    :border_thin, 1,
    :border_medium, 2,
    :border_dashed, 3,
    :border_dotted, 4,
    :border_thick, 5,
    :border_double, 6,
    :border_hair, 7,
    :border_medium_dashed, 8,
    :border_dash_dot, 9,
    :border_medium_dash_dot, 10,
    :border_dash_dot_dot, 11,
    :border_medium_dash_dot_dot, 12,
    :border_slant_dash_dot, 13
  ]

  # = Fields:
  # :stqe_next ::
  #   (FFI::Pointer(*Format)) 
  class FormatListPointers < FFI::Struct
    layout :stqe_next, :pointer
  end

  # = Fields:
  # :file ::
  #   (FFI::Pointer(*FILE)) 
  # :xf_format_indices ::
  #   (HashTable) 
  # :num_xf_formats ::
  #   (FFI::Pointer(*Uint16T)) 
  # :xf_index ::
  #   (Integer) 
  # :dxf_index ::
  #   (Integer) 
  # :num_format ::
  #   (Array<Integer>) 
  # :font_name ::
  #   (Array<Integer>) 
  # :font_scheme ::
  #   (Array<Integer>) 
  # :num_format_index ::
  #   (Integer) 
  # :font_index ::
  #   (Integer) 
  # :has_font ::
  #   (Integer) 
  # :has_dxf_font ::
  #   (Integer) 
  # :font_size ::
  #   (Integer) 
  # :bold ::
  #   (Integer) 
  # :italic ::
  #   (Integer) 
  # :font_color ::
  #   (Integer) 
  # :underline ::
  #   (Integer) 
  # :font_strikeout ::
  #   (Integer) 
  # :font_outline ::
  #   (Integer) 
  # :font_shadow ::
  #   (Integer) 
  # :font_script ::
  #   (Integer) 
  # :font_family ::
  #   (Integer) 
  # :font_charset ::
  #   (Integer) 
  # :font_condense ::
  #   (Integer) 
  # :font_extend ::
  #   (Integer) 
  # :theme ::
  #   (Integer) 
  # :hyperlink ::
  #   (Integer) 
  # :hidden ::
  #   (Integer) 
  # :locked ::
  #   (Integer) 
  # :text_h_align ::
  #   (Integer) 
  # :text_wrap ::
  #   (Integer) 
  # :text_v_align ::
  #   (Integer) 
  # :text_justlast ::
  #   (Integer) 
  # :rotation ::
  #   (Integer) 
  # :fg_color ::
  #   (Integer) 
  # :bg_color ::
  #   (Integer) 
  # :pattern ::
  #   (Integer) 
  # :has_fill ::
  #   (Integer) 
  # :has_dxf_fill ::
  #   (Integer) 
  # :fill_index ::
  #   (Integer) 
  # :fill_count ::
  #   (Integer) 
  # :border_index ::
  #   (Integer) 
  # :has_border ::
  #   (Integer) 
  # :has_dxf_border ::
  #   (Integer) 
  # :border_count ::
  #   (Integer) 
  # :bottom ::
  #   (Integer) 
  # :diag_border ::
  #   (Integer) 
  # :diag_type ::
  #   (Integer) 
  # :left ::
  #   (Integer) 
  # :right ::
  #   (Integer) 
  # :top ::
  #   (Integer) 
  # :bottom_color ::
  #   (Integer) 
  # :diag_color ::
  #   (Integer) 
  # :left_color ::
  #   (Integer) 
  # :right_color ::
  #   (Integer) 
  # :top_color ::
  #   (Integer) 
  # :indent ::
  #   (Integer) 
  # :shrink ::
  #   (Integer) 
  # :merge_range ::
  #   (Integer) 
  # :reading_order ::
  #   (Integer) 
  # :just_distrib ::
  #   (Integer) 
  # :color_indexed ::
  #   (Integer) 
  # :font_only ::
  #   (Integer) 
  # :list_pointers ::
  #   (FormatListPointers) 
  module FormatWrappers
    # @return [nil] 
    def free()
      Libxlsxwriter.format_free(self)
    end
  
    # @return [Integer] 
    def get_xf_index()
      Libxlsxwriter.format_get_xf_index(self)
    end
  
    # @return [Font] 
    def get_font_key()
      Font.new Libxlsxwriter.format_get_font_key(self)
    end
  
    # @return [Border] 
    def get_border_key()
      Border.new Libxlsxwriter.format_get_border_key(self)
    end
  
    # @return [Fill] 
    def get_fill_key()
      Fill.new Libxlsxwriter.format_get_fill_key(self)
    end
  
    # @param [String] font_name 
    # @return [nil] 
    def set_font_name(font_name)
      Libxlsxwriter.format_set_font_name(self, font_name)
    end
  
    # @param [Integer] size 
    # @return [nil] 
    def set_font_size(size)
      Libxlsxwriter.format_set_font_size(self, size)
    end
  
    # @param [Integer] color 
    # @return [nil] 
    def set_font_color(color)
      Libxlsxwriter.format_set_font_color(self, color)
    end
  
    # @return [nil] 
    def set_bold()
      Libxlsxwriter.format_set_bold(self)
    end
  
    # @return [nil] 
    def set_italic()
      Libxlsxwriter.format_set_italic(self)
    end
  
    # @param [Integer] style 
    # @return [nil] 
    def set_underline(style)
      Libxlsxwriter.format_set_underline(self, style)
    end
  
    # @return [nil] 
    def set_font_strikeout()
      Libxlsxwriter.format_set_font_strikeout(self)
    end
  
    # @param [Integer] style 
    # @return [nil] 
    def set_font_script(style)
      Libxlsxwriter.format_set_font_script(self, style)
    end
  
    # @param [String] num_format 
    # @return [nil] 
    def set_num_format(num_format)
      Libxlsxwriter.format_set_num_format(self, num_format)
    end
  
    # @param [Integer] index 
    # @return [nil] 
    def set_num_format_index(index)
      Libxlsxwriter.format_set_num_format_index(self, index)
    end
  
    # @return [nil] 
    def set_unlocked()
      Libxlsxwriter.format_set_unlocked(self)
    end
  
    # @return [nil] 
    def set_hidden()
      Libxlsxwriter.format_set_hidden(self)
    end
  
    # @param [Integer] alignment 
    # @return [nil] 
    def set_align(alignment)
      Libxlsxwriter.format_set_align(self, alignment)
    end
  
    # @return [nil] 
    def set_text_wrap()
      Libxlsxwriter.format_set_text_wrap(self)
    end
  
    # @param [Integer] angle 
    # @return [nil] 
    def set_rotation(angle)
      Libxlsxwriter.format_set_rotation(self, angle)
    end
  
    # @param [Integer] level 
    # @return [nil] 
    def set_indent(level)
      Libxlsxwriter.format_set_indent(self, level)
    end
  
    # @return [nil] 
    def set_shrink()
      Libxlsxwriter.format_set_shrink(self)
    end
  
    # @param [Integer] index 
    # @return [nil] 
    def set_pattern(index)
      Libxlsxwriter.format_set_pattern(self, index)
    end
  
    # @param [Integer] color 
    # @return [nil] 
    def set_bg_color(color)
      Libxlsxwriter.format_set_bg_color(self, color)
    end
  
    # @param [Integer] color 
    # @return [nil] 
    def set_fg_color(color)
      Libxlsxwriter.format_set_fg_color(self, color)
    end
  
    # @param [Integer] style 
    # @return [nil] 
    def set_border(style)
      Libxlsxwriter.format_set_border(self, style)
    end
  
    # @param [Integer] style 
    # @return [nil] 
    def set_bottom(style)
      Libxlsxwriter.format_set_bottom(self, style)
    end
  
    # @param [Integer] style 
    # @return [nil] 
    def set_top(style)
      Libxlsxwriter.format_set_top(self, style)
    end
  
    # @param [Integer] style 
    # @return [nil] 
    def set_left(style)
      Libxlsxwriter.format_set_left(self, style)
    end
  
    # @param [Integer] style 
    # @return [nil] 
    def set_right(style)
      Libxlsxwriter.format_set_right(self, style)
    end
  
    # @param [Integer] color 
    # @return [nil] 
    def set_border_color(color)
      Libxlsxwriter.format_set_border_color(self, color)
    end
  
    # @param [Integer] color 
    # @return [nil] 
    def set_bottom_color(color)
      Libxlsxwriter.format_set_bottom_color(self, color)
    end
  
    # @param [Integer] color 
    # @return [nil] 
    def set_top_color(color)
      Libxlsxwriter.format_set_top_color(self, color)
    end
  
    # @param [Integer] color 
    # @return [nil] 
    def set_left_color(color)
      Libxlsxwriter.format_set_left_color(self, color)
    end
  
    # @param [Integer] color 
    # @return [nil] 
    def set_right_color(color)
      Libxlsxwriter.format_set_right_color(self, color)
    end
  
    # @param [Integer] value 
    # @return [nil] 
    def set_diag_type(value)
      Libxlsxwriter.format_set_diag_type(self, value)
    end
  
    # @param [Integer] color 
    # @return [nil] 
    def set_diag_color(color)
      Libxlsxwriter.format_set_diag_color(self, color)
    end
  
    # @param [Integer] value 
    # @return [nil] 
    def set_diag_border(value)
      Libxlsxwriter.format_set_diag_border(self, value)
    end
  
    # @return [nil] 
    def set_font_outline()
      Libxlsxwriter.format_set_font_outline(self)
    end
  
    # @return [nil] 
    def set_font_shadow()
      Libxlsxwriter.format_set_font_shadow(self)
    end
  
    # @param [Integer] value 
    # @return [nil] 
    def set_font_family(value)
      Libxlsxwriter.format_set_font_family(self, value)
    end
  
    # @param [Integer] value 
    # @return [nil] 
    def set_font_charset(value)
      Libxlsxwriter.format_set_font_charset(self, value)
    end
  
    # @param [String] font_scheme 
    # @return [nil] 
    def set_font_scheme(font_scheme)
      Libxlsxwriter.format_set_font_scheme(self, font_scheme)
    end
  
    # @return [nil] 
    def set_font_condense()
      Libxlsxwriter.format_set_font_condense(self)
    end
  
    # @return [nil] 
    def set_font_extend()
      Libxlsxwriter.format_set_font_extend(self)
    end
  
    # @param [Integer] value 
    # @return [nil] 
    def set_reading_order(value)
      Libxlsxwriter.format_set_reading_order(self, value)
    end
  
    # @param [Integer] value 
    # @return [nil] 
    def set_theme(value)
      Libxlsxwriter.format_set_theme(self, value)
    end

    [:font_size, :underline, :font_script, :rotation, :indent, :pattern, :border, :num_format, :font_name].each do |prop|
      alias :"#{prop}=" :"set_#{prop}"
      define_method(prop) do
        self[prop]
      end
    end
  end

  class Format < FFI::Struct
    include FormatWrappers
    layout :file, :pointer,
           :xf_format_indices, :pointer, #HashTable.ptr,
           :dxf_format_indices, :pointer,
           :num_xf_formats, :pointer,
           :num_dxf_formats, :pointer,

           :xf_index, :int32_t,
           :dxf_index, :int32_t,
           :xf_id, :int32_t,

           :num_format, [:char, 128],
           :font_name, [:char, 128],
           :font_scheme, [:char, 128],
           :num_format_index, :uint16,
           :font_index, :uint16,
           :has_font, :uchar,
           :has_dxf_font, :uchar,
           :font_size, :double,

           :bold, :uchar,
           :italic, :uchar,
           :font_color, :int,
           :underline, :uchar,
           :font_strikeout, :uchar,
           :font_outline, :uchar,
           :font_shadow, :uchar,
           :font_script, :uchar,
           :font_family, :uchar,
           :font_charset, :uchar,
           :font_condense, :uchar,
           :font_extend, :uchar,
           :theme, :uchar,
           :hyperlink, :uchar,

           :hidden, :uchar,
           :locked, :uchar,

           :text_h_align, :uchar,
           :text_wrap, :uchar,
           :text_v_align, :uchar,
           :text_justlast, :uchar,
           :rotation, :short,

           :fg_color, :int,
           :bg_color, :int,
           :dxf_fg_color, :int,
           :dxf_bg_color, :int,

           :pattern, :uchar,
           :has_fill, :uchar,
           :has_dxf_fill, :uchar,
           :fill_index, :int,
           :fill_count, :int,

           :border_index, :int,
           :has_border, :uchar,
           :has_dxf_border, :uchar,
           :border_count, :int,

           :bottom, :uchar,
           :diag_border, :uchar,
           :diag_type, :uchar,
           :left, :uchar,
           :right, :uchar,
           :top, :uchar,
           :bottom_color, :int,
           :diag_color, :int,
           :left_color, :int,
           :right_color, :int,
           :top_color, :int,

           :indent, :uchar,
           :shrink, :uchar,
           :merge_range, :uchar,
           :reading_order, :uchar,
           :just_distrib, :uchar,
           :color_indexed, :uchar,
           :font_only, :uchar,

           :quote_prefix, :uchar,
           :list_pointers, FormatListPointers.by_value
  end

  
  # = Fields:
  # :font_name ::
  #   (Array<Integer>) 
  # :font_size ::
  #   (Integer) 
  # :bold ::
  #   (Integer) 
  # :italic ::
  #   (Integer) 
  # :underline ::
  #   (Integer) 
  # :font_strikeout ::
  #   (Integer) 
  # :font_outline ::
  #   (Integer) 
  # :font_shadow ::
  #   (Integer) 
  # :font_script ::
  #   (Integer) 
  # :font_family ::
  #   (Integer) 
  # :font_charset ::
  #   (Integer) 
  # :font_condense ::
  #   (Integer) 
  # :font_extend ::
  #   (Integer) 
  # :font_color ::
  #   (Integer) 
  class Font < FFI::Struct
    layout :font_name, [:char, 128],
           :font_size, :double,
           :bold, :uchar,
           :italic, :uchar,
           :underline, :uchar,
           :font_strikeout, :uchar,
           :font_outline, :uchar,
           :font_shadow, :uchar,
           :font_script, :uchar,
           :font_family, :uchar,
           :font_charset, :uchar,
           :font_condense, :uchar,
           :font_extend, :uchar,
           :font_color, :int
  end
  
  # = Fields:
  # :bottom ::
  #   (Integer) 
  # :diag_border ::
  #   (Integer) 
  # :diag_type ::
  #   (Integer) 
  # :left ::
  #   (Integer) 
  # :right ::
  #   (Integer) 
  # :top ::
  #   (Integer) 
  # :bottom_color ::
  #   (Integer) 
  # :diag_color ::
  #   (Integer) 
  # :left_color ::
  #   (Integer) 
  # :right_color ::
  #   (Integer) 
  # :top_color ::
  #   (Integer) 
  class Border < FFI::Struct
    layout :bottom, :uchar,
           :diag_border, :uchar,
           :diag_type, :uchar,
           :left, :uchar,
           :right, :uchar,
           :top, :uchar,
           :bottom_color, :int,
           :diag_color, :int,
           :left_color, :int,
           :right_color, :int,
           :top_color, :int
  end
  
  # = Fields:
  # :fg_color ::
  #   (Integer) 
  # :bg_color ::
  #   (Integer) 
  # :pattern ::
  #   (Integer) 
  class Fill < FFI::Struct
    layout :fg_color, :int,
           :bg_color, :int,
           :pattern, :uchar
  end
  
  # @method format_new()
  # @return [Format] 
  # @scope class
  attach_function :format_new, :lxw_format_new, [], Format
  
  # @method format_free(format)
  # @param [Format] format 
  # @return [nil] 
  # @scope class
  attach_function :format_free, :lxw_format_free, [Format], :void
  
  # @method format_get_xf_index(format)
  # @param [Format] format 
  # @return [Integer] 
  # @scope class
  attach_function :format_get_xf_index, :lxw_format_get_xf_index, [Format], :int
  
  # @method format_get_font_key(format)
  # @param [Format] format 
  # @return [Font] 
  # @scope class
  attach_function :format_get_font_key, :lxw_format_get_font_key, [Format], Font
  
  # @method format_get_border_key(format)
  # @param [Format] format 
  # @return [Border] 
  # @scope class
  attach_function :format_get_border_key, :lxw_format_get_border_key, [Format], Border
  
  # @method format_get_fill_key(format)
  # @param [Format] format 
  # @return [Fill] 
  # @scope class
  attach_function :format_get_fill_key, :lxw_format_get_fill_key, [Format], Fill
  
  # @method format_check_color(color)
  # @param [Integer] color 
  # @return [Integer] 
  # @scope class
  attach_function :format_check_color, :lxw_format_check_color, [:int], :int
  
  # @method format_set_font_name(format, font_name)
  # @param [Format] format 
  # @param [String] font_name 
  # @return [nil] 
  # @scope class
  attach_function :format_set_font_name, :format_set_font_name, [Format, :string], :void
  
  # @method format_set_font_size(format, size)
  # @param [Format] format 
  # @param [Integer] size 
  # @return [nil] 
  # @scope class
  attach_function :format_set_font_size, :format_set_font_size, [Format, :double], :void
  
  # @method format_set_font_color(format, color)
  # @param [Format] format 
  # @param [Integer] color 
  # @return [nil] 
  # @scope class
  attach_function :format_set_font_color, :format_set_font_color, [Format, :int], :void
  
  # @method format_set_bold(format)
  # @param [Format] format 
  # @return [nil] 
  # @scope class
  attach_function :format_set_bold, :format_set_bold, [Format], :void
  
  # @method format_set_italic(format)
  # @param [Format] format 
  # @return [nil] 
  # @scope class
  attach_function :format_set_italic, :format_set_italic, [Format], :void
  
  # @method format_set_underline(format, style)
  # @param [Format] format 
  # @param [Integer] style 
  # @return [nil] 
  # @scope class
  attach_function :format_set_underline, :format_set_underline, [Format, :uchar], :void
  
  # @method format_set_font_strikeout(format)
  # @param [Format] format 
  # @return [nil] 
  # @scope class
  attach_function :format_set_font_strikeout, :format_set_font_strikeout, [Format], :void
  
  # @method format_set_font_script(format, style)
  # @param [Format] format 
  # @param [Integer] style 
  # @return [nil] 
  # @scope class
  attach_function :format_set_font_script, :format_set_font_script, [Format, :uchar], :void
  
  # @method format_set_num_format(format, num_format)
  # @param [Format] format 
  # @param [String] num_format 
  # @return [nil] 
  # @scope class
  attach_function :format_set_num_format, :format_set_num_format, [Format, :string], :void
  
  # @method format_set_num_format_index(format, index)
  # @param [Format] format 
  # @param [Integer] index 
  # @return [nil] 
  # @scope class
  attach_function :format_set_num_format_index, :format_set_num_format_index, [Format, :uchar], :void
  
  # @method format_set_unlocked(format)
  # @param [Format] format 
  # @return [nil] 
  # @scope class
  attach_function :format_set_unlocked, :format_set_unlocked, [Format], :void
  
  # @method format_set_hidden(format)
  # @param [Format] format 
  # @return [nil] 
  # @scope class
  attach_function :format_set_hidden, :format_set_hidden, [Format], :void
  
  # @method format_set_align(format, alignment)
  # @param [Format] format 
  # @param [Integer] alignment 
  # @return [nil] 
  # @scope class
  attach_function :format_set_align, :format_set_align, [Format, :uchar], :void
  
  # @method format_set_text_wrap(format)
  # @param [Format] format 
  # @return [nil] 
  # @scope class
  attach_function :format_set_text_wrap, :format_set_text_wrap, [Format], :void
  
  # @method format_set_rotation(format, angle)
  # @param [Format] format 
  # @param [Integer] angle 
  # @return [nil] 
  # @scope class
  attach_function :format_set_rotation, :format_set_rotation, [Format, :short], :void
  
  # @method format_set_indent(format, level)
  # @param [Format] format 
  # @param [Integer] level 
  # @return [nil] 
  # @scope class
  attach_function :format_set_indent, :format_set_indent, [Format, :uchar], :void
  
  # @method format_set_shrink(format)
  # @param [Format] format 
  # @return [nil] 
  # @scope class
  attach_function :format_set_shrink, :format_set_shrink, [Format], :void
  
  # @method format_set_pattern(format, index)
  # @param [Format] format 
  # @param [Integer] index 
  # @return [nil] 
  # @scope class
  attach_function :format_set_pattern, :format_set_pattern, [Format, :uchar], :void
  
  # @method format_set_bg_color(format, color)
  # @param [Format] format 
  # @param [Integer] color 
  # @return [nil] 
  # @scope class
  attach_function :format_set_bg_color, :format_set_bg_color, [Format, :int], :void
  
  # @method format_set_fg_color(format, color)
  # @param [Format] format 
  # @param [Integer] color 
  # @return [nil] 
  # @scope class
  attach_function :format_set_fg_color, :format_set_fg_color, [Format, :int], :void
  
  # @method format_set_border(format, style)
  # @param [Format] format 
  # @param [Integer] style 
  # @return [nil] 
  # @scope class
  attach_function :format_set_border, :format_set_border, [Format, :uchar], :void
  
  # @method format_set_bottom(format, style)
  # @param [Format] format 
  # @param [Integer] style 
  # @return [nil] 
  # @scope class
  attach_function :format_set_bottom, :format_set_bottom, [Format, :uchar], :void
  
  # @method format_set_top(format, style)
  # @param [Format] format 
  # @param [Integer] style 
  # @return [nil] 
  # @scope class
  attach_function :format_set_top, :format_set_top, [Format, :uchar], :void
  
  # @method format_set_left(format, style)
  # @param [Format] format 
  # @param [Integer] style 
  # @return [nil] 
  # @scope class
  attach_function :format_set_left, :format_set_left, [Format, :uchar], :void
  
  # @method format_set_right(format, style)
  # @param [Format] format 
  # @param [Integer] style 
  # @return [nil] 
  # @scope class
  attach_function :format_set_right, :format_set_right, [Format, :uchar], :void
  
  # @method format_set_border_color(format, color)
  # @param [Format] format 
  # @param [Integer] color 
  # @return [nil] 
  # @scope class
  attach_function :format_set_border_color, :format_set_border_color, [Format, :int], :void
  
  # @method format_set_bottom_color(format, color)
  # @param [Format] format 
  # @param [Integer] color 
  # @return [nil] 
  # @scope class
  attach_function :format_set_bottom_color, :format_set_bottom_color, [Format, :int], :void
  
  # @method format_set_top_color(format, color)
  # @param [Format] format 
  # @param [Integer] color 
  # @return [nil] 
  # @scope class
  attach_function :format_set_top_color, :format_set_top_color, [Format, :int], :void
  
  # @method format_set_left_color(format, color)
  # @param [Format] format 
  # @param [Integer] color 
  # @return [nil] 
  # @scope class
  attach_function :format_set_left_color, :format_set_left_color, [Format, :int], :void
  
  # @method format_set_right_color(format, color)
  # @param [Format] format 
  # @param [Integer] color 
  # @return [nil] 
  # @scope class
  attach_function :format_set_right_color, :format_set_right_color, [Format, :int], :void
  
  # @method format_set_diag_type(format, value)
  # @param [Format] format 
  # @param [Integer] value 
  # @return [nil] 
  # @scope class
  attach_function :format_set_diag_type, :format_set_diag_type, [Format, :uchar], :void
  
  # @method format_set_diag_color(format, color)
  # @param [Format] format 
  # @param [Integer] color 
  # @return [nil] 
  # @scope class
  attach_function :format_set_diag_color, :format_set_diag_color, [Format, :int], :void
  
  # @method format_set_diag_border(format, value)
  # @param [Format] format 
  # @param [Integer] value 
  # @return [nil] 
  # @scope class
  attach_function :format_set_diag_border, :format_set_diag_border, [Format, :uchar], :void
  
  # @method format_set_font_outline(format)
  # @param [Format] format 
  # @return [nil] 
  # @scope class
  attach_function :format_set_font_outline, :format_set_font_outline, [Format], :void
  
  # @method format_set_font_shadow(format)
  # @param [Format] format 
  # @return [nil] 
  # @scope class
  attach_function :format_set_font_shadow, :format_set_font_shadow, [Format], :void
  
  # @method format_set_font_family(format, value)
  # @param [Format] format 
  # @param [Integer] value 
  # @return [nil] 
  # @scope class
  attach_function :format_set_font_family, :format_set_font_family, [Format, :uchar], :void
  
  # @method format_set_font_charset(format, value)
  # @param [Format] format 
  # @param [Integer] value 
  # @return [nil] 
  # @scope class
  attach_function :format_set_font_charset, :format_set_font_charset, [Format, :uchar], :void
  
  # @method format_set_font_scheme(format, font_scheme)
  # @param [Format] format 
  # @param [String] font_scheme 
  # @return [nil] 
  # @scope class
  attach_function :format_set_font_scheme, :format_set_font_scheme, [Format, :string], :void
  
  # @method format_set_font_condense(format)
  # @param [Format] format 
  # @return [nil] 
  # @scope class
  attach_function :format_set_font_condense, :format_set_font_condense, [Format], :void
  
  # @method format_set_font_extend(format)
  # @param [Format] format 
  # @return [nil] 
  # @scope class
  attach_function :format_set_font_extend, :format_set_font_extend, [Format], :void
  
  # @method format_set_reading_order(format, value)
  # @param [Format] format 
  # @param [Integer] value 
  # @return [nil] 
  # @scope class
  attach_function :format_set_reading_order, :format_set_reading_order, [Format, :uchar], :void
  
  # @method format_set_theme(format, value)
  # @param [Format] format 
  # @param [Integer] value 
  # @return [nil] 
  # @scope class
  attach_function :format_set_theme, :format_set_theme, [Format, :uchar], :void
end