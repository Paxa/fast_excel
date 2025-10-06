module Libxlsxwriter
  # = Fields:
  # :stqe_next ::
  #   (FFI::Pointer(*Worksheet))
  class WorksheetListPointers < FFI::Struct
    layout :stqe_next, :pointer
  end

  # = Fields:
  # :file ::
  #   (FFI::Pointer(*FILE))
  # :optimize_tmpfile ::
  #   (FFI::Pointer(*FILE))
  # :table ::
  #   (TableRows)
  # :hyperlinks ::
  #   (TableRows)
  # :array ::
  #   (FFI::Pointer(**Cell))
  # :merged_ranges ::
  #   (MergedRanges)
  # :selections ::
  #   (Selections)
  # :image_data ::
  #   (ImageData)
  # :chart_data ::
  #   (ChartData)
  # :dim_rowmin ::
  #   (Integer)
  # :dim_rowmax ::
  #   (Integer)
  # :dim_colmin ::
  #   (Integer)
  # :dim_colmax ::
  #   (Integer)
  # :sst ::
  #   (Sst)
  # :name ::
  #   (String)
  # :quoted_name ::
  #   (String)
  # :tmpdir ::
  #   (String)
  # :index ::
  #   (Integer)
  # :active ::
  #   (Integer)
  # :selected ::
  #   (Integer)
  # :hidden ::
  #   (Integer)
  # :active_sheet ::
  #   (FFI::Pointer(*Uint16T))
  # :first_sheet ::
  #   (FFI::Pointer(*Uint16T))
  # :col_options ::
  #   (FFI::Pointer(**ColOptions))
  # :col_options_max ::
  #   (Integer)
  # :col_sizes ::
  #   (FFI::Pointer(*Double))
  # :col_sizes_max ::
  #   (Integer)
  # :col_formats ::
  #   (FFI::Pointer(**Format))
  # :col_formats_max ::
  #   (Integer)
  # :col_size_changed ::
  #   (Integer)
  # :row_size_changed ::
  #   (Integer)
  # :optimize ::
  #   (Integer)
  # :optimize_row ::
  #   (FFI::Pointer(*Row))
  # :fit_height ::
  #   (Integer)
  # :fit_width ::
  #   (Integer)
  # :horizontal_dpi ::
  #   (Integer)
  # :hlink_count ::
  #   (Integer)
  # :page_start ::
  #   (Integer)
  # :print_scale ::
  #   (Integer)
  # :rel_count ::
  #   (Integer)
  # :vertical_dpi ::
  #   (Integer)
  # :zoom ::
  #   (Integer)
  # :filter_on ::
  #   (Integer)
  # :fit_page ::
  #   (Integer)
  # :hcenter ::
  #   (Integer)
  # :orientation ::
  #   (Integer)
  # :outline_changed ::
  #   (Integer)
  # :outline_on ::
  #   (Integer)
  # :page_order ::
  #   (Integer)
  # :page_setup_changed ::
  #   (Integer)
  # :page_view ::
  #   (Integer)
  # :paper_size ::
  #   (Integer)
  # :print_gridlines ::
  #   (Integer)
  # :print_headers ::
  #   (Integer)
  # :print_options_changed ::
  #   (Integer)
  # :right_to_left ::
  #   (Integer)
  # :screen_gridlines ::
  #   (Integer)
  # :show_zeros ::
  #   (Integer)
  # :vba_codename ::
  #   (Integer)
  # :vcenter ::
  #   (Integer)
  # :zoom_scale_normal ::
  #   (Integer)
  # :tab_color ::
  #   (Integer)
  # :margin_left ::
  #   (Float)
  # :margin_right ::
  #   (Float)
  # :margin_top ::
  #   (Float)
  # :margin_bottom ::
  #   (Float)
  # :margin_header ::
  #   (Float)
  # :margin_footer ::
  #   (Float)
  # :default_row_height ::
  #   (Float)
  # :default_row_pixels ::
  #   (Integer)
  # :default_col_pixels ::
  #   (Integer)
  # :default_row_zeroed ::
  #   (Integer)
  # :default_row_set ::
  #   (Integer)
  # :header_footer_changed ::
  #   (Integer)
  # :header ::
  #   (Array<Integer>)
  # :footer ::
  #   (Array<Integer>)
  # :repeat_rows ::
  #   (RepeatRows)
  # :repeat_cols ::
  #   (RepeatCols)
  # :print_area ::
  #   (PrintArea)
  # :autofilter ::
  #   (Autofilter)
  # :merged_range_count ::
  #   (Integer)
  # :hbreaks ::
  #   (FFI::Pointer(*RowT))
  # :vbreaks ::
  #   (FFI::Pointer(*ColT))
  # :hbreaks_count ::
  #   (Integer)
  # :vbreaks_count ::
  #   (Integer)
  # :external_hyperlinks ::
  #   (FFI::Pointer(*RelTuples))
  # :external_drawing_links ::
  #   (FFI::Pointer(*RelTuples))
  # :drawing_links ::
  #   (FFI::Pointer(*RelTuples))
  # :panes ::
  #   (Panes)
  # :protection ::
  #   (Protection)
  # :drawing ::
  #   (Drawing)
  # :list_pointers ::
  #   (WorksheetListPointers)
  module WorksheetWrappers
    # @param [Integer] row
    # @param [Integer] col
    # @param [Float] number
    # @param [Format] format
    # @return [Symbol from _enum_error_]
    def write_number(row, col, number, format)
      Libxlsxwriter.worksheet_write_number(self, row, col, number, format)
    end

    # @param [Integer] row
    # @param [Integer] col
    # @param [String] string
    # @param [Format] format
    # @return [Symbol from _enum_error_]
    def write_string(row, col, string, format)
      Libxlsxwriter.worksheet_write_string(self, row, col, string, format)
    end

    def write_comment(row, col, string)
      Libxlsxwriter.worksheet_write_comment(self, row, col, string)
    end

    # @param [Integer] row
    # @param [Integer] col
    # @param [String] formula
    # @param [Format] format
    # @return [Symbol from _enum_error_]
    def write_formula(row, col, formula, format)
      Libxlsxwriter.worksheet_write_formula(self, row, col, formula, format)
    end

    # @param [Integer] first_row
    # @param [Integer] first_col
    # @param [Integer] last_row
    # @param [Integer] last_col
    # @param [String] formula
    # @param [Format] format
    # @return [Symbol from _enum_error_]
    def write_array_formula(first_row, first_col, last_row, last_col, formula, format)
      Libxlsxwriter.worksheet_write_array_formula(self, first_row, first_col, last_row, last_col, formula, format)
    end

    # @param [Integer] first_row
    # @param [Integer] first_col
    # @param [Integer] last_row
    # @param [Integer] last_col
    # @param [String] formula
    # @param [Format] format
    # @param [Float] result
    # @return [Symbol from _enum_error_]
    def write_array_formula_num(first_row, first_col, last_row, last_col, formula, format, result)
      Libxlsxwriter.worksheet_write_array_formula_num(self, first_row, first_col, last_row, last_col, formula, format, result)
    end

    # @param [Integer] row
    # @param [Integer] col
    # @param [Datetime] datetime
    # @param [Format] format
    # @return [Symbol from _enum_error_]
    def write_datetime(row, col, datetime, format)
      Libxlsxwriter.worksheet_write_datetime(self, row, col, datetime, format)
    end

    # @param [Integer] row_num
    # @param [Integer] col_num
    # @param [String] url
    # @param [Format] format
    # @param [String] string
    # @param [String] tooltip
    # @return [Symbol from _enum_error_]
    def write_url_opt(row_num, col_num, url, format, string, tooltip)
      Libxlsxwriter.worksheet_write_url_opt(self, row_num, col_num, url, format, string, tooltip)
    end

    # @param [Integer] row
    # @param [Integer] col
    # @param [String] url
    # @param [Format] format
    # @return [Symbol from _enum_error_]
    def write_url(row, col, url, format)
      Libxlsxwriter.worksheet_write_url(self, row, col, url, format)
    end

    # @param [Integer] row
    # @param [Integer] col
    # @param [Integer] value
    # @param [Format] format
    # @return [Symbol from _enum_error_]
    def write_boolean(row, col, value, format)
      Libxlsxwriter.worksheet_write_boolean(self, row, col, value, format)
    end

    # @param [Integer] row
    # @param [Integer] col
    # @param [Format] format
    # @return [Symbol from _enum_error_]
    def write_blank(row, col, format)
      Libxlsxwriter.worksheet_write_blank(self, row, col, format)
    end

    # @param [Integer] row
    # @param [Integer] col
    # @param [String] formula
    # @param [Format] format
    # @param [Float] result
    # @return [Symbol from _enum_error_]
    def write_formula_num(row, col, formula, format, result)
      Libxlsxwriter.worksheet_write_formula_num(self, row, col, formula, format, result)
    end

    # @param [Integer] row
    # @param [Float] height
    # @param [Format] format
    # @return [Symbol from _enum_error_]
    def set_row(row, height, format)
      Libxlsxwriter.worksheet_set_row(self, row, height, format)
    end

    # @param [Integer] row
    # @param [Float] height
    # @param [Format] format
    # @param [RowColOptions] options
    # @return [Symbol from _enum_error_]
    def set_row_opt(row, height, format, options)
      Libxlsxwriter.worksheet_set_row_opt(self, row, height, format, options)
    end

    # @param [Integer] first_col
    # @param [Integer] last_col
    # @param [Float] width
    # @param [Format] format
    # @return [Symbol from _enum_error_]
    def set_column(first_col, last_col, width, format)
      Libxlsxwriter.worksheet_set_column(self, first_col, last_col, width, format)
    end

    # @param [Integer] first_col
    # @param [Integer] last_col
    # @param [Float] width
    # @param [Format] format
    # @param [RowColOptions] options
    # @return [Symbol from _enum_error_]
    def set_column_opt(first_col, last_col, width, format, options)
      Libxlsxwriter.worksheet_set_column_opt(self, first_col, last_col, width, format, options)
    end

    # @param [Integer] row
    # @param [Integer] col
    # @param [String] filename
    # @return [Symbol from _enum_error_]
    def insert_image(row, col, filename)
      Libxlsxwriter.worksheet_insert_image(self, row, col, filename)
    end

    # @param [Integer] row
    # @param [Integer] col
    # @param [String] filename
    # @param [ImageOptions] options
    # @return [Symbol from _enum_error_]
    def insert_image_opt(row, col, filename, options)
      Libxlsxwriter.worksheet_insert_image_opt(self, row, col, filename, options)
    end

    # @param [Integer] row
    # @param [Integer] col
    # @param [String] filename
    # @return [Symbol from _enum_error_]
    def embed_image(row, col, filename)
      Libxlsxwriter.worksheet_embed_image(self, row, col, filename)
    end

    # @param [Integer] row
    # @param [Integer] col
    # @param [String] filename
    # @param [ImageOptions] options
    # @return [Symbol from _enum_error_]
    def embed_image_opt(row, col, filename, options)
      Libxlsxwriter.worksheet_embed_image_opt(self, row, col, filename, options)
    end

    # @param [Integer] row
    # @param [Integer] col
    # @param [Chart] chart
    # @return [Symbol from _enum_error_]
    def insert_chart(row, col, chart)
      Libxlsxwriter.worksheet_insert_chart(self, row, col, chart)
    end

    # @param [Integer] row
    # @param [Integer] col
    # @param [Chart] chart
    # @param [ImageOptions] user_options
    # @return [Symbol from _enum_error_]
    def insert_chart_opt(row, col, chart, user_options)
      Libxlsxwriter.worksheet_insert_chart_opt(self, row, col, chart, user_options)
    end

    # @param [Integer] first_row
    # @param [Integer] first_col
    # @param [Integer] last_row
    # @param [Integer] last_col
    # @param [String] string
    # @param [Format] format
    # @return [Symbol from _enum_error_]
    def merge_range(first_row, first_col, last_row, last_col, string, format)
      Libxlsxwriter.worksheet_merge_range(self, first_row, first_col, last_row, last_col, string, format)
    end

    # @param [Integer] first_row
    # @param [Integer] first_col
    # @param [Integer] last_row
    # @param [Integer] last_col
    # @return [Symbol from _enum_error_]
    def autofilter(first_row, first_col, last_row, last_col)
      Libxlsxwriter.worksheet_autofilter(self, first_row, first_col, last_row, last_col)
    end

    # @return [nil]
    def activate()
      Libxlsxwriter.worksheet_activate(self)
    end

    # @return [nil]
    def select()
      Libxlsxwriter.worksheet_select(self)
    end

    # @return [nil]
    def hide()
      Libxlsxwriter.worksheet_hide(self)
    end

    # @return [nil]
    def set_first_sheet()
      Libxlsxwriter.worksheet_set_first_sheet(self)
    end

    # @param [Integer] row
    # @param [Integer] col
    # @return [nil]
    def freeze_panes(row, col)
      Libxlsxwriter.worksheet_freeze_panes(self, row, col)
    end

    # @param [Float] vertical
    # @param [Float] horizontal
    # @return [nil]
    def split_panes(vertical, horizontal)
      Libxlsxwriter.worksheet_split_panes(self, vertical, horizontal)
    end

    # @param [Integer] first_row
    # @param [Integer] first_col
    # @param [Integer] top_row
    # @param [Integer] left_col
    # @param [Integer] type
    # @return [nil]
    def freeze_panes_opt(first_row, first_col, top_row, left_col, type)
      Libxlsxwriter.worksheet_freeze_panes_opt(self, first_row, first_col, top_row, left_col, type)
    end

    # @param [Float] vertical
    # @param [Float] horizontal
    # @param [Integer] top_row
    # @param [Integer] left_col
    # @return [nil]
    def split_panes_opt(vertical, horizontal, top_row, left_col)
      Libxlsxwriter.worksheet_split_panes_opt(self, vertical, horizontal, top_row, left_col)
    end

    # @param [Integer] first_row
    # @param [Integer] first_col
    # @param [Integer] last_row
    # @param [Integer] last_col
    # @return [nil]
    def set_selection(first_row, first_col, last_row, last_col)
      Libxlsxwriter.worksheet_set_selection(self, first_row, first_col, last_row, last_col)
    end

    # @return [nil]
    def set_landscape()
      Libxlsxwriter.worksheet_set_landscape(self)
    end

    # @return [nil]
    def set_portrait()
      Libxlsxwriter.worksheet_set_portrait(self)
    end

    # @return [nil]
    def set_page_view()
      Libxlsxwriter.worksheet_set_page_view(self)
    end

    # @param [Integer] paper_type
    # @return [nil]
    def set_paper(paper_type)
      Libxlsxwriter.worksheet_set_paper(self, paper_type)
    end

    # @param [Float] left
    # @param [Float] right
    # @param [Float] top
    # @param [Float] bottom
    # @return [nil]
    def set_margins(left, right, top, bottom)
      Libxlsxwriter.worksheet_set_margins(self, left, right, top, bottom)
    end

    # @param [String] string
    # @return [Symbol from _enum_error_]
    def set_header(string)
      Libxlsxwriter.worksheet_set_header(self, string)
    end

    # @param [String] string
    # @return [Symbol from _enum_error_]
    def set_footer(string)
      Libxlsxwriter.worksheet_set_footer(self, string)
    end

    # @param [String] string
    # @param [HeaderFooterOptions] options
    # @return [Symbol from _enum_error_]
    def set_header_opt(string, options)
      Libxlsxwriter.worksheet_set_header_opt(self, string, options)
    end

    # @param [String] string
    # @param [HeaderFooterOptions] options
    # @return [Symbol from _enum_error_]
    def set_footer_opt(string, options)
      Libxlsxwriter.worksheet_set_footer_opt(self, string, options)
    end

    # @param [FFI::Pointer(*U_int)] breaks
    # @return [Symbol from _enum_error_]
    def set_h_pagebreaks(breaks)
      Libxlsxwriter.worksheet_set_h_pagebreaks(self, breaks)
    end

    # @param [FFI::Pointer(*U_short)] breaks
    # @return [Symbol from _enum_error_]
    def set_v_pagebreaks(breaks)
      Libxlsxwriter.worksheet_set_v_pagebreaks(self, breaks)
    end

    # @return [nil]
    def print_across()
      Libxlsxwriter.worksheet_print_across(self)
    end

    # @param [Integer] scale
    # @return [nil]
    def set_zoom(scale)
      Libxlsxwriter.worksheet_set_zoom(self, scale)
    end

    # @param [Integer] option
    # @return [nil]
    def gridlines(option)
      Libxlsxwriter.worksheet_gridlines(self, option)
    end

    # @return [nil]
    def center_horizontally()
      Libxlsxwriter.worksheet_center_horizontally(self)
    end

    # @return [nil]
    def center_vertically()
      Libxlsxwriter.worksheet_center_vertically(self)
    end

    # @return [nil]
    def print_row_col_headers()
      Libxlsxwriter.worksheet_print_row_col_headers(self)
    end

    # @param [Integer] first_row
    # @param [Integer] last_row
    # @return [Symbol from _enum_error_]
    def repeat_rows(first_row, last_row)
      Libxlsxwriter.worksheet_repeat_rows(self, first_row, last_row)
    end

    # @param [Integer] first_col
    # @param [Integer] last_col
    # @return [Symbol from _enum_error_]
    def repeat_columns(first_col, last_col)
      Libxlsxwriter.worksheet_repeat_columns(self, first_col, last_col)
    end

    # @param [Integer] first_row
    # @param [Integer] first_col
    # @param [Integer] last_row
    # @param [Integer] last_col
    # @return [Symbol from _enum_error_]
    def print_area(first_row, first_col, last_row, last_col)
      Libxlsxwriter.worksheet_print_area(self, first_row, first_col, last_row, last_col)
    end

    # @param [Integer] width
    # @param [Integer] height
    # @return [nil]
    def fit_to_pages(width, height)
      Libxlsxwriter.worksheet_fit_to_pages(self, width, height)
    end

    # @param [Integer] start_page
    # @return [nil]
    def set_start_page(start_page)
      Libxlsxwriter.worksheet_set_start_page(self, start_page)
    end

    # @param [Integer] scale
    # @return [nil]
    def set_print_scale(scale)
      Libxlsxwriter.worksheet_set_print_scale(self, scale)
    end

    # @return [nil]
    def set_right_to_left()
      Libxlsxwriter.worksheet_right_to_left(self)
    end

    # @return [nil]
    def hide_zero()
      Libxlsxwriter.worksheet_hide_zero(self)
    end

    # @param [Integer] color
    # @return [nil]
    def set_tab_color(color)
      Libxlsxwriter.worksheet_set_tab_color(self, color)
    end

    # @param [String] password
    # @param [Protection] options
    # @return [nil]
    def protect(password, options)
      Libxlsxwriter.worksheet_protect(self, password, options)
    end

    # @param [Float] height
    # @param [Integer] hide_unused_rows
    # @return [nil]
    def set_default_row(height, hide_unused_rows)
      Libxlsxwriter.worksheet_set_default_row(self, height, hide_unused_rows)
    end

    # @return [nil]
    def free()
      Libxlsxwriter.worksheet_free(self)
    end

    # @return [nil]
    def assemble_xml_file()
      Libxlsxwriter.worksheet_assemble_xml_file(self)
    end

    # @return [nil]
    def write_single_row()
      Libxlsxwriter.worksheet_write_single_row(self)
    end

    # @param [Integer] image_ref_id
    # @param [Integer] drawing_id
    # @param [ImageOptions] image_data
    # @return [nil]
    def prepare_image(image_ref_id, drawing_id, image_data)
      Libxlsxwriter.worksheet_prepare_image(self, image_ref_id, drawing_id, image_data)
    end

    # @param [Integer] chart_ref_id
    # @param [Integer] drawing_id
    # @param [ImageOptions] image_data
    # @return [nil]
    def prepare_chart(chart_ref_id, drawing_id, image_data)
      Libxlsxwriter.worksheet_prepare_chart(self, chart_ref_id, drawing_id, image_data)
    end

    # @param [Integer] row_num
    # @return [Row]
    def find_row(row_num)
      Row.new(Libxlsxwriter.worksheet_find_row(self, row_num))
    end
  end

  # = Fields:
  # :rbh_root ::
  #   (FFI::Pointer(*Cell))
  class TableCells < FFI::Struct
    layout :rbh_root, :pointer
  end

  # = Fields:
  # :rbh_root ::
  #   (FFI::Pointer(*Row))
  # :cached_row ::
  #   (FFI::Pointer(*Row))
  # :cached_row_num ::
  #   (Integer)
  class TableRows < FFI::Struct
    layout :rbh_root, :pointer,
           :cached_row, :pointer,
           :cached_row_num, :uint32
  end

  class Worksheet < FFI::Struct
    include WorksheetWrappers
    layout :file, :pointer,
           :optimize_tmpfile, :pointer,
           :optimize_buffer, :pointer,
           :optimize_buffer_size, :size_t,
           :table, TableRows.ptr,
           :hyperlinks, TableRows.ptr,
           :comments, TableRows.ptr,
           :array, :pointer,
           :merged_ranges, MergedRanges.ptr,
           :selections, :pointer,
           :data_validations, :pointer,
           :conditional_formats, :pointer,
           :image_props, :pointer,
           :embedded_image_props, :pointer,
           :chart_data, :pointer,
           :drawing_rel_ids, :pointer,
           :vml_drawing_rel_ids, :pointer,
           :comment_objs, :pointer,
           :header_image_objs, :pointer,
           :button_objs, :pointer,
           :table_objs, :pointer,
           :table_count, :uint16,

           :dim_rowmin, :uint32,
           :dim_rowmax, :uint32,
           :dim_colmin, :uint16,
           :dim_colmax, :uint16,

           :sst, Sst.ptr,
           :name, :string,
           :quoted_name, :string,
           :tmpdir, :pointer,

           :index, :uint16,
           :active, :uchar,
           :selected, :uchar,
           :hidden, :uchar,
           :active_sheet, :pointer,
           :first_sheet, :pointer,
           :is_chartsheet, :uchar,

           :col_options, :pointer,
           :col_options_max, :uint16,
           :col_sizes, :pointer,
           :col_sizes_max, :uint16,
           :col_formats, :pointer,
           :col_formats_max, :uint16,
           :col_size_changed, :uint8,
           :row_size_changed, :uint8,
           :optimize, :uint8,
           :optimize_row, :pointer,

           :fit_height, :uint16,
           :fit_width, :uint16,
           :horizontal_dpi, :uint16,
           :hlink_count, :uint16,
           :page_start, :uint16,
           :print_scale, :uint16,
           :rel_count, :uint16,
           :vertical_dpi, :uint16,
           :zoom, :uint16,

           :filter_on,             :uint8,
           :fit_page,              :uint8,
           :hcenter,               :uint8,
           :orientation,           :uint8,
           :outline_changed,       :uint8,
           :outline_on,            :uint8,
           :outline_style,         :uint8,
           :outline_below,         :uint8,
           :outline_right,         :uint8,
           :page_order,            :uint8,
           :page_setup_changed,    :uint8,
           :page_view,             :uint8,
           :paper_size,            :uint8,
           :print_gridlines,       :uint8,
           :print_headers,         :uint8,
           :print_options_changed, :uint8,
           :right_to_left,         :uint8,
           :screen_gridlines,      :uint8,
           :show_zeros,            :uint8,
           :vcenter,               :uint8,
           :zoom_scale_normal,     :uint8,
           :black_white,           :uint8,
           :num_validations,       :uint8,
           :has_dynamic_functions, :uint8,

           :vba_codename, :pointer,
           :num_buttons, :uint16,
           :tab_color, :uint32,
           :margin_left, :double,
           :margin_right, :double,
           :margin_top, :double,
           :margin_bottom, :double,
           :margin_header, :double,
           :margin_footer, :double,

           :default_row_height, :double,
           :default_row_pixels, :uint32,
           :default_col_pixels, :uint32,
           :default_row_zeroed, :uint8,
           :default_row_set, :uint8,
           :outline_row_level, :uint8,
           :outline_col_level, :uint8,

           :header_footer_changed, :uint8,
           :header, :pointer,
           :footer, :pointer,
           :repeat_rows, RepeatRows.by_value,
           :repeat_cols, RepeatCols.by_value,
           :print_area, PrintArea.by_value,
           :autofilter, Autofilter.by_value,

           :merged_range_count, :uint16,
           :max_url_length, :uint16,

           :hbreaks, :pointer,
           :vbreaks, :pointer,
           :hbreaks_count, :uint16,
           :vbreaks_count, :uint16,

           :drawing_rel_id, :uint32,
           :vml_drawing_rel_id, :uint32,

           :external_hyperlinks, :pointer,
           :external_drawing_links, :pointer,
           :drawing_links, :pointer,
           :vml_drawing_links, :pointer,
           :external_table_links, :pointer,

           :panes, Panes.by_value,
           :top_left_cell, [:char, 16],

           :protection, Protection.by_value,

           :drawing, :pointer,
           :default_url_format, :pointer,

           :has_vml, :uint8,
           :has_comments, :uint8,
           :has_header_vml, :uint8,
           :has_background_image, :uint8,
           :has_buttons, :uint8,
           :storing_embedded_image, :uint8,
           :external_vml_comment_link, :pointer,
           :external_comment_link, :pointer,
           :external_vml_header_link, :pointer,
           :external_background_link, :pointer,
           :comment_author, :pointer,
           :vml_data_id_str, :pointer,
           :vml_header_id_str, :pointer,
           :vml_shape_id, :uint32,
           :vml_header_id, :uint32,
           :dxf_priority, :uint32,
           :comment_display_default, :uint8,
           :data_bar_2010_index, :uint32,

           :has_ignore_errors, :uint8,
           :ignore_number_stored_as_text, :pointer,
           :ignore_eval_error, :pointer,
           :ignore_formula_differs, :pointer,
           :ignore_formula_range, :pointer,
           :ignore_formula_unlocked, :pointer,
           :ignore_empty_cell_reference, :pointer,
           :ignore_list_data_validation, :pointer,
           :ignore_calculated_column, :pointer,
           :ignore_two_digit_text_year, :pointer,

           :use_1904_epoch, :uint8,

           :excel_version, :uint16,

           :header_footer_objs, [:pointer, 6],
           :header_left_object_props, :pointer,
           :header_center_object_props, :pointer,
           :header_right_object_props, :pointer,
           :footer_left_object_props, :pointer,
           :footer_center_object_props, :pointer,
           :footer_right_object_props, :pointer,
           :background_image, :pointer,

           :filter_rules, :pointer,
           :num_filter_rules, :uint16
           # :drawing, Drawing.ptr,
           # :list_pointers, WorksheetListPointers.by_value
  end

  # = Fields:
  # :index ::
  #   (Integer)
  # :hidden ::
  #   (Integer)
  # :optimize ::
  #   (Integer)
  # :active_sheet ::
  #   (FFI::Pointer(*Uint16T))
  # :first_sheet ::
  #   (FFI::Pointer(*Uint16T))
  # :sst ::
  #   (Sst)
  # :name ::
  #   (String)
  # :quoted_name ::
  #   (String)
  # :tmpdir ::
  #   (String)
  class WorksheetInitData < FFI::Struct
    layout :index, :uint,
           :hidden, :uchar,
           :optimize, :uchar,
           :active_sheet, :pointer,
           :first_sheet, :pointer,
           :sst, Sst,
           :name, :string,
           :quoted_name, :string,
           :tmpdir, :string
  end

  # = Fields:
  # :rbe_left ::
  #   (FFI::Pointer(*Row))
  # :rbe_right ::
  #   (FFI::Pointer(*Row))
  # :rbe_parent ::
  #   (FFI::Pointer(*Row))
  # :rbe_color ::
  #   (Integer)
  class RowTreePointers < FFI::Struct
    layout :rbe_left, :pointer,
           :rbe_right, :pointer,
           :rbe_parent, :pointer,
           :rbe_color, :int
  end

  # = Fields:
  # :row_num ::
  #   (Integer)
  # :height ::
  #   (Float)
  # :format ::
  #   (Format)
  # :hidden ::
  #   (Integer)
  # :level ::
  #   (Integer)
  # :collapsed ::
  #   (Integer)
  # :row_changed ::
  #   (Integer)
  # :data_changed ::
  #   (Integer)
  # :height_changed ::
  #   (Integer)
  # :cells ::
  #   (TableCells)
  # :tree_pointers ::
  #   (RowTreePointers)
  class Row < FFI::Struct
    layout :row_num, :uint32,
           :height, :double,
           :format, Format,
           :hidden, :uchar,
           :level, :uchar,
           :collapsed, :uchar,
           :row_changed, :uchar,
           :data_changed, :uchar,
           :height_changed, :uchar,
           :cells, TableCells,
           :tree_pointers, RowTreePointers.by_value
  end

  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:cell_types).</em>
  #
  # === Options:
  # :number_cell ::
  #
  # :string_cell ::
  #
  # :inline_string_cell ::
  #
  # :formula_cell ::
  #
  # :array_formula_cell ::
  #
  # :blank_cell ::
  #
  # :boolean_cell ::
  #
  # :hyperlink_url ::
  #
  # :hyperlink_internal ::
  #
  # :hyperlink_external ::
  #
  #
  # @method _enum_cell_types_
  # @return [Symbol]
  # @scope class
  enum :cell_types, [
    :number_cell, 1,
    :string_cell, 2,
    :inline_string_cell, 3,
    :inline_rich_string_cell, 4,
    :formula_cell, 5,
    :array_formula_cell, 6,
    :blank_cell, 7,
    :boolean_cell, 8,
    :hyperlink_url, 9,
    :hyperlink_internal, 10,
    :hyperlink_external, 11
  ]

  # = Fields:
  # :number ::
  #   (Float)
  # :string_id ::
  #   (Integer)
  # :string ::
  #   (String)
  class CellU < FFI::Union
    layout :number, :double,
           :string_id, :int,
           :string, :pointer
  end

  # = Fields:
  # :rbe_left ::
  #   (FFI::Pointer(*Cell))
  # :rbe_right ::
  #   (FFI::Pointer(*Cell))
  # :rbe_parent ::
  #   (FFI::Pointer(*Cell))
  # :rbe_color ::
  #   (Integer)
  class CellTreePointers < FFI::Struct
    layout :rbe_left, :pointer,
           :rbe_right, :pointer,
           :rbe_parent, :pointer,
           :rbe_color, :int
  end

  # = Fields:
  # :row_num ::
  #   (Integer)
  # :col_num ::
  #   (Integer)
  # :type ::
  #   (Symbol from _enum_cell_types_)
  # :format ::
  #   (Format)
  # :u ::
  #   (CellU)
  # :formula_result ::
  #   (Float)
  # :user_data1 ::
  #   (String)
  # :user_data2 ::
  #   (String)
  # :sst_string ::
  #   (String)
  # :tree_pointers ::
  #   (CellTreePointers)
  class Cell < FFI::Struct
    layout :row_num, :uint32,
           :col_num, :uint16,
           :type, :cell_types,
           :format, :pointer,
           :u, CellU.by_value,
           :formula_result, :double,
           :user_data1, :pointer,
           :user_data2, :pointer,
           :sst_string, :pointer,
           :tree_pointers, CellTreePointers.by_value
  end

  # @method worksheet_write_number(worksheet, row, col, number, format)
  # @param [Worksheet] worksheet
  # @param [Integer] row
  # @param [Integer] col
  # @param [Float] number
  # @param [Format] format
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_write_number, :worksheet_write_number, [Worksheet, :uint32, :ushort, :double, Format], :error

  # @method worksheet_write_string(worksheet, row, col, string, format)
  # @param [Worksheet] worksheet
  # @param [Integer] row
  # @param [Integer] col
  # @param [String] string
  # @param [Format] format
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_write_string, :worksheet_write_string, [Worksheet, :uint32, :ushort, :string, Format], :error

  attach_function :worksheet_write_comment, :worksheet_write_comment, [Worksheet, :uint32, :ushort, :string], :error

  # @method worksheet_write_formula(worksheet, row, col, formula, format)
  # @param [Worksheet] worksheet
  # @param [Integer] row
  # @param [Integer] col
  # @param [String] formula
  # @param [Format] format
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_write_formula, :worksheet_write_formula, [Worksheet, :uint32, :ushort, :string, Format], :error

  # @method worksheet_write_array_formula(worksheet, first_row, first_col, last_row, last_col, formula, format)
  # @param [Worksheet] worksheet
  # @param [Integer] first_row
  # @param [Integer] first_col
  # @param [Integer] last_row
  # @param [Integer] last_col
  # @param [String] formula
  # @param [Format] format
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_write_array_formula, :worksheet_write_array_formula, [Worksheet, :uint32, :ushort, :uint, :ushort, :string, Format], :error

  # @method worksheet_write_array_formula_num(worksheet, first_row, first_col, last_row, last_col, formula, format, result)
  # @param [Worksheet] worksheet
  # @param [Integer] first_row
  # @param [Integer] first_col
  # @param [Integer] last_row
  # @param [Integer] last_col
  # @param [String] formula
  # @param [Format] format
  # @param [Float] result
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_write_array_formula_num, :worksheet_write_array_formula_num, [Worksheet, :uint32, :ushort, :uint, :ushort, :string, Format, :double], :error

  # @method worksheet_write_datetime(worksheet, row, col, datetime, format)
  # @param [Worksheet] worksheet
  # @param [Integer] row
  # @param [Integer] col
  # @param [Datetime] datetime
  # @param [Format] format
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_write_datetime, :worksheet_write_datetime, [Worksheet, :uint32, :ushort, Datetime, Format], :error

  # @method worksheet_write_url_opt(worksheet, row_num, col_num, url, format, string, tooltip)
  # @param [Worksheet] worksheet
  # @param [Integer] row_num
  # @param [Integer] col_num
  # @param [String] url
  # @param [Format] format
  # @param [String] string
  # @param [String] tooltip
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_write_url_opt, :worksheet_write_url_opt, [Worksheet, :uint32, :ushort, :string, Format, :string, :string], :error

  # @method worksheet_write_url(worksheet, row, col, url, format)
  # @param [Worksheet] worksheet
  # @param [Integer] row
  # @param [Integer] col
  # @param [String] url
  # @param [Format] format
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_write_url, :worksheet_write_url, [Worksheet, :uint32, :ushort, :string, Format], :error

  # @method worksheet_write_boolean(worksheet, row, col, value, format)
  # @param [Worksheet] worksheet
  # @param [Integer] row
  # @param [Integer] col
  # @param [Integer] value
  # @param [Format] format
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_write_boolean, :worksheet_write_boolean, [Worksheet, :uint32, :ushort, :int, Format], :error

  # @method worksheet_write_blank(worksheet, row, col, format)
  # @param [Worksheet] worksheet
  # @param [Integer] row
  # @param [Integer] col
  # @param [Format] format
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_write_blank, :worksheet_write_blank, [Worksheet, :uint32, :ushort, Format], :error

  # @method worksheet_write_formula_num(worksheet, row, col, formula, format, result)
  # @param [Worksheet] worksheet
  # @param [Integer] row
  # @param [Integer] col
  # @param [String] formula
  # @param [Format] format
  # @param [Float] result
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_write_formula_num, :worksheet_write_formula_num, [Worksheet, :uint32, :ushort, :string, Format, :double], :error

  # @method worksheet_set_row(worksheet, row, height, format)
  # @param [Worksheet] worksheet
  # @param [Integer] row
  # @param [Float] height
  # @param [Format] format
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_set_row, :worksheet_set_row, [Worksheet, :uint32, :double, Format], :error

  # @method worksheet_set_row_opt(worksheet, row, height, format, options)
  # @param [Worksheet] worksheet
  # @param [Integer] row
  # @param [Float] height
  # @param [Format] format
  # @param [RowColOptions] options
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_set_row_opt, :worksheet_set_row_opt, [Worksheet, :uint32, :double, Format, RowColOptions], :error

  # @method worksheet_set_column(worksheet, first_col, last_col, width, format)
  # @param [Worksheet] worksheet
  # @param [Integer] first_col
  # @param [Integer] last_col
  # @param [Float] width
  # @param [Format] format
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_set_column, :worksheet_set_column, [Worksheet, :ushort, :ushort, :double, Format], :error

  # @method worksheet_set_column_opt(worksheet, first_col, last_col, width, format, options)
  # @param [Worksheet] worksheet
  # @param [Integer] first_col
  # @param [Integer] last_col
  # @param [Float] width
  # @param [Format] format
  # @param [RowColOptions] options
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_set_column_opt, :worksheet_set_column_opt, [Worksheet, :ushort, :ushort, :double, Format, RowColOptions], :error

  # @method worksheet_insert_image(worksheet, row, col, filename)
  # @param [Worksheet] worksheet
  # @param [Integer] row
  # @param [Integer] col
  # @param [String] filename
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_insert_image, :worksheet_insert_image, [Worksheet, :uint32, :ushort, :string], :error

  # @method worksheet_insert_image_opt(worksheet, row, col, filename, options)
  # @param [Worksheet] worksheet
  # @param [Integer] row
  # @param [Integer] col
  # @param [String] filename
  # @param [ImageOptions] options
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_insert_image_opt, :worksheet_insert_image_opt, [Worksheet, :uint32, :ushort, :string, ImageOptions], :error

  # @method worksheet_embed_image(worksheet, row, col, filename)
  # @param [Worksheet] worksheet
  # @param [Integer] row
  # @param [Integer] col
  # @param [String] filename
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_embed_image, :worksheet_embed_image, [Worksheet, :uint32, :ushort, :string], :error

  # @method worksheet_embed_image_opt(worksheet, row, col, filename, options)
  # @param [Worksheet] worksheet
  # @param [Integer] row
  # @param [Integer] col
  # @param [String] filename
  # @param [ImageOptions] options
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_embed_image_opt, :worksheet_embed_image_opt, [Worksheet, :uint32, :ushort, :string, ImageOptions], :error

  # @method worksheet_insert_chart(worksheet, row, col, chart)
  # @param [Worksheet] worksheet
  # @param [Integer] row
  # @param [Integer] col
  # @param [Chart] chart
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_insert_chart, :worksheet_insert_chart, [Worksheet, :uint32, :ushort, Chart], :error

  # @method worksheet_insert_chart_opt(worksheet, row, col, chart, user_options)
  # @param [Worksheet] worksheet
  # @param [Integer] row
  # @param [Integer] col
  # @param [Chart] chart
  # @param [ImageOptions] user_options
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_insert_chart_opt, :worksheet_insert_chart_opt, [Worksheet, :uint32, :ushort, Chart, ImageOptions], :error

  # @method worksheet_merge_range(worksheet, first_row, first_col, last_row, last_col, string, format)
  # @param [Worksheet] worksheet
  # @param [Integer] first_row
  # @param [Integer] first_col
  # @param [Integer] last_row
  # @param [Integer] last_col
  # @param [String] string
  # @param [Format] format
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_merge_range, :worksheet_merge_range, [Worksheet, :uint32, :ushort, :uint32, :ushort, :string, Format], :error

  # @method worksheet_autofilter(worksheet, first_row, first_col, last_row, last_col)
  # @param [Worksheet] worksheet
  # @param [Integer] first_row
  # @param [Integer] first_col
  # @param [Integer] last_row
  # @param [Integer] last_col
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_autofilter, :worksheet_autofilter, [Worksheet, :uint, :ushort, :uint, :ushort], :error

  # @method worksheet_activate(worksheet)
  # @param [Worksheet] worksheet
  # @return [nil]
  # @scope class
  attach_function :worksheet_activate, :worksheet_activate, [Worksheet], :void

  # @method worksheet_select(worksheet)
  # @param [Worksheet] worksheet
  # @return [nil]
  # @scope class
  attach_function :worksheet_select, :worksheet_select, [Worksheet], :void

  # @method worksheet_hide(worksheet)
  # @param [Worksheet] worksheet
  # @return [nil]
  # @scope class
  attach_function :worksheet_hide, :worksheet_hide, [Worksheet], :void

  # @method worksheet_set_first_sheet(worksheet)
  # @param [Worksheet] worksheet
  # @return [nil]
  # @scope class
  attach_function :worksheet_set_first_sheet, :worksheet_set_first_sheet, [Worksheet], :void

  # @method worksheet_freeze_panes(worksheet, row, col)
  # @param [Worksheet] worksheet
  # @param [Integer] row
  # @param [Integer] col
  # @return [nil]
  # @scope class
  attach_function :worksheet_freeze_panes, :worksheet_freeze_panes, [Worksheet, :uint, :ushort], :void

  # @method worksheet_split_panes(worksheet, vertical, horizontal)
  # @param [Worksheet] worksheet
  # @param [Float] vertical
  # @param [Float] horizontal
  # @return [nil]
  # @scope class
  attach_function :worksheet_split_panes, :worksheet_split_panes, [Worksheet, :double, :double], :void

  # @method worksheet_freeze_panes_opt(worksheet, first_row, first_col, top_row, left_col, type)
  # @param [Worksheet] worksheet
  # @param [Integer] first_row
  # @param [Integer] first_col
  # @param [Integer] top_row
  # @param [Integer] left_col
  # @param [Integer] type
  # @return [nil]
  # @scope class
  attach_function :worksheet_freeze_panes_opt, :worksheet_freeze_panes_opt, [Worksheet, :uint, :ushort, :uint, :ushort, :uchar], :void

  # @method worksheet_split_panes_opt(worksheet, vertical, horizontal, top_row, left_col)
  # @param [Worksheet] worksheet
  # @param [Float] vertical
  # @param [Float] horizontal
  # @param [Integer] top_row
  # @param [Integer] left_col
  # @return [nil]
  # @scope class
  attach_function :worksheet_split_panes_opt, :worksheet_split_panes_opt, [Worksheet, :double, :double, :uint, :ushort], :void

  # @method worksheet_set_selection(worksheet, first_row, first_col, last_row, last_col)
  # @param [Worksheet] worksheet
  # @param [Integer] first_row
  # @param [Integer] first_col
  # @param [Integer] last_row
  # @param [Integer] last_col
  # @return [nil]
  # @scope class
  attach_function :worksheet_set_selection, :worksheet_set_selection, [Worksheet, :uint, :ushort, :uint, :ushort], :void

  # @method worksheet_set_landscape(worksheet)
  # @param [Worksheet] worksheet
  # @return [nil]
  # @scope class
  attach_function :worksheet_set_landscape, :worksheet_set_landscape, [Worksheet], :void

  # @method worksheet_set_portrait(worksheet)
  # @param [Worksheet] worksheet
  # @return [nil]
  # @scope class
  attach_function :worksheet_set_portrait, :worksheet_set_portrait, [Worksheet], :void

  # @method worksheet_set_page_view(worksheet)
  # @param [Worksheet] worksheet
  # @return [nil]
  # @scope class
  attach_function :worksheet_set_page_view, :worksheet_set_page_view, [Worksheet], :void

  # @method worksheet_set_paper(worksheet, paper_type)
  # @param [Worksheet] worksheet
  # @param [Integer] paper_type
  # @return [nil]
  # @scope class
  attach_function :worksheet_set_paper, :worksheet_set_paper, [Worksheet, :uchar], :void

  # @method worksheet_set_margins(worksheet, left, right, top, bottom)
  # @param [Worksheet] worksheet
  # @param [Float] left
  # @param [Float] right
  # @param [Float] top
  # @param [Float] bottom
  # @return [nil]
  # @scope class
  attach_function :worksheet_set_margins, :worksheet_set_margins, [Worksheet, :double, :double, :double, :double], :void

  # @method worksheet_set_header(worksheet, string)
  # @param [Worksheet] worksheet
  # @param [String] string
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_set_header, :worksheet_set_header, [Worksheet, :string], :error

  # @method worksheet_set_footer(worksheet, string)
  # @param [Worksheet] worksheet
  # @param [String] string
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_set_footer, :worksheet_set_footer, [Worksheet, :string], :error

  # @method worksheet_set_header_opt(worksheet, string, options)
  # @param [Worksheet] worksheet
  # @param [String] string
  # @param [HeaderFooterOptions] options
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_set_header_opt, :worksheet_set_header_opt, [Worksheet, :string, HeaderFooterOptions], :error

  # @method worksheet_set_footer_opt(worksheet, string, options)
  # @param [Worksheet] worksheet
  # @param [String] string
  # @param [HeaderFooterOptions] options
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_set_footer_opt, :worksheet_set_footer_opt, [Worksheet, :string, HeaderFooterOptions], :error

  # @method worksheet_set_h_pagebreaks(worksheet, breaks)
  # @param [Worksheet] worksheet
  # @param [FFI::Pointer(*U_int)] breaks
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_set_h_pagebreaks, :worksheet_set_h_pagebreaks, [Worksheet, :pointer], :error

  # @method worksheet_set_v_pagebreaks(worksheet, breaks)
  # @param [Worksheet] worksheet
  # @param [FFI::Pointer(*U_short)] breaks
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_set_v_pagebreaks, :worksheet_set_v_pagebreaks, [Worksheet, :pointer], :error

  # @method worksheet_print_across(worksheet)
  # @param [Worksheet] worksheet
  # @return [nil]
  # @scope class
  attach_function :worksheet_print_across, :worksheet_print_across, [Worksheet], :void

  # @method worksheet_set_zoom(worksheet, scale)
  # @param [Worksheet] worksheet
  # @param [Integer] scale
  # @return [nil]
  # @scope class
  attach_function :worksheet_set_zoom, :worksheet_set_zoom, [Worksheet, :ushort], :void

  # @method worksheet_gridlines(worksheet, option)
  # @param [Worksheet] worksheet
  # @param [Integer] option
  # @return [nil]
  # @scope class
  attach_function :worksheet_gridlines, :worksheet_gridlines, [Worksheet, :uchar], :void

  # @method worksheet_center_horizontally(worksheet)
  # @param [Worksheet] worksheet
  # @return [nil]
  # @scope class
  attach_function :worksheet_center_horizontally, :worksheet_center_horizontally, [Worksheet], :void

  # @method worksheet_center_vertically(worksheet)
  # @param [Worksheet] worksheet
  # @return [nil]
  # @scope class
  attach_function :worksheet_center_vertically, :worksheet_center_vertically, [Worksheet], :void

  # @method worksheet_print_row_col_headers(worksheet)
  # @param [Worksheet] worksheet
  # @return [nil]
  # @scope class
  attach_function :worksheet_print_row_col_headers, :worksheet_print_row_col_headers, [Worksheet], :void

  # @method worksheet_repeat_rows(worksheet, first_row, last_row)
  # @param [Worksheet] worksheet
  # @param [Integer] first_row
  # @param [Integer] last_row
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_repeat_rows, :worksheet_repeat_rows, [Worksheet, :uint, :uint], :error

  # @method worksheet_repeat_columns(worksheet, first_col, last_col)
  # @param [Worksheet] worksheet
  # @param [Integer] first_col
  # @param [Integer] last_col
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_repeat_columns, :worksheet_repeat_columns, [Worksheet, :ushort, :ushort], :error

  # @method worksheet_print_area(worksheet, first_row, first_col, last_row, last_col)
  # @param [Worksheet] worksheet
  # @param [Integer] first_row
  # @param [Integer] first_col
  # @param [Integer] last_row
  # @param [Integer] last_col
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :worksheet_print_area, :worksheet_print_area, [Worksheet, :uint, :ushort, :uint, :ushort], :error

  # @method worksheet_fit_to_pages(worksheet, width, height)
  # @param [Worksheet] worksheet
  # @param [Integer] width
  # @param [Integer] height
  # @return [nil]
  # @scope class
  attach_function :worksheet_fit_to_pages, :worksheet_fit_to_pages, [Worksheet, :ushort, :ushort], :void

  # @method worksheet_set_start_page(worksheet, start_page)
  # @param [Worksheet] worksheet
  # @param [Integer] start_page
  # @return [nil]
  # @scope class
  attach_function :worksheet_set_start_page, :worksheet_set_start_page, [Worksheet, :ushort], :void

  # @method worksheet_set_print_scale(worksheet, scale)
  # @param [Worksheet] worksheet
  # @param [Integer] scale
  # @return [nil]
  # @scope class
  attach_function :worksheet_set_print_scale, :worksheet_set_print_scale, [Worksheet, :ushort], :void

  # @method worksheet_right_to_left(worksheet)
  # @param [Worksheet] worksheet
  # @return [nil]
  # @scope class
  attach_function :worksheet_right_to_left, :worksheet_right_to_left, [Worksheet], :void

  # @method worksheet_hide_zero(worksheet)
  # @param [Worksheet] worksheet
  # @return [nil]
  # @scope class
  attach_function :worksheet_hide_zero, :worksheet_hide_zero, [Worksheet], :void

  # @method worksheet_set_tab_color(worksheet, color)
  # @param [Worksheet] worksheet
  # @param [Integer] color
  # @return [nil]
  # @scope class
  attach_function :worksheet_set_tab_color, :worksheet_set_tab_color, [Worksheet, :int], :void

  # @method worksheet_protect(worksheet, password, options)
  # @param [Worksheet] worksheet
  # @param [String] password
  # @param [Protection] options
  # @return [nil]
  # @scope class
  attach_function :worksheet_protect, :worksheet_protect, [Worksheet, :string, Protection], :void

  # @method worksheet_set_default_row(worksheet, height, hide_unused_rows)
  # @param [Worksheet] worksheet
  # @param [Float] height
  # @param [Integer] hide_unused_rows
  # @return [nil]
  # @scope class
  attach_function :worksheet_set_default_row, :worksheet_set_default_row, [Worksheet, :double, :uchar], :void

  # @method worksheet_new(init_data)
  # @param [WorksheetInitData] init_data
  # @return [Worksheet]
  # @scope class
  attach_function :worksheet_new, :lxw_worksheet_new, [WorksheetInitData], Worksheet

  # @method worksheet_free(worksheet)
  # @param [Worksheet] worksheet
  # @return [nil]
  # @scope class
  attach_function :worksheet_free, :lxw_worksheet_free, [Worksheet], :void

  # @method worksheet_assemble_xml_file(worksheet)
  # @param [Worksheet] worksheet
  # @return [nil]
  # @scope class
  attach_function :worksheet_assemble_xml_file, :lxw_worksheet_assemble_xml_file, [Worksheet], :void

  # @method worksheet_write_single_row(worksheet)
  # @param [Worksheet] worksheet
  # @return [nil]
  # @scope class
  attach_function :worksheet_write_single_row, :lxw_worksheet_write_single_row, [Worksheet], :void

  # @method worksheet_prepare_image(worksheet, image_ref_id, drawing_id, image_data)
  # @param [Worksheet] worksheet
  # @param [Integer] image_ref_id
  # @param [Integer] drawing_id
  # @param [ImageOptions] image_data
  # @return [nil]
  # @scope class
  attach_function :worksheet_prepare_image, :lxw_worksheet_prepare_image, [Worksheet, :ushort, :ushort, ImageOptions], :void

  # @method worksheet_prepare_chart(worksheet, chart_ref_id, drawing_id, image_data)
  # @param [Worksheet] worksheet
  # @param [Integer] chart_ref_id
  # @param [Integer] drawing_id
  # @param [ImageOptions] image_data
  # @return [nil]
  # @scope class
  attach_function :worksheet_prepare_chart, :lxw_worksheet_prepare_chart, [Worksheet, :ushort, :ushort, ImageOptions], :void

  # @method worksheet_find_row(worksheet, row_num)
  # @param [Worksheet] worksheet
  # @param [Integer] row_num
  # @return [Row]
  # @scope class
  attach_function :worksheet_find_row, :lxw_worksheet_find_row, [Worksheet, :uint32], Row

  # @method worksheet_find_cell(row, col_num)
  # @param [Row] row
  # @param [Integer] col_num
  # @return [Cell]
  # @scope class
  attach_function :worksheet_find_cell, :lxw_worksheet_find_cell, [Row, :ushort], Cell

  attach_function :worksheet_add_table, :worksheet_add_table, [Worksheet, :uint, :ushort, :uint, :ushort, :pointer], :error

  # = Fields:
  # :rbe_left ::
  #   (FFI::Pointer(*WorksheetName))
  # :rbe_right ::
  #   (FFI::Pointer(*WorksheetName))
  # :rbe_parent ::
  #   (FFI::Pointer(*WorksheetName))
  # :rbe_color ::
  #   (Integer)
  class WorksheetNameTreePointers < FFI::Struct
    layout :rbe_left, :pointer,
           :rbe_right, :pointer,
           :rbe_parent, :pointer,
           :rbe_color, :int
  end

  # = Fields:
  # :name ::
  #   (String)
  # :worksheet ::
  #   (Worksheet)
  # :tree_pointers ::
  #   (WorksheetNameTreePointers)
  class WorksheetName < FFI::Struct
    layout :name, :pointer,
           :worksheet, Worksheet,
           :tree_pointers, WorksheetNameTreePointers.by_value
  end

  # = Fields:
  # :rbh_root ::
  #   (FFI::Pointer(*WorksheetName))
  class WorksheetNames < FFI::Struct
    layout :rbh_root, WorksheetName
  end

  # = Fields:
  # :stqh_first ::
  #   (Worksheet)
  # :stqh_last ::
  #   (FFI::Pointer(**Worksheet))
  class Worksheets < FFI::Struct
    layout :stqh_first, Worksheet.ptr,
           :stqh_last, :pointer
  end

  class Sheet < FFI::Struct
    layout :is_chartsheet, :uchar,
           :list_pointers, :pointer
  end

  class Sheets < FFI::Struct
    layout :stqh_first, Sheet.ptr,
           :stqh_last, :pointer
  end
end
