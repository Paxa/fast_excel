module Libxlsxwriter
  # = Fields:
  # :stqh_first ::
  #   (FFI::Pointer(*ChartSeries)) 
  # :stqh_last ::
  #   (FFI::Pointer(**ChartSeries)) 

  class ChartSeriesList < FFI::Struct
    layout :stqh_first, :pointer,
           :stqh_last, :pointer
  end
  
  # = Fields:
  # :stqh_first ::
  #   (FFI::Pointer(*SeriesDataPoint)) 
  # :stqh_last ::
  #   (FFI::Pointer(**SeriesDataPoint)) 
  class SeriesDataPoints < FFI::Struct
    layout :stqh_first, :pointer,
           :stqh_last, :pointer
  end
  
  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:chart_type).</em>
  # 
  # === Options:
  # :none ::
  #   None.
  # :area ::
  #   Area chart.
  # :area_stacked ::
  #   Area chart - stacked.
  # :area_stacked_percent ::
  #   Area chart - percentage stacked.
  # :bar ::
  #   Bar chart.
  # :bar_stacked ::
  #   Bar chart - stacked.
  # :bar_stacked_percent ::
  #   Bar chart - percentage stacked.
  # :column ::
  #   Column chart.
  # :column_stacked ::
  #   Column chart - stacked.
  # :column_stacked_percent ::
  #   Column chart - percentage stacked.
  # :doughnut ::
  #   Doughnut chart.
  # :line ::
  #   Line chart.
  # :pie ::
  #   Pie chart.
  # :scatter ::
  #   Scatter chart.
  # :scatter_straight ::
  #   Scatter chart - straight.
  # :scatter_straight_with_markers ::
  #   Scatter chart - straight with markers.
  # :scatter_smooth ::
  #   Scatter chart - smooth.
  # :scatter_smooth_with_markers ::
  #   Scatter chart - smooth with markers.
  # :radar ::
  #   Radar chart.
  # :radar_with_markers ::
  #   Radar chart - with markers.
  # :radar_filled ::
  #   Radar chart - filled.
  # 
  # @method _enum_chart_type_
  # @return [Symbol]
  # @scope class
  enum :chart_type, [
    :none, 0,
    :area, 1,
    :area_stacked, 2,
    :area_stacked_percent, 3,
    :bar, 4,
    :bar_stacked, 5,
    :bar_stacked_percent, 6,
    :column, 7,
    :column_stacked, 8,
    :column_stacked_percent, 9,
    :doughnut, 10,
    :line, 11,
    :pie, 12,
    :scatter, 13,
    :scatter_straight, 14,
    :scatter_straight_with_markers, 15,
    :scatter_smooth, 16,
    :scatter_smooth_with_markers, 17,
    :radar, 18,
    :radar_with_markers, 19,
    :radar_filled, 20
  ]
  
  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:chart_legend_position).</em>
  # 
  # === Options:
  # :none ::
  #   No chart legend.
  # :right ::
  #   Chart legend positioned at right side.
  # :left ::
  #   Chart legend positioned at left side.
  # :top ::
  #   Chart legend positioned at top.
  # :bottom ::
  #   Chart legend positioned at bottom.
  # :overlay_right ::
  #   Chart legend overlaid at right side.
  # :overlay_left ::
  #   Chart legend overlaid at left side.
  # 
  # @method _enum_chart_legend_position_
  # @return [Symbol]
  # @scope class
  enum :chart_legend_position, [
    :none, 0,
    :right, 1,
    :left, 2,
    :top, 3,
    :bottom, 4,
    :overlay_right, 5,
    :overlay_left, 6
  ]
  
  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:chart_line_dash_type).</em>
  # 
  # === Options:
  # :solid ::
  #   Solid.
  # :round_dot ::
  #   Round Dot.
  # :square_dot ::
  #   Square Dot.
  # :dash ::
  #   Dash.
  # :dash_dot ::
  #   Dash Dot.
  # :long_dash ::
  #   Long Dash.
  # :long_dash_dot ::
  #   Long Dash Dot.
  # :long_dash_dot_dot ::
  #   Long Dash Dot Dot.
  # :dot ::
  #   These aren't available in the dialog but are used by Excel.
  # :system_dash_dot ::
  #   
  # :system_dash_dot_dot ::
  #   
  # 
  # @method _enum_chart_line_dash_type_
  # @return [Symbol]
  # @scope class
  enum :chart_line_dash_type, [
    :solid, 0,
    :round_dot, 1,
    :square_dot, 2,
    :dash, 3,
    :dash_dot, 4,
    :long_dash, 5,
    :long_dash_dot, 6,
    :long_dash_dot_dot, 7,
    :dot, 8,
    :system_dash_dot, 9,
    :system_dash_dot_dot, 10
  ]
  
  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:chart_marker_type).</em>
  # 
  # === Options:
  # :automatic ::
  #   Automatic, series default, marker type.
  # :none ::
  #   No marker type.
  # :square ::
  #   Square marker type.
  # :diamond ::
  #   Diamond marker type.
  # :triangle ::
  #   Triangle marker type.
  # :x ::
  #   X shape marker type.
  # :star ::
  #   Star marker type.
  # :short_dash ::
  #   Short dash marker type.
  # :long_dash ::
  #   Long dash marker type.
  # :circle ::
  #   Circle marker type.
  # :plus ::
  #   Plus (+) marker type.
  # 
  # @method _enum_chart_marker_type_
  # @return [Symbol]
  # @scope class
  enum :chart_marker_type, [
    :automatic, 0,
    :none, 1,
    :square, 2,
    :diamond, 3,
    :triangle, 4,
    :x, 5,
    :star, 6,
    :short_dash, 7,
    :long_dash, 8,
    :circle, 9,
    :plus, 10
  ]
  
  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:chart_pattern_type).</em>
  # 
  # === Options:
  # :none ::
  #   None pattern.
  # :percent_5 ::
  #   5 Percent pattern.
  # :percent_10 ::
  #   10 Percent pattern.
  # :percent_20 ::
  #   20 Percent pattern.
  # :percent_25 ::
  #   25 Percent pattern.
  # :percent_30 ::
  #   30 Percent pattern.
  # :percent_40 ::
  #   40 Percent pattern.
  # :percent_50 ::
  #   50 Percent pattern.
  # :percent_60 ::
  #   60 Percent pattern.
  # :percent_70 ::
  #   70 Percent pattern.
  # :percent_75 ::
  #   75 Percent pattern.
  # :percent_80 ::
  #   80 Percent pattern.
  # :percent_90 ::
  #   90 Percent pattern.
  # :light_downward_diagonal ::
  #   Light downward diagonal pattern.
  # :light_upward_diagonal ::
  #   Light upward diagonal pattern.
  # :dark_downward_diagonal ::
  #   Dark downward diagonal pattern.
  # :dark_upward_diagonal ::
  #   Dark upward diagonal pattern.
  # :wide_downward_diagonal ::
  #   Wide downward diagonal pattern.
  # :wide_upward_diagonal ::
  #   Wide upward diagonal pattern.
  # :light_vertical ::
  #   Light vertical pattern.
  # :light_horizontal ::
  #   Light horizontal pattern.
  # :narrow_vertical ::
  #   Narrow vertical pattern.
  # :narrow_horizontal ::
  #   Narrow horizontal pattern.
  # :dark_vertical ::
  #   Dark vertical pattern.
  # :dark_horizontal ::
  #   Dark horizontal pattern.
  # :dashed_downward_diagonal ::
  #   Dashed downward diagonal pattern.
  # :dashed_upward_diagonal ::
  #   Dashed upward diagonal pattern.
  # :dashed_horizontal ::
  #   Dashed horizontal pattern.
  # :dashed_vertical ::
  #   Dashed vertical pattern.
  # :small_confetti ::
  #   Small confetti pattern.
  # :large_confetti ::
  #   Large confetti pattern.
  # :zigzag ::
  #   Zigzag pattern.
  # :wave ::
  #   Wave pattern.
  # :diagonal_brick ::
  #   Diagonal brick pattern.
  # :horizontal_brick ::
  #   Horizontal brick pattern.
  # :weave ::
  #   Weave pattern.
  # :plaid ::
  #   Plaid pattern.
  # :divot ::
  #   Divot pattern.
  # :dotted_grid ::
  #   Dotted grid pattern.
  # :dotted_diamond ::
  #   Dotted diamond pattern.
  # :shingle ::
  #   Shingle pattern.
  # :trellis ::
  #   Trellis pattern.
  # :sphere ::
  #   Sphere pattern.
  # :small_grid ::
  #   Small grid pattern.
  # :large_grid ::
  #   Large grid pattern.
  # :small_check ::
  #   Small check pattern.
  # :large_check ::
  #   Large check pattern.
  # :outlined_diamond ::
  #   Outlined diamond pattern.
  # :solid_diamond ::
  #   Solid diamond pattern.
  # 
  # @method _enum_chart_pattern_type_
  # @return [Symbol]
  # @scope class
  enum :chart_pattern_type, [
    :none, 0,
    :percent_5, 1,
    :percent_10, 2,
    :percent_20, 3,
    :percent_25, 4,
    :percent_30, 5,
    :percent_40, 6,
    :percent_50, 7,
    :percent_60, 8,
    :percent_70, 9,
    :percent_75, 10,
    :percent_80, 11,
    :percent_90, 12,
    :light_downward_diagonal, 13,
    :light_upward_diagonal, 14,
    :dark_downward_diagonal, 15,
    :dark_upward_diagonal, 16,
    :wide_downward_diagonal, 17,
    :wide_upward_diagonal, 18,
    :light_vertical, 19,
    :light_horizontal, 20,
    :narrow_vertical, 21,
    :narrow_horizontal, 22,
    :dark_vertical, 23,
    :dark_horizontal, 24,
    :dashed_downward_diagonal, 25,
    :dashed_upward_diagonal, 26,
    :dashed_horizontal, 27,
    :dashed_vertical, 28,
    :small_confetti, 29,
    :large_confetti, 30,
    :zigzag, 31,
    :wave, 32,
    :diagonal_brick, 33,
    :horizontal_brick, 34,
    :weave, 35,
    :plaid, 36,
    :divot, 37,
    :dotted_grid, 38,
    :dotted_diamond, 39,
    :shingle, 40,
    :trellis, 41,
    :sphere, 42,
    :small_grid, 43,
    :large_grid, 44,
    :small_check, 45,
    :large_check, 46,
    :outlined_diamond, 47,
    :solid_diamond, 48
  ]
  
  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:chart_label_position).</em>
  # 
  # === Options:
  # :default ::
  #   Series data label position: default position.
  # :center ::
  #   Series data label position: center.
  # :right ::
  #   Series data label position: right.
  # :left ::
  #   Series data label position: left.
  # :above ::
  #   Series data label position: above.
  # :below ::
  #   Series data label position: below.
  # :inside_base ::
  #   Series data label position: inside base. 
  # :inside_end ::
  #   Series data label position: inside end.
  # :outside_end ::
  #   Series data label position: outside end.
  # :best_fit ::
  #   Series data label position: best fit.
  # 
  # @method _enum_chart_label_position_
  # @return [Symbol]
  # @scope class
  enum :chart_label_position, [
    :default, 0,
    :center, 1,
    :right, 2,
    :left, 3,
    :above, 4,
    :below, 5,
    :inside_base, 6,
    :inside_end, 7,
    :outside_end, 8,
    :best_fit, 9
  ]
  
  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:chart_label_separator).</em>
  # 
  # === Options:
  # :comma ::
  #   Series data label separator: comma (the default).
  # :semicolon ::
  #   Series data label separator: semicolon.
  # :period ::
  #   Series data label separator: period.
  # :newline ::
  #   Series data label separator: newline.
  # :space ::
  #   Series data label separator: space.
  # 
  # @method _enum_chart_label_separator_
  # @return [Symbol]
  # @scope class
  enum :chart_label_separator, [
    :comma, 0,
    :semicolon, 1,
    :period, 2,
    :newline, 3,
    :space, 4
  ]
  
  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:chart_subtype).</em>
  # 
  # === Options:
  # :none ::
  #   
  # :stacked ::
  #   
  # :stacked_percent ::
  #   
  # 
  # @method _enum_chart_subtype_
  # @return [Symbol]
  # @scope class
  enum :chart_subtype, [
    :none, 0,
    :stacked, 1,
    :stacked_percent, 2
  ]
  
  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:chart_grouping).</em>
  # 
  # === Options:
  # :clustered ::
  #   
  # :standard ::
  #   
  # :percentstacked ::
  #   
  # :stacked ::
  #   
  # 
  # @method _enum_chart_grouping_
  # @return [Symbol]
  # @scope class
  enum :chart_grouping, [
    :clustered, 0,
    :standard, 1,
    :percentstacked, 2,
    :stacked, 3
  ]
  
  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:chart_axis_tick_position).</em>
  # 
  # === Options:
  # :default ::
  #   
  # :on_tick ::
  #   Position category axis on tick marks.
  # :between ::
  #   Position category axis between tick marks.
  # 
  # @method _enum_chart_axis_tick_position_
  # @return [Symbol]
  # @scope class
  enum :chart_axis_tick_position, [
    :default, 0,
    :on_tick, 1,
    :between, 2
  ]
  
  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:chart_axis_label_position).</em>
  # 
  # === Options:
  # :next_to ::
  #   Position the axis labels next to the axis. The default.
  # :high ::
  #   Position the axis labels at the top of the chart, for horizontal
  #   axes, or to the right for vertical axes.
  # :low ::
  #   Position the axis labels at the bottom of the chart, for horizontal
  #   axes, or to the left for vertical axes.
  # :none ::
  #   Turn off the the axis labels.
  # 
  # @method _enum_chart_axis_label_position_
  # @return [Symbol]
  # @scope class
  enum :chart_axis_label_position, [
    :next_to, 0,
    :high, 1,
    :low, 2,
    :none, 3
  ]
  
  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:chart_axis_display_unit).</em>
  # 
  # === Options:
  # :units_none ::
  #   Axis display units: None. The default.
  # :units_hundreds ::
  #   Axis display units: Hundreds.
  # :units_thousands ::
  #   Axis display units: Thousands.
  # :units_ten_thousands ::
  #   Axis display units: Ten thousands.
  # :units_hundred_thousands ::
  #   Axis display units: Hundred thousands.
  # :units_millions ::
  #   Axis display units: Millions.
  # :units_ten_millions ::
  #   Axis display units: Ten millions.
  # :units_hundred_millions ::
  #   Axis display units: Hundred millions.
  # :units_billions ::
  #   Axis display units: Billions.
  # :units_trillions ::
  #   Axis display units: Trillions.
  # 
  # @method _enum_chart_axis_display_unit_
  # @return [Symbol]
  # @scope class
  enum :chart_axis_display_unit, [
    :units_none, 0,
    :units_hundreds, 1,
    :units_thousands, 2,
    :units_ten_thousands, 3,
    :units_hundred_thousands, 4,
    :units_millions, 5,
    :units_ten_millions, 6,
    :units_hundred_millions, 7,
    :units_billions, 8,
    :units_trillions, 9
  ]
  
  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:chart_axis_tick_mark).</em>
  # 
  # === Options:
  # :default ::
  #   Default tick mark for the chart axis. Usually outside.
  # :none ::
  #   No tick mark for the axis.
  # :inside ::
  #   Tick mark inside the axis only.
  # :outside ::
  #   Tick mark outside the axis only.
  # :crossing ::
  #   Tick mark inside and outside the axis.
  # 
  # @method _enum_chart_axis_tick_mark_
  # @return [Symbol]
  # @scope class
  enum :chart_axis_tick_mark, [
    :default, 0,
    :none, 1,
    :inside, 2,
    :outside, 3,
    :crossing, 4
  ]
  
  # = Fields:
  # :formula ::
  #   (String) 
  # :sheetname ::
  #   (String) 
  # :first_row ::
  #   (Integer) 
  # :last_row ::
  #   (Integer) 
  # :first_col ::
  #   (Integer) 
  # :last_col ::
  #   (Integer) 
  # :ignore_cache ::
  #   (Integer) 
  # :has_string_cache ::
  #   (Integer) 
  # :num_data_points ::
  #   (Integer) 
  # :data_cache ::
  #   (SeriesDataPoints) 
  class SeriesRange < FFI::Struct
    layout :formula, :string,
           :sheetname, :string,
           :first_row, :uint,
           :last_row, :uint,
           :first_col, :ushort,
           :last_col, :ushort,
           :ignore_cache, :uchar,
           :has_string_cache, :uchar,
           :num_data_points, :ushort,
           :data_cache, SeriesDataPoints
  end
  
  # = Fields:
  # :stqe_next ::
  #   (FFI::Pointer(*SeriesDataPoint)) 
  class SeriesDataPointListPointers < FFI::Struct
    layout :stqe_next, :pointer
  end
  
  # = Fields:
  # :is_string ::
  #   (Integer) 
  # :number ::
  #   (Float) 
  # :string ::
  #   (String) 
  # :no_data ::
  #   (Integer) 
  # :list_pointers ::
  #   (SeriesDataPointListPointers) 
  class SeriesDataPoint < FFI::Struct
    layout :is_string, :uchar,
           :number, :double,
           :string, :string,
           :no_data, :uchar,
           :list_pointers, SeriesDataPointListPointers.by_value
  end

  # = Fields:
  # :color ::
  #   (Integer) The chart font color. See @ref working_with_colors.
  # :none ::
  #   (Integer) Turn off/hide line. Set to 0 or 1.
  # :width ::
  #   (Float) Width of the line in increments of 0.25. Default is 2.25.
  # :dash_type ::
  #   (Integer) The line dash type. See #lxw_chart_line_dash_type.
  # :transparency ::
  #   (Integer) Transparency for lines isn't generally useful. Undocumented for now.
  # :has_color ::
  #   (Integer) Members for internal use only.
  class ChartLine < FFI::Struct
    layout :color, :int,
           :none, :uchar,
           :width, :float,
           :dash_type, :uchar,
           :transparency, :uchar,
           :has_color, :uchar
  end
  
  # = Fields:
  # :color ::
  #   (Integer) The chart font color. See @ref working_with_colors.
  # :none ::
  #   (Integer) Turn off/hide line. Set to 0 or 1.
  # :transparency ::
  #   (Integer) Set the transparency of the fill. 0 - 100. Default 0.
  # :has_color ::
  #   (Integer) Members for internal use only.
  class ChartFill < FFI::Struct
    layout :color, :int,
           :none, :uchar,
           :transparency, :uchar,
           :has_color, :uchar
  end
  
  # = Fields:
  # :fg_color ::
  #   (Integer) The pattern foreground color. See @ref working_with_colors.
  # :bg_color ::
  #   (Integer) The pattern background color. See @ref working_with_colors.
  # :type ::
  #   (Integer) The pattern type. See #lxw_chart_pattern_type.
  # :has_fg_color ::
  #   (Integer) Members for internal use only.
  # :has_bg_color ::
  #   (Integer) 
  class ChartPattern < FFI::Struct
    layout :fg_color, :int,
           :bg_color, :int,
           :type, :uchar,
           :has_fg_color, :uchar,
           :has_bg_color, :uchar
  end
  
  # = Fields:
  # :name ::
  #   (String) The chart font name, such as "Arial" or "Calibri".
  # :size ::
  #   (Integer) The chart font size. The default is 11.
  # :bold ::
  #   (Integer) The chart font bold property. Set to 0 or 1.
  # :italic ::
  #   (Integer) The chart font italic property. Set to 0 or 1.
  # :underline ::
  #   (Integer) The chart font underline property. Set to 0 or 1.
  # :rotation ::
  #   (Integer) The chart font rotation property. Range: -90 to 90.
  # :color ::
  #   (Integer) The chart font color. See @ref working_with_colors.
  # :pitch_family ::
  #   (Integer) Members for internal use only.
  # :charset ::
  #   (Integer) 
  # :baseline ::
  #   (Integer) 
  # :has_color ::
  #   (Integer) 
  class ChartFont < FFI::Struct
    layout :name, :string,
           :size, :ushort,
           :bold, :uchar,
           :italic, :uchar,
           :underline, :uchar,
           :rotation, :int,
           :color, :int,
           :pitch_family, :uchar,
           :charset, :uchar,
           :baseline, :char,
           :has_color, :uchar
  end
  
  # = Fields:
  # :type ::
  #   (Integer) 
  # :size ::
  #   (Integer) 
  # :line ::
  #   (ChartLine) 
  # :fill ::
  #   (ChartFill) 
  # :pattern ::
  #   (ChartPattern) 
  class ChartMarker < FFI::Struct
    layout :type, :uchar,
           :size, :uchar,
           :line, ChartLine,
           :fill, ChartFill,
           :pattern, ChartPattern
  end
  
  # = Fields:
  # :font ::
  #   (ChartFont) 
  # :position ::
  #   (Integer) 
  class ChartLegend < FFI::Struct
    layout :font, ChartFont,
           :position, :uchar
  end
  
  # = Fields:
  # :name ::
  #   (String) 
  # :row ::
  #   (Integer) 
  # :col ::
  #   (Integer) 
  # :font ::
  #   (ChartFont) 
  # :off ::
  #   (Integer) 
  # :is_horizontal ::
  #   (Integer) 
  # :ignore_cache ::
  #   (Integer) 
  # :range ::
  #   (SeriesRange) We use a range to hold the title formula properties even though it
  #   will only have 1 point in order to re-use similar functions.
  # :data_point ::
  #   (SeriesDataPoint) 
  class ChartTitle < FFI::Struct
    layout :name, :string,
           :row, :uint,
           :col, :ushort,
           :font, ChartFont,
           :off, :uchar,
           :is_horizontal, :uchar,
           :ignore_cache, :uchar,
           :range, SeriesRange,
           :data_point, SeriesDataPoint.by_value
  end
  
  # = Fields:
  # :line ::
  #   (ChartLine) The line/border for the chart point. See @ref chart_lines.
  # :fill ::
  #   (ChartFill) The fill for the chart point. See @ref chart_fills.
  # :pattern ::
  #   (ChartPattern) The pattern for the chart point. See @ref chart_patterns.
  class ChartPoint < FFI::Struct
    layout :line, ChartLine,
           :fill, ChartFill,
           :pattern, ChartPattern
  end
  
  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:chart_blank).</em>
  # 
  # === Options:
  # :blanks_as_gap ::
  #   Show empty chart cells as gaps in the data. The default.
  # :blanks_as_zero ::
  #   Show empty chart cells as zeros.
  # :blanks_as_connected ::
  #   Show empty chart cells as connected. Only for charts with lines.
  # 
  # @method _enum_chart_blank_
  # @return [Symbol]
  # @scope class
  enum :chart_blank, [
    :blanks_as_gap, 0,
    :blanks_as_zero, 1,
    :blanks_as_connected, 2
  ]
  
  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:chart_position).</em>
  # 
  # === Options:
  # :axis_right ::
  #   
  # :axis_left ::
  #   
  # :axis_top ::
  #   
  # :axis_bottom ::
  #   
  # 
  # @method _enum_chart_position_
  # @return [Symbol]
  # @scope class
  enum :chart_position, [
    :axis_right, 0,
    :axis_left, 1,
    :axis_top, 2,
    :axis_bottom, 3
  ]
  
  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:chart_error_bar_type).</em>
  # 
  # === Options:
  # :std_error ::
  #   Error bar type: Standard error.
  # :fixed ::
  #   Error bar type: Fixed value.
  # :percentage ::
  #   Error bar type: Percentage.
  # :std_dev ::
  #   Error bar type: Standard deviation(s).
  # 
  # @method _enum_chart_error_bar_type_
  # @return [Symbol]
  # @scope class
  enum :chart_error_bar_type, [
    :std_error, 0,
    :fixed, 1,
    :percentage, 2,
    :std_dev, 3
  ]
  
  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:chart_error_bar_direction).</em>
  # 
  # === Options:
  # :dir_both ::
  #   Error bar extends in both directions. The default.
  # :dir_plus ::
  #   Error bar extends in positive direction.
  # :dir_minus ::
  #   Error bar extends in negative direction.
  # 
  # @method _enum_chart_error_bar_direction_
  # @return [Symbol]
  # @scope class
  enum :chart_error_bar_direction, [
    :dir_both, 0,
    :dir_plus, 1,
    :dir_minus, 2
  ]
  
  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:chart_error_bar_cap).</em>
  # 
  # === Options:
  # :end_ ::
  #   Flat end cap. The default.
  # :no ::
  #   No end cap.
  # 
  # @method _enum_chart_error_bar_cap_
  # @return [Symbol]
  # @scope class
  enum :chart_error_bar_cap, [
    :end_, 0,
    :no, 1
  ]

  enum :chart_error_bar_axis, [
    :axis_x, 0,
    :axis_y, 1
  ]

  enum :chart_axis_label_alignment, [
    :align_center, 0,
    :align_left, 1,
    :align_right, 2
  ]

  enum :chart_axis_type, [
    :axis_type_x, 0,
    :axis_type_y, 1
  ]

  # = Fields:
  # :type ::
  #   (Integer) 
  # :direction ::
  #   (Integer) 
  # :endcap ::
  #   (Integer) 
  # :has_value ::
  #   (Integer) 
  # :is_set ::
  #   (Integer) 
  # :is_x ::
  #   (Integer) 
  # :chart_group ::
  #   (Integer) 
  # :value ::
  #   (Float) 
  # :line ::
  #   (ChartLine) 
  class SeriesErrorBars < FFI::Struct
    layout :type, :uchar,
           :direction, :uchar,
           :endcap, :uchar,
           :has_value, :uchar,
           :is_set, :uchar,
           :is_x, :uchar,
           :chart_group, :uchar,
           :value, :double,
           :line, ChartLine
  end
  
  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:chart_trendline_type).</em>
  # 
  # === Options:
  # :linear ::
  #   Trendline type: Linear.
  # :log ::
  #   Trendline type: Logarithm.
  # :poly ::
  #   Trendline type: Polynomial.
  # :power ::
  #   Trendline type: Power.
  # :exp ::
  #   Trendline type: Exponential.
  # :average ::
  #   Trendline type: Moving Average.
  # 
  # @method _enum_chart_trendline_type_
  # @return [Symbol]
  # @scope class
  enum :chart_trendline_type, [
    :linear, 0,
    :log, 1,
    :poly, 2,
    :power, 3,
    :exp, 4,
    :average, 5
  ]
  
  # = Fields:
  # :stqe_next ::
  #   (FFI::Pointer(*ChartSeries)) 
  class ChartSeriesListPointers < FFI::Struct
    layout :stqe_next, :pointer
  end
  
  # = Fields:
  # :categories ::
  #   (SeriesRange) 
  # :values ::
  #   (SeriesRange) 
  # :title ::
  #   (ChartTitle) 
  # :line ::
  #   (ChartLine) 
  # :fill ::
  #   (ChartFill) 
  # :pattern ::
  #   (ChartPattern) 
  # :marker ::
  #   (ChartMarker) 
  # :points ::
  #   (ChartPoint) 
  # :point_count ::
  #   (Integer) 
  # :smooth ::
  #   (Integer) 
  # :invert_if_negative ::
  #   (Integer) 
  # :has_labels ::
  #   (Integer) Data label parameters.
  # :show_labels_value ::
  #   (Integer) 
  # :show_labels_category ::
  #   (Integer) 
  # :show_labels_name ::
  #   (Integer) 
  # :show_labels_leader ::
  #   (Integer) 
  # :show_labels_legend ::
  #   (Integer) 
  # :show_labels_percent ::
  #   (Integer) 
  # :label_position ::
  #   (Integer) 
  # :label_separator ::
  #   (Integer) 
  # :default_label_position ::
  #   (Integer) 
  # :label_num_format ::
  #   (String) 
  # :label_font ::
  #   (ChartFont) 
  # :x_error_bars ::
  #   (SeriesErrorBars) 
  # :y_error_bars ::
  #   (SeriesErrorBars) 
  # :has_trendline ::
  #   (Integer) 
  # :has_trendline_forecast ::
  #   (Integer) 
  # :has_trendline_equation ::
  #   (Integer) 
  # :has_trendline_r_squared ::
  #   (Integer) 
  # :has_trendline_intercept ::
  #   (Integer) 
  # :trendline_type ::
  #   (Integer) 
  # :trendline_value ::
  #   (Integer) 
  # :trendline_forward ::
  #   (Float) 
  # :trendline_backward ::
  #   (Float) 
  # :trendline_value_type ::
  #   (Integer) 
  # :trendline_name ::
  #   (String) 
  # :trendline_line ::
  #   (ChartLine) 
  # :trendline_intercept ::
  #   (Float) 
  # :list_pointers ::
  #   (ChartSeriesListPointers) 
  module ChartSeriesWrappers
    # @param [String] sheetname 
    # @param [Integer] first_row 
    # @param [Integer] first_col 
    # @param [Integer] last_row 
    # @param [Integer] last_col 
    # @return [nil] 
    def set_categories(sheetname, first_row, first_col, last_row, last_col)
      Libxlsxwriter.chart_series_set_categories(self, sheetname, first_row, first_col, last_row, last_col)
    end
    
    # @param [String] sheetname 
    # @param [Integer] first_row 
    # @param [Integer] first_col 
    # @param [Integer] last_row 
    # @param [Integer] last_col 
    # @return [nil] 
    def set_values(sheetname, first_row, first_col, last_row, last_col)
      Libxlsxwriter.chart_series_set_values(self, sheetname, first_row, first_col, last_row, last_col)
    end
    
    # @param [String] name 
    # @return [nil] 
    def set_name(name)
      Libxlsxwriter.chart_series_set_name(self, name)
    end
    
    # @param [String] sheetname 
    # @param [Integer] row 
    # @param [Integer] col 
    # @return [nil] 
    def set_name_range(sheetname, row, col)
      Libxlsxwriter.chart_series_set_name_range(self, sheetname, row, col)
    end
    
    # @param [ChartLine] line 
    # @return [nil] 
    def set_line(line)
      Libxlsxwriter.chart_series_set_line(self, line)
    end
    
    # @param [ChartFill] fill 
    # @return [nil] 
    def set_fill(fill)
      Libxlsxwriter.chart_series_set_fill(self, fill)
    end
    
    # @return [nil] 
    def set_invert_if_negative()
      Libxlsxwriter.chart_series_set_invert_if_negative(self)
    end
    
    # @param [ChartPattern] pattern 
    # @return [nil] 
    def set_pattern(pattern)
      Libxlsxwriter.chart_series_set_pattern(self, pattern)
    end
    
    # @param [Integer] type 
    # @return [nil] 
    def set_marker_type(type)
      Libxlsxwriter.chart_series_set_marker_type(self, type)
    end
    
    # @param [Integer] size 
    # @return [nil] 
    def set_marker_size(size)
      Libxlsxwriter.chart_series_set_marker_size(self, size)
    end
    
    # @param [ChartLine] line 
    # @return [nil] 
    def set_marker_line(line)
      Libxlsxwriter.chart_series_set_marker_line(self, line)
    end
    
    # @param [ChartFill] fill 
    # @return [nil] 
    def set_marker_fill(fill)
      Libxlsxwriter.chart_series_set_marker_fill(self, fill)
    end
    
    # @param [ChartPattern] pattern 
    # @return [nil] 
    def set_marker_pattern(pattern)
      Libxlsxwriter.chart_series_set_marker_pattern(self, pattern)
    end
    
    # @param [FFI::Pointer(*ChartPoint)] points 
    # @return [Symbol from _enum_error_] 
    def set_points(points)
      Libxlsxwriter.chart_series_set_points(self, points)
    end
    
    # @param [Integer] smooth 
    # @return [nil] 
    def set_smooth(smooth)
      Libxlsxwriter.chart_series_set_smooth(self, smooth)
    end
    
    # @return [nil] 
    def set_labels()
      Libxlsxwriter.chart_series_set_labels(self)
    end
    
    # @param [Integer] show_name 
    # @param [Integer] show_category 
    # @param [Integer] show_value 
    # @return [nil] 
    def set_labels_options(show_name, show_category, show_value)
      Libxlsxwriter.chart_series_set_labels_options(self, show_name, show_category, show_value)
    end
    
    # @param [Integer] separator 
    # @return [nil] 
    def set_labels_separator(separator)
      Libxlsxwriter.chart_series_set_labels_separator(self, separator)
    end
    
    # @param [Integer] position 
    # @return [nil] 
    def set_labels_position(position)
      Libxlsxwriter.chart_series_set_labels_position(self, position)
    end
    
    # @return [nil] 
    def set_labels_leader_line()
      Libxlsxwriter.chart_series_set_labels_leader_line(self)
    end
    
    # @return [nil] 
    def set_labels_legend()
      Libxlsxwriter.chart_series_set_labels_legend(self)
    end
    
    # @return [nil] 
    def set_labels_percentage()
      Libxlsxwriter.chart_series_set_labels_percentage(self)
    end
    
    # @param [String] num_format 
    # @return [nil] 
    def set_labels_num_format(num_format)
      Libxlsxwriter.chart_series_set_labels_num_format(self, num_format)
    end
    
    # @param [ChartFont] font 
    # @return [nil] 
    def set_labels_font(font)
      Libxlsxwriter.chart_series_set_labels_font(self, font)
    end
    
    # @param [Integer] type 
    # @param [Integer] value 
    # @return [nil] 
    def set_trendline(type, value)
      Libxlsxwriter.chart_series_set_trendline(self, type, value)
    end
    
    # @param [Float] forward 
    # @param [Float] backward 
    # @return [nil] 
    def set_trendline_forecast(forward, backward)
      Libxlsxwriter.chart_series_set_trendline_forecast(self, forward, backward)
    end
    
    # @return [nil] 
    def set_trendline_equation()
      Libxlsxwriter.chart_series_set_trendline_equation(self)
    end
    
    # @return [nil] 
    def set_trendline_r_squared()
      Libxlsxwriter.chart_series_set_trendline_r_squared(self)
    end
    
    # @param [Float] intercept 
    # @return [nil] 
    def set_trendline_intercept(intercept)
      Libxlsxwriter.chart_series_set_trendline_intercept(self, intercept)
    end
    
    # @param [String] name 
    # @return [nil] 
    def set_trendline_name(name)
      Libxlsxwriter.chart_series_set_trendline_name(self, name)
    end
    
    # @param [ChartLine] line 
    # @return [nil] 
    def set_trendline_line(line)
      Libxlsxwriter.chart_series_set_trendline_line(self, line)
    end
  end
  
  class ChartSeries < FFI::Struct
    include ChartSeriesWrappers
    layout :categories, SeriesRange,
           :values, SeriesRange,
           :title, ChartTitle.by_value,
           :line, ChartLine,
           :fill, ChartFill,
           :pattern, ChartPattern,
           :marker, ChartMarker,
           :points, ChartPoint,
           :point_count, :ushort,
           :smooth, :uchar,
           :invert_if_negative, :uchar,
           :has_labels, :uchar,
           :show_labels_value, :uchar,
           :show_labels_category, :uchar,
           :show_labels_name, :uchar,
           :show_labels_leader, :uchar,
           :show_labels_legend, :uchar,
           :show_labels_percent, :uchar,
           :label_position, :uchar,
           :label_separator, :uchar,
           :default_label_position, :uchar,
           :label_num_format, :string,
           :label_font, ChartFont,
           :x_error_bars, SeriesErrorBars,
           :y_error_bars, SeriesErrorBars,
           :has_trendline, :uchar,
           :has_trendline_forecast, :uchar,
           :has_trendline_equation, :uchar,
           :has_trendline_r_squared, :uchar,
           :has_trendline_intercept, :uchar,
           :trendline_type, :uchar,
           :trendline_value, :uchar,
           :trendline_forward, :double,
           :trendline_backward, :double,
           :trendline_value_type, :uchar,
           :trendline_name, :string,
           :trendline_line, ChartLine,
           :trendline_intercept, :double,
           :list_pointers, ChartSeriesListPointers.by_value
  end
  
  # = Fields:
  # :visible ::
  #   (Integer) 
  # :line ::
  #   (ChartLine) 
  class ChartGridline < FFI::Struct
    layout :visible, :uchar,
           :line, ChartLine
  end
  
  # = Fields:
  # :title ::
  #   (ChartTitle) 
  # :num_format ::
  #   (String) 
  # :default_num_format ::
  #   (String) 
  # :source_linked ::
  #   (Integer) 
  # :major_tick_mark ::
  #   (Integer) 
  # :minor_tick_mark ::
  #   (Integer) 
  # :is_horizontal ::
  #   (Integer) 
  # :major_gridlines ::
  #   (ChartGridline) 
  # :minor_gridlines ::
  #   (ChartGridline) 
  # :num_font ::
  #   (ChartFont) 
  # :line ::
  #   (ChartLine) 
  # :fill ::
  #   (ChartFill) 
  # :pattern ::
  #   (ChartPattern) 
  # :is_category ::
  #   (Integer) 
  # :is_date ::
  #   (Integer) 
  # :is_value ::
  #   (Integer) 
  # :axis_position ::
  #   (Integer) 
  # :position_axis ::
  #   (Integer) 
  # :label_position ::
  #   (Integer) 
  # :hidden ::
  #   (Integer) 
  # :reverse ::
  #   (Integer) 
  # :has_min ::
  #   (Integer) 
  # :min ::
  #   (Float) 
  # :has_max ::
  #   (Integer) 
  # :max ::
  #   (Float) 
  # :has_major_unit ::
  #   (Integer) 
  # :major_unit ::
  #   (Float) 
  # :has_minor_unit ::
  #   (Integer) 
  # :minor_unit ::
  #   (Float) 
  # :interval_unit ::
  #   (Integer) 
  # :interval_tick ::
  #   (Integer) 
  # :log_base ::
  #   (Integer) 
  # :display_units ::
  #   (Integer) 
  # :display_units_visible ::
  #   (Integer) 
  # :has_crossing ::
  #   (Integer) 
  # :crossing_max ::
  #   (Integer) 
  # :crossing ::
  #   (Float) 
  module ChartAxisWrappers
    # @param [String] name 
    # @return [nil] 
    def set_name(name)
      Libxlsxwriter.chart_axis_set_name(self, name)
    end
    
    # @param [String] sheetname 
    # @param [Integer] row 
    # @param [Integer] col 
    # @return [nil] 
    def set_name_range(sheetname, row, col)
      Libxlsxwriter.chart_axis_set_name_range(self, sheetname, row, col)
    end
    
    # @param [ChartFont] font 
    # @return [nil] 
    def set_name_font(font)
      Libxlsxwriter.chart_axis_set_name_font(self, font)
    end
    
    # @param [ChartFont] font 
    # @return [nil] 
    def set_num_font(font)
      Libxlsxwriter.chart_axis_set_num_font(self, font)
    end
    
    # @param [String] num_format 
    # @return [nil] 
    def set_num_format(num_format)
      Libxlsxwriter.chart_axis_set_num_format(self, num_format)
    end
    
    # @param [ChartLine] line 
    # @return [nil] 
    def set_line(line)
      Libxlsxwriter.chart_axis_set_line(self, line)
    end
    
    # @param [ChartFill] fill 
    # @return [nil] 
    def set_fill(fill)
      Libxlsxwriter.chart_axis_set_fill(self, fill)
    end
    
    # @param [ChartPattern] pattern 
    # @return [nil] 
    def set_pattern(pattern)
      Libxlsxwriter.chart_axis_set_pattern(self, pattern)
    end
    
    # @return [nil] 
    def set_reverse()
      Libxlsxwriter.chart_axis_set_reverse(self)
    end
    
    # @param [Float] value 
    # @return [nil] 
    def set_crossing(value)
      Libxlsxwriter.chart_axis_set_crossing(self, value)
    end
    
    # @return [nil] 
    def set_crossing_max()
      Libxlsxwriter.chart_axis_set_crossing_max(self)
    end
    
    # @return [nil] 
    def off()
      Libxlsxwriter.chart_axis_off(self)
    end
    
    # @param [Integer] position 
    # @return [nil] 
    def set_position(position)
      Libxlsxwriter.chart_axis_set_position(self, position)
    end
    
    # @param [Integer] position 
    # @return [nil] 
    def set_label_position(position)
      Libxlsxwriter.chart_axis_set_label_position(self, position)
    end
    
    # @param [Float] min 
    # @return [nil] 
    def set_min(min)
      Libxlsxwriter.chart_axis_set_min(self, min)
    end
    
    # @param [Float] max 
    # @return [nil] 
    def set_max(max)
      Libxlsxwriter.chart_axis_set_max(self, max)
    end
    
    # @param [Integer] log_base 
    # @return [nil] 
    def set_log_base(log_base)
      Libxlsxwriter.chart_axis_set_log_base(self, log_base)
    end
    
    # @param [Integer] type 
    # @return [nil] 
    def set_major_tick_mark(type)
      Libxlsxwriter.chart_axis_set_major_tick_mark(self, type)
    end
    
    # @param [Integer] type 
    # @return [nil] 
    def set_minor_tick_mark(type)
      Libxlsxwriter.chart_axis_set_minor_tick_mark(self, type)
    end
    
    # @param [Integer] unit 
    # @return [nil] 
    def set_interval_unit(unit)
      Libxlsxwriter.chart_axis_set_interval_unit(self, unit)
    end
    
    # @param [Integer] unit 
    # @return [nil] 
    def set_interval_tick(unit)
      Libxlsxwriter.chart_axis_set_interval_tick(self, unit)
    end
    
    # @param [Float] unit 
    # @return [nil] 
    def set_major_unit(unit)
      Libxlsxwriter.chart_axis_set_major_unit(self, unit)
    end
    
    # @param [Float] unit 
    # @return [nil] 
    def set_minor_unit(unit)
      Libxlsxwriter.chart_axis_set_minor_unit(self, unit)
    end
    
    # @param [Integer] units 
    # @return [nil] 
    def set_display_units(units)
      Libxlsxwriter.chart_axis_set_display_units(self, units)
    end
    
    # @param [Integer] visible 
    # @return [nil] 
    def set_display_units_visible(visible)
      Libxlsxwriter.chart_axis_set_display_units_visible(self, visible)
    end
    
    # @param [Integer] visible 
    # @return [nil] 
    def major_gridlines_set_visible(visible)
      Libxlsxwriter.chart_axis_major_gridlines_set_visible(self, visible)
    end
    
    # @param [Integer] visible 
    # @return [nil] 
    def minor_gridlines_set_visible(visible)
      Libxlsxwriter.chart_axis_minor_gridlines_set_visible(self, visible)
    end
    
    # @param [ChartLine] line 
    # @return [nil] 
    def major_gridlines_set_line(line)
      Libxlsxwriter.chart_axis_major_gridlines_set_line(self, line)
    end
    
    # @param [ChartLine] line 
    # @return [nil] 
    def minor_gridlines_set_line(line)
      Libxlsxwriter.chart_axis_minor_gridlines_set_line(self, line)
    end
  end
  
  class ChartAxis < FFI::Struct
    include ChartAxisWrappers
    layout :title, ChartTitle.by_value,
           :num_format, :string,
           :default_num_format, :string,
           :source_linked, :uchar,
           :major_tick_mark, :uchar,
           :minor_tick_mark, :uchar,
           :is_horizontal, :uchar,
           :major_gridlines, ChartGridline.by_value,
           :minor_gridlines, ChartGridline.by_value,
           :num_font, ChartFont,
           :line, ChartLine,
           :fill, ChartFill,
           :pattern, ChartPattern,
           :is_category, :uchar,
           :is_date, :uchar,
           :is_value, :uchar,
           :axis_position, :uchar,
           :position_axis, :uchar,
           :label_position, :uchar,
           :hidden, :uchar,
           :reverse, :uchar,
           :has_min, :uchar,
           :min, :double,
           :has_max, :uchar,
           :max, :double,
           :has_major_unit, :uchar,
           :major_unit, :double,
           :has_minor_unit, :uchar,
           :minor_unit, :double,
           :interval_unit, :ushort,
           :interval_tick, :ushort,
           :log_base, :ushort,
           :display_units, :uchar,
           :display_units_visible, :uchar,
           :has_crossing, :uchar,
           :crossing_max, :uchar,
           :crossing, :double
  end
  
  # = Fields:
  # :stqe_next ::
  #   (FFI::Pointer(*Chart)) 
  class ChartOrderedListPointers < FFI::Struct
    layout :stqe_next, :pointer
  end
  
  # = Fields:
  # :stqe_next ::
  #   (FFI::Pointer(*Chart)) 
  class ChartListPointers < FFI::Struct
    layout :stqe_next, :pointer
  end
  
  # = Fields:
  # :file ::
  #   (FFI::Pointer(*FILE)) 
  # :type ::
  #   (Integer) 
  # :subtype ::
  #   (Integer) 
  # :series_index ::
  #   (Integer) 
  # :write_chart_type ::
  #   (FFI::Pointer(*)) 
  # :write_plot_area ::
  #   (FFI::Pointer(*)) 
  # :x_axis ::
  #   (ChartAxis) A pointer to the chart x_axis object which can be used in functions
  #   that configures the X axis.
  # :y_axis ::
  #   (ChartAxis) A pointer to the chart y_axis object which can be used in functions
  #   that configures the Y axis.
  # :title ::
  #   (ChartTitle) 
  # :id ::
  #   (Integer) 
  # :axis_id_1 ::
  #   (Integer) 
  # :axis_id_2 ::
  #   (Integer) 
  # :axis_id_3 ::
  #   (Integer) 
  # :axis_id_4 ::
  #   (Integer) 
  # :in_use ::
  #   (Integer) 
  # :chart_group ::
  #   (Integer) 
  # :cat_has_num_fmt ::
  #   (Integer) 
  # :has_horiz_cat_axis ::
  #   (Integer) 
  # :has_horiz_val_axis ::
  #   (Integer) 
  # :style_id ::
  #   (Integer) 
  # :rotation ::
  #   (Integer) 
  # :hole_size ::
  #   (Integer) 
  # :no_title ::
  #   (Integer) 
  # :has_overlap ::
  #   (Integer) 
  # :overlap_y1 ::
  #   (Integer) 
  # :overlap_y2 ::
  #   (Integer) 
  # :gap_y1 ::
  #   (Integer) 
  # :gap_y2 ::
  #   (Integer) 
  # :grouping ::
  #   (Integer) 
  # :default_cross_between ::
  #   (Integer) 
  # :legend ::
  #   (ChartLegend) 
  # :delete_series ::
  #   (FFI::Pointer(*Int16T)) 
  # :delete_series_count ::
  #   (Integer) 
  # :default_marker ::
  #   (ChartMarker) 
  # :chartarea_line ::
  #   (ChartLine) 
  # :chartarea_fill ::
  #   (ChartFill) 
  # :chartarea_pattern ::
  #   (ChartPattern) 
  # :plotarea_line ::
  #   (ChartLine) 
  # :plotarea_fill ::
  #   (ChartFill) 
  # :plotarea_pattern ::
  #   (ChartPattern) 
  # :has_drop_lines ::
  #   (Integer) 
  # :drop_lines_line ::
  #   (ChartLine) 
  # :has_high_low_lines ::
  #   (Integer) 
  # :high_low_lines_line ::
  #   (ChartLine) 
  # :series_list ::
  #   (ChartSeriesList) 
  # :has_table ::
  #   (Integer) 
  # :has_table_vertical ::
  #   (Integer) 
  # :has_table_horizontal ::
  #   (Integer) 
  # :has_table_outline ::
  #   (Integer) 
  # :has_table_legend_keys ::
  #   (Integer) 
  # :table_font ::
  #   (ChartFont) 
  # :show_blanks_as ::
  #   (Integer) 
  # :show_hidden_data ::
  #   (Integer) 
  # :has_up_down_bars ::
  #   (Integer) 
  # :up_bar_line ::
  #   (ChartLine) 
  # :down_bar_line ::
  #   (ChartLine) 
  # :up_bar_fill ::
  #   (ChartFill) 
  # :down_bar_fill ::
  #   (ChartFill) 
  # :default_label_position ::
  #   (Integer) 
  # :ordered_list_pointers ::
  #   (ChartOrderedListPointers) 
  # :list_pointers ::
  #   (ChartListPointers) 
  module ChartWrappers
    # @return [nil] 
    def free()
      Libxlsxwriter.chart_free(self)
    end
    
    # @return [nil] 
    def assemble_xml_file()
      Libxlsxwriter.chart_assemble_xml_file(self)
    end
    
    # @param [String] categories 
    # @param [String] values 
    # @return [ChartSeries] 
    def add_series(categories, values)
      ChartSeries.new Libxlsxwriter.chart_add_series(self, categories, values)
    end
    
    # @param [String] name 
    # @return [nil] 
    def title_set_name(name)
      Libxlsxwriter.chart_title_set_name(self, name)
    end
    
    # @param [String] sheetname 
    # @param [Integer] row 
    # @param [Integer] col 
    # @return [nil] 
    def title_set_name_range(sheetname, row, col)
      Libxlsxwriter.chart_title_set_name_range(self, sheetname, row, col)
    end
    
    # @param [ChartFont] font 
    # @return [nil] 
    def title_set_name_font(font)
      Libxlsxwriter.chart_title_set_name_font(self, font)
    end
    
    # @return [nil] 
    def title_off()
      Libxlsxwriter.chart_title_off(self)
    end
    
    # @param [Integer] position 
    # @return [nil] 
    def legend_set_position(position)
      Libxlsxwriter.chart_legend_set_position(self, position)
    end
    
    # @param [ChartFont] font 
    # @return [nil] 
    def legend_set_font(font)
      Libxlsxwriter.chart_legend_set_font(self, font)
    end
    
    # @param [FFI::Pointer(*Short)] delete_series 
    # @return [Symbol from _enum_error_] 
    def legend_delete_series(delete_series)
      Libxlsxwriter.chart_legend_delete_series(self, delete_series)
    end
    
    # @param [ChartLine] line 
    # @return [nil] 
    def chartarea_set_line(line)
      Libxlsxwriter.chart_chartarea_set_line(self, line)
    end
    
    # @param [ChartFill] fill 
    # @return [nil] 
    def chartarea_set_fill(fill)
      Libxlsxwriter.chart_chartarea_set_fill(self, fill)
    end
    
    # @param [ChartPattern] pattern 
    # @return [nil] 
    def chartarea_set_pattern(pattern)
      Libxlsxwriter.chart_chartarea_set_pattern(self, pattern)
    end
    
    # @param [ChartLine] line 
    # @return [nil] 
    def plotarea_set_line(line)
      Libxlsxwriter.chart_plotarea_set_line(self, line)
    end
    
    # @param [ChartFill] fill 
    # @return [nil] 
    def plotarea_set_fill(fill)
      Libxlsxwriter.chart_plotarea_set_fill(self, fill)
    end
    
    # @param [ChartPattern] pattern 
    # @return [nil] 
    def plotarea_set_pattern(pattern)
      Libxlsxwriter.chart_plotarea_set_pattern(self, pattern)
    end
    
    # @param [Integer] style_id 
    # @return [nil] 
    def set_style(style_id)
      Libxlsxwriter.chart_set_style(self, style_id)
    end
    
    # @return [nil] 
    def set_table()
      Libxlsxwriter.chart_set_table(self)
    end
    
    # @param [Integer] horizontal 
    # @param [Integer] vertical 
    # @param [Integer] outline 
    # @param [Integer] legend_keys 
    # @return [nil] 
    def set_table_grid(horizontal, vertical, outline, legend_keys)
      Libxlsxwriter.chart_set_table_grid(self, horizontal, vertical, outline, legend_keys)
    end
    
    # @param [ChartFont] font 
    # @return [nil] 
    def set_table_font(font)
      Libxlsxwriter.chart_set_table_font(self, font)
    end
    
    # @return [nil] 
    def set_up_down_bars()
      Libxlsxwriter.chart_set_up_down_bars(self)
    end
    
    # @param [ChartLine] up_bar_line 
    # @param [ChartFill] up_bar_fill 
    # @param [ChartLine] down_bar_line 
    # @param [ChartFill] down_bar_fill 
    # @return [nil] 
    def set_up_down_bars_format(up_bar_line, up_bar_fill, down_bar_line, down_bar_fill)
      Libxlsxwriter.chart_set_up_down_bars_format(self, up_bar_line, up_bar_fill, down_bar_line, down_bar_fill)
    end
    
    # @param [ChartLine] line 
    # @return [nil] 
    def set_drop_lines(line)
      Libxlsxwriter.chart_set_drop_lines(self, line)
    end
    
    # @param [ChartLine] line 
    # @return [nil] 
    def set_high_low_lines(line)
      Libxlsxwriter.chart_set_high_low_lines(self, line)
    end
    
    # @param [Integer] overlap 
    # @return [nil] 
    def set_series_overlap(overlap)
      Libxlsxwriter.chart_set_series_overlap(self, overlap)
    end
    
    # @param [Integer] gap 
    # @return [nil] 
    def set_series_gap(gap)
      Libxlsxwriter.chart_set_series_gap(self, gap)
    end
    
    # @param [Integer] option 
    # @return [nil] 
    def show_blanks_as(option)
      Libxlsxwriter.chart_show_blanks_as(self, option)
    end
    
    # @return [nil] 
    def show_hidden_data()
      Libxlsxwriter.chart_show_hidden_data(self)
    end
    
    # @param [Integer] rotation 
    # @return [nil] 
    def set_rotation(rotation)
      Libxlsxwriter.chart_set_rotation(self, rotation)
    end
    
    # @param [Integer] size 
    # @return [nil] 
    def set_hole_size(size)
      Libxlsxwriter.chart_set_hole_size(self, size)
    end
  end
  
  class Chart < FFI::Struct
    include ChartWrappers
    layout :file, :pointer,
           :type, :uchar,
           :subtype, :uchar,
           :series_index, :ushort,
           :write_chart_type, :pointer,
           :write_plot_area, :pointer,
           :x_axis, ChartAxis,
           :y_axis, ChartAxis,
           :title, ChartTitle.by_value,
           :id, :uint,
           :axis_id_1, :uint,
           :axis_id_2, :uint,
           :axis_id_3, :uint,
           :axis_id_4, :uint,
           :in_use, :uchar,
           :chart_group, :uchar,
           :cat_has_num_fmt, :uchar,
           :has_horiz_cat_axis, :uchar,
           :has_horiz_val_axis, :uchar,
           :style_id, :uchar,
           :rotation, :ushort,
           :hole_size, :ushort,
           :no_title, :uchar,
           :has_overlap, :uchar,
           :overlap_y1, :char,
           :overlap_y2, :char,
           :gap_y1, :ushort,
           :gap_y2, :ushort,
           :grouping, :uchar,
           :default_cross_between, :uchar,
           :legend, ChartLegend.by_value,
           :delete_series, :pointer,
           :delete_series_count, :ushort,
           :default_marker, ChartMarker,
           :chartarea_line, ChartLine,
           :chartarea_fill, ChartFill,
           :chartarea_pattern, ChartPattern,
           :plotarea_line, ChartLine,
           :plotarea_fill, ChartFill,
           :plotarea_pattern, ChartPattern,
           :has_drop_lines, :uchar,
           :drop_lines_line, ChartLine,
           :has_high_low_lines, :uchar,
           :high_low_lines_line, ChartLine,
           :series_list, ChartSeriesList,
           :has_table, :uchar,
           :has_table_vertical, :uchar,
           :has_table_horizontal, :uchar,
           :has_table_outline, :uchar,
           :has_table_legend_keys, :uchar,
           :table_font, ChartFont,
           :show_blanks_as, :uchar,
           :show_hidden_data, :uchar,
           :has_up_down_bars, :uchar,
           :up_bar_line, ChartLine,
           :down_bar_line, ChartLine,
           :up_bar_fill, ChartFill,
           :down_bar_fill, ChartFill,
           :default_label_position, :uchar,
           :ordered_list_pointers, ChartOrderedListPointers.by_value,
           :list_pointers, ChartListPointers.by_value
  end
  
  # @method chart_new(type)
  # @param [Integer] type 
  # @return [Chart] 
  # @scope class
  attach_function :chart_new, :lxw_chart_new, [:uchar], Chart
  
  # @method chart_free(chart)
  # @param [Chart] chart 
  # @return [nil] 
  # @scope class
  attach_function :chart_free, :lxw_chart_free, [Chart], :void
  
  # @method chart_assemble_xml_file(chart)
  # @param [Chart] chart 
  # @return [nil] 
  # @scope class
  attach_function :chart_assemble_xml_file, :lxw_chart_assemble_xml_file, [Chart], :void
  
  # @method chart_add_series(chart, categories, values)
  # @param [Chart] chart 
  # @param [String] categories 
  # @param [String] values 
  # @return [ChartSeries] 
  # @scope class
  attach_function :chart_add_series, :chart_add_series, [Chart, :string, :string], ChartSeries
  
  # @method chart_series_set_categories(series, sheetname, first_row, first_col, last_row, last_col)
  # @param [ChartSeries] series 
  # @param [String] sheetname 
  # @param [Integer] first_row 
  # @param [Integer] first_col 
  # @param [Integer] last_row 
  # @param [Integer] last_col 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_categories, :chart_series_set_categories, [ChartSeries, :string, :uint, :ushort, :uint, :ushort], :void
  
  # @method chart_series_set_values(series, sheetname, first_row, first_col, last_row, last_col)
  # @param [ChartSeries] series 
  # @param [String] sheetname 
  # @param [Integer] first_row 
  # @param [Integer] first_col 
  # @param [Integer] last_row 
  # @param [Integer] last_col 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_values, :chart_series_set_values, [ChartSeries, :string, :uint, :ushort, :uint, :ushort], :void
  
  # @method chart_series_set_name(series, name)
  # @param [ChartSeries] series 
  # @param [String] name 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_name, :chart_series_set_name, [ChartSeries, :string], :void
  
  # @method chart_series_set_name_range(series, sheetname, row, col)
  # @param [ChartSeries] series 
  # @param [String] sheetname 
  # @param [Integer] row 
  # @param [Integer] col 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_name_range, :chart_series_set_name_range, [ChartSeries, :string, :uint, :ushort], :void
  
  # @method chart_series_set_line(series, line)
  # @param [ChartSeries] series 
  # @param [ChartLine] line 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_line, :chart_series_set_line, [ChartSeries, ChartLine], :void
  
  # @method chart_series_set_fill(series, fill)
  # @param [ChartSeries] series 
  # @param [ChartFill] fill 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_fill, :chart_series_set_fill, [ChartSeries, ChartFill], :void
  
  # @method chart_series_set_invert_if_negative(series)
  # @param [ChartSeries] series 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_invert_if_negative, :chart_series_set_invert_if_negative, [ChartSeries], :void
  
  # @method chart_series_set_pattern(series, pattern)
  # @param [ChartSeries] series 
  # @param [ChartPattern] pattern 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_pattern, :chart_series_set_pattern, [ChartSeries, ChartPattern], :void
  
  # @method chart_series_set_marker_type(series, type)
  # @param [ChartSeries] series 
  # @param [Integer] type 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_marker_type, :chart_series_set_marker_type, [ChartSeries, :uchar], :void
  
  # @method chart_series_set_marker_size(series, size)
  # @param [ChartSeries] series 
  # @param [Integer] size 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_marker_size, :chart_series_set_marker_size, [ChartSeries, :uchar], :void
  
  # @method chart_series_set_marker_line(series, line)
  # @param [ChartSeries] series 
  # @param [ChartLine] line 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_marker_line, :chart_series_set_marker_line, [ChartSeries, ChartLine], :void
  
  # @method chart_series_set_marker_fill(series, fill)
  # @param [ChartSeries] series 
  # @param [ChartFill] fill 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_marker_fill, :chart_series_set_marker_fill, [ChartSeries, ChartFill], :void
  
  # @method chart_series_set_marker_pattern(series, pattern)
  # @param [ChartSeries] series 
  # @param [ChartPattern] pattern 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_marker_pattern, :chart_series_set_marker_pattern, [ChartSeries, ChartPattern], :void
  
  # @method chart_series_set_points(series, points)
  # @param [ChartSeries] series 
  # @param [FFI::Pointer(*ChartPoint)] points 
  # @return [Symbol from _enum_error_] 
  # @scope class
  attach_function :chart_series_set_points, :chart_series_set_points, [ChartSeries, :pointer], :error
  
  # @method chart_series_set_smooth(series, smooth)
  # @param [ChartSeries] series 
  # @param [Integer] smooth 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_smooth, :chart_series_set_smooth, [ChartSeries, :uchar], :void
  
  # @method chart_series_set_labels(series)
  # @param [ChartSeries] series 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_labels, :chart_series_set_labels, [ChartSeries], :void
  
  # @method chart_series_set_labels_options(series, show_name, show_category, show_value)
  # @param [ChartSeries] series 
  # @param [Integer] show_name 
  # @param [Integer] show_category 
  # @param [Integer] show_value 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_labels_options, :chart_series_set_labels_options, [ChartSeries, :uchar, :uchar, :uchar], :void
  
  # @method chart_series_set_labels_separator(series, separator)
  # @param [ChartSeries] series 
  # @param [Integer] separator 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_labels_separator, :chart_series_set_labels_separator, [ChartSeries, :uchar], :void
  
  # @method chart_series_set_labels_position(series, position)
  # @param [ChartSeries] series 
  # @param [Integer] position 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_labels_position, :chart_series_set_labels_position, [ChartSeries, :uchar], :void
  
  # @method chart_series_set_labels_leader_line(series)
  # @param [ChartSeries] series 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_labels_leader_line, :chart_series_set_labels_leader_line, [ChartSeries], :void
  
  # @method chart_series_set_labels_legend(series)
  # @param [ChartSeries] series 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_labels_legend, :chart_series_set_labels_legend, [ChartSeries], :void
  
  # @method chart_series_set_labels_percentage(series)
  # @param [ChartSeries] series 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_labels_percentage, :chart_series_set_labels_percentage, [ChartSeries], :void
  
  # @method chart_series_set_labels_num_format(series, num_format)
  # @param [ChartSeries] series 
  # @param [String] num_format 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_labels_num_format, :chart_series_set_labels_num_format, [ChartSeries, :string], :void
  
  # @method chart_series_set_labels_font(series, font)
  # @param [ChartSeries] series 
  # @param [ChartFont] font 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_labels_font, :chart_series_set_labels_font, [ChartSeries, ChartFont], :void
  
  # @method chart_series_set_trendline(series, type, value)
  # @param [ChartSeries] series 
  # @param [Integer] type 
  # @param [Integer] value 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_trendline, :chart_series_set_trendline, [ChartSeries, :uchar, :uchar], :void
  
  # @method chart_series_set_trendline_forecast(series, forward, backward)
  # @param [ChartSeries] series 
  # @param [Float] forward 
  # @param [Float] backward 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_trendline_forecast, :chart_series_set_trendline_forecast, [ChartSeries, :double, :double], :void
  
  # @method chart_series_set_trendline_equation(series)
  # @param [ChartSeries] series 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_trendline_equation, :chart_series_set_trendline_equation, [ChartSeries], :void
  
  # @method chart_series_set_trendline_r_squared(series)
  # @param [ChartSeries] series 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_trendline_r_squared, :chart_series_set_trendline_r_squared, [ChartSeries], :void
  
  # @method chart_series_set_trendline_intercept(series, intercept)
  # @param [ChartSeries] series 
  # @param [Float] intercept 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_trendline_intercept, :chart_series_set_trendline_intercept, [ChartSeries, :double], :void
  
  # @method chart_series_set_trendline_name(series, name)
  # @param [ChartSeries] series 
  # @param [String] name 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_trendline_name, :chart_series_set_trendline_name, [ChartSeries, :string], :void
  
  # @method chart_series_set_trendline_line(series, line)
  # @param [ChartSeries] series 
  # @param [ChartLine] line 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_trendline_line, :chart_series_set_trendline_line, [ChartSeries, ChartLine], :void
  
  # @method chart_series_set_error_bars(error_bars, type, value)
  # @param [SeriesErrorBars] error_bars 
  # @param [Integer] type 
  # @param [Float] value 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_error_bars, :chart_series_set_error_bars, [SeriesErrorBars, :uchar, :double], :void
  
  # @method chart_series_set_error_bars_direction(error_bars, direction)
  # @param [SeriesErrorBars] error_bars 
  # @param [Integer] direction 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_error_bars_direction, :chart_series_set_error_bars_direction, [SeriesErrorBars, :uchar], :void
  
  # @method chart_series_set_error_bars_endcap(error_bars, endcap)
  # @param [SeriesErrorBars] error_bars 
  # @param [Integer] endcap 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_error_bars_endcap, :chart_series_set_error_bars_endcap, [SeriesErrorBars, :uchar], :void
  
  # @method chart_series_set_error_bars_line(error_bars, line)
  # @param [SeriesErrorBars] error_bars 
  # @param [ChartLine] line 
  # @return [nil] 
  # @scope class
  attach_function :chart_series_set_error_bars_line, :chart_series_set_error_bars_line, [SeriesErrorBars, ChartLine], :void
  
  # @method chart_axis_set_name(axis, name)
  # @param [ChartAxis] axis 
  # @param [String] name 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_set_name, :chart_axis_set_name, [ChartAxis, :string], :void
  
  # @method chart_axis_set_name_range(axis, sheetname, row, col)
  # @param [ChartAxis] axis 
  # @param [String] sheetname 
  # @param [Integer] row 
  # @param [Integer] col 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_set_name_range, :chart_axis_set_name_range, [ChartAxis, :string, :uint, :ushort], :void
  
  # @method chart_axis_set_name_font(axis, font)
  # @param [ChartAxis] axis 
  # @param [ChartFont] font 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_set_name_font, :chart_axis_set_name_font, [ChartAxis, ChartFont], :void
  
  # @method chart_axis_set_num_font(axis, font)
  # @param [ChartAxis] axis 
  # @param [ChartFont] font 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_set_num_font, :chart_axis_set_num_font, [ChartAxis, ChartFont], :void
  
  # @method chart_axis_set_num_format(axis, num_format)
  # @param [ChartAxis] axis 
  # @param [String] num_format 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_set_num_format, :chart_axis_set_num_format, [ChartAxis, :string], :void
  
  # @method chart_axis_set_line(axis, line)
  # @param [ChartAxis] axis 
  # @param [ChartLine] line 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_set_line, :chart_axis_set_line, [ChartAxis, ChartLine], :void
  
  # @method chart_axis_set_fill(axis, fill)
  # @param [ChartAxis] axis 
  # @param [ChartFill] fill 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_set_fill, :chart_axis_set_fill, [ChartAxis, ChartFill], :void
  
  # @method chart_axis_set_pattern(axis, pattern)
  # @param [ChartAxis] axis 
  # @param [ChartPattern] pattern 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_set_pattern, :chart_axis_set_pattern, [ChartAxis, ChartPattern], :void
  
  # @method chart_axis_set_reverse(axis)
  # @param [ChartAxis] axis 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_set_reverse, :chart_axis_set_reverse, [ChartAxis], :void
  
  # @method chart_axis_set_crossing(axis, value)
  # @param [ChartAxis] axis 
  # @param [Float] value 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_set_crossing, :chart_axis_set_crossing, [ChartAxis, :double], :void
  
  # @method chart_axis_set_crossing_max(axis)
  # @param [ChartAxis] axis 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_set_crossing_max, :chart_axis_set_crossing_max, [ChartAxis], :void
  
  # @method chart_axis_off(axis)
  # @param [ChartAxis] axis 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_off, :chart_axis_off, [ChartAxis], :void
  
  # @method chart_axis_set_position(axis, position)
  # @param [ChartAxis] axis 
  # @param [Integer] position 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_set_position, :chart_axis_set_position, [ChartAxis, :uchar], :void
  
  # @method chart_axis_set_label_position(axis, position)
  # @param [ChartAxis] axis 
  # @param [Integer] position 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_set_label_position, :chart_axis_set_label_position, [ChartAxis, :uchar], :void
  
  # @method chart_axis_set_min(axis, min)
  # @param [ChartAxis] axis 
  # @param [Float] min 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_set_min, :chart_axis_set_min, [ChartAxis, :double], :void
  
  # @method chart_axis_set_max(axis, max)
  # @param [ChartAxis] axis 
  # @param [Float] max 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_set_max, :chart_axis_set_max, [ChartAxis, :double], :void
  
  # @method chart_axis_set_log_base(axis, log_base)
  # @param [ChartAxis] axis 
  # @param [Integer] log_base 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_set_log_base, :chart_axis_set_log_base, [ChartAxis, :ushort], :void
  
  # @method chart_axis_set_major_tick_mark(axis, type)
  # @param [ChartAxis] axis 
  # @param [Integer] type 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_set_major_tick_mark, :chart_axis_set_major_tick_mark, [ChartAxis, :uchar], :void
  
  # @method chart_axis_set_minor_tick_mark(axis, type)
  # @param [ChartAxis] axis 
  # @param [Integer] type 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_set_minor_tick_mark, :chart_axis_set_minor_tick_mark, [ChartAxis, :uchar], :void
  
  # @method chart_axis_set_interval_unit(axis, unit)
  # @param [ChartAxis] axis 
  # @param [Integer] unit 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_set_interval_unit, :chart_axis_set_interval_unit, [ChartAxis, :ushort], :void
  
  # @method chart_axis_set_interval_tick(axis, unit)
  # @param [ChartAxis] axis 
  # @param [Integer] unit 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_set_interval_tick, :chart_axis_set_interval_tick, [ChartAxis, :ushort], :void
  
  # @method chart_axis_set_major_unit(axis, unit)
  # @param [ChartAxis] axis 
  # @param [Float] unit 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_set_major_unit, :chart_axis_set_major_unit, [ChartAxis, :double], :void
  
  # @method chart_axis_set_minor_unit(axis, unit)
  # @param [ChartAxis] axis 
  # @param [Float] unit 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_set_minor_unit, :chart_axis_set_minor_unit, [ChartAxis, :double], :void
  
  # @method chart_axis_set_display_units(axis, units)
  # @param [ChartAxis] axis 
  # @param [Integer] units 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_set_display_units, :chart_axis_set_display_units, [ChartAxis, :uchar], :void
  
  # @method chart_axis_set_display_units_visible(axis, visible)
  # @param [ChartAxis] axis 
  # @param [Integer] visible 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_set_display_units_visible, :chart_axis_set_display_units_visible, [ChartAxis, :uchar], :void
  
  # @method chart_axis_major_gridlines_set_visible(axis, visible)
  # @param [ChartAxis] axis 
  # @param [Integer] visible 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_major_gridlines_set_visible, :chart_axis_major_gridlines_set_visible, [ChartAxis, :uchar], :void
  
  # @method chart_axis_minor_gridlines_set_visible(axis, visible)
  # @param [ChartAxis] axis 
  # @param [Integer] visible 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_minor_gridlines_set_visible, :chart_axis_minor_gridlines_set_visible, [ChartAxis, :uchar], :void
  
  # @method chart_axis_major_gridlines_set_line(axis, line)
  # @param [ChartAxis] axis 
  # @param [ChartLine] line 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_major_gridlines_set_line, :chart_axis_major_gridlines_set_line, [ChartAxis, ChartLine], :void
  
  # @method chart_axis_minor_gridlines_set_line(axis, line)
  # @param [ChartAxis] axis 
  # @param [ChartLine] line 
  # @return [nil] 
  # @scope class
  attach_function :chart_axis_minor_gridlines_set_line, :chart_axis_minor_gridlines_set_line, [ChartAxis, ChartLine], :void
  
  # @method chart_title_set_name(chart, name)
  # @param [Chart] chart 
  # @param [String] name 
  # @return [nil] 
  # @scope class
  attach_function :chart_title_set_name, :chart_title_set_name, [Chart, :string], :void
  
  # @method chart_title_set_name_range(chart, sheetname, row, col)
  # @param [Chart] chart 
  # @param [String] sheetname 
  # @param [Integer] row 
  # @param [Integer] col 
  # @return [nil] 
  # @scope class
  attach_function :chart_title_set_name_range, :chart_title_set_name_range, [Chart, :string, :uint, :ushort], :void
  
  # @method chart_title_set_name_font(chart, font)
  # @param [Chart] chart 
  # @param [ChartFont] font 
  # @return [nil] 
  # @scope class
  attach_function :chart_title_set_name_font, :chart_title_set_name_font, [Chart, ChartFont], :void
  
  # @method chart_title_off(chart)
  # @param [Chart] chart 
  # @return [nil] 
  # @scope class
  attach_function :chart_title_off, :chart_title_off, [Chart], :void
  
  # @method chart_legend_set_position(chart, position)
  # @param [Chart] chart 
  # @param [Integer] position 
  # @return [nil] 
  # @scope class
  attach_function :chart_legend_set_position, :chart_legend_set_position, [Chart, :uchar], :void
  
  # @method chart_legend_set_font(chart, font)
  # @param [Chart] chart 
  # @param [ChartFont] font 
  # @return [nil] 
  # @scope class
  attach_function :chart_legend_set_font, :chart_legend_set_font, [Chart, ChartFont], :void
  
  # @method chart_legend_delete_series(chart, delete_series)
  # @param [Chart] chart 
  # @param [FFI::Pointer(*Short)] delete_series 
  # @return [Symbol from _enum_error_] 
  # @scope class
  attach_function :chart_legend_delete_series, :chart_legend_delete_series, [Chart, :pointer], :error
  
  # @method chart_chartarea_set_line(chart, line)
  # @param [Chart] chart 
  # @param [ChartLine] line 
  # @return [nil] 
  # @scope class
  attach_function :chart_chartarea_set_line, :chart_chartarea_set_line, [Chart, ChartLine], :void
  
  # @method chart_chartarea_set_fill(chart, fill)
  # @param [Chart] chart 
  # @param [ChartFill] fill 
  # @return [nil] 
  # @scope class
  attach_function :chart_chartarea_set_fill, :chart_chartarea_set_fill, [Chart, ChartFill], :void
  
  # @method chart_chartarea_set_pattern(chart, pattern)
  # @param [Chart] chart 
  # @param [ChartPattern] pattern 
  # @return [nil] 
  # @scope class
  attach_function :chart_chartarea_set_pattern, :chart_chartarea_set_pattern, [Chart, ChartPattern], :void
  
  # @method chart_plotarea_set_line(chart, line)
  # @param [Chart] chart 
  # @param [ChartLine] line 
  # @return [nil] 
  # @scope class
  attach_function :chart_plotarea_set_line, :chart_plotarea_set_line, [Chart, ChartLine], :void
  
  # @method chart_plotarea_set_fill(chart, fill)
  # @param [Chart] chart 
  # @param [ChartFill] fill 
  # @return [nil] 
  # @scope class
  attach_function :chart_plotarea_set_fill, :chart_plotarea_set_fill, [Chart, ChartFill], :void
  
  # @method chart_plotarea_set_pattern(chart, pattern)
  # @param [Chart] chart 
  # @param [ChartPattern] pattern 
  # @return [nil] 
  # @scope class
  attach_function :chart_plotarea_set_pattern, :chart_plotarea_set_pattern, [Chart, ChartPattern], :void
  
  # @method chart_set_style(chart, style_id)
  # @param [Chart] chart 
  # @param [Integer] style_id 
  # @return [nil] 
  # @scope class
  attach_function :chart_set_style, :chart_set_style, [Chart, :uchar], :void
  
  # @method chart_set_table(chart)
  # @param [Chart] chart 
  # @return [nil] 
  # @scope class
  attach_function :chart_set_table, :chart_set_table, [Chart], :void
  
  # @method chart_set_table_grid(chart, horizontal, vertical, outline, legend_keys)
  # @param [Chart] chart 
  # @param [Integer] horizontal 
  # @param [Integer] vertical 
  # @param [Integer] outline 
  # @param [Integer] legend_keys 
  # @return [nil] 
  # @scope class
  attach_function :chart_set_table_grid, :chart_set_table_grid, [Chart, :uchar, :uchar, :uchar, :uchar], :void
  
  # @method chart_set_table_font(chart, font)
  # @param [Chart] chart 
  # @param [ChartFont] font 
  # @return [nil] 
  # @scope class
  attach_function :chart_set_table_font, :chart_set_table_font, [Chart, ChartFont], :void
  
  # @method chart_set_up_down_bars(chart)
  # @param [Chart] chart 
  # @return [nil] 
  # @scope class
  attach_function :chart_set_up_down_bars, :chart_set_up_down_bars, [Chart], :void
  
  # @method chart_set_up_down_bars_format(chart, up_bar_line, up_bar_fill, down_bar_line, down_bar_fill)
  # @param [Chart] chart 
  # @param [ChartLine] up_bar_line 
  # @param [ChartFill] up_bar_fill 
  # @param [ChartLine] down_bar_line 
  # @param [ChartFill] down_bar_fill 
  # @return [nil] 
  # @scope class
  attach_function :chart_set_up_down_bars_format, :chart_set_up_down_bars_format, [Chart, ChartLine, ChartFill, ChartLine, ChartFill], :void
  
  # @method chart_set_drop_lines(chart, line)
  # @param [Chart] chart 
  # @param [ChartLine] line 
  # @return [nil] 
  # @scope class
  attach_function :chart_set_drop_lines, :chart_set_drop_lines, [Chart, ChartLine], :void
  
  # @method chart_set_high_low_lines(chart, line)
  # @param [Chart] chart 
  # @param [ChartLine] line 
  # @return [nil] 
  # @scope class
  attach_function :chart_set_high_low_lines, :chart_set_high_low_lines, [Chart, ChartLine], :void
  
  # @method chart_set_series_overlap(chart, overlap)
  # @param [Chart] chart 
  # @param [Integer] overlap 
  # @return [nil] 
  # @scope class
  attach_function :chart_set_series_overlap, :chart_set_series_overlap, [Chart, :char], :void
  
  # @method chart_set_series_gap(chart, gap)
  # @param [Chart] chart 
  # @param [Integer] gap 
  # @return [nil] 
  # @scope class
  attach_function :chart_set_series_gap, :chart_set_series_gap, [Chart, :ushort], :void
  
  # @method chart_show_blanks_as(chart, option)
  # @param [Chart] chart 
  # @param [Integer] option 
  # @return [nil] 
  # @scope class
  attach_function :chart_show_blanks_as, :chart_show_blanks_as, [Chart, :uchar], :void
  
  # @method chart_show_hidden_data(chart)
  # @param [Chart] chart 
  # @return [nil] 
  # @scope class
  attach_function :chart_show_hidden_data, :chart_show_hidden_data, [Chart], :void
  
  # @method chart_set_rotation(chart, rotation)
  # @param [Chart] chart 
  # @param [Integer] rotation 
  # @return [nil] 
  # @scope class
  attach_function :chart_set_rotation, :chart_set_rotation, [Chart, :ushort], :void
  
  # @method chart_set_hole_size(chart, size)
  # @param [Chart] chart 
  # @param [Integer] size 
  # @return [nil] 
  # @scope class
  attach_function :chart_set_hole_size, :chart_set_hole_size, [Chart, :uchar], :void
  
  # @method chart_add_data_cache(range, data, rows, cols, col)
  # @param [SeriesRange] range 
  # @param [FFI::Pointer(*Uint8T)] data 
  # @param [Integer] rows 
  # @param [Integer] cols 
  # @param [Integer] col 
  # @return [Symbol from _enum_error_] 
  # @scope class
  attach_function :chart_add_data_cache, :lxw_chart_add_data_cache, [SeriesRange, :pointer, :ushort, :uchar, :uchar], :error
end