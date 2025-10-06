module Libxlsxwriter
  # = Fields:
  # :constant_memory ::
  #   (Integer) Optimize the workbook to use constant memory for worksheets
  # :tmpdir ::
  #   (String) Directory to use for the temporary files created by libxlsxwriter.
  class WorkbookOptions < FFI::Struct
    layout :constant_memory, :uchar,
           :tmpdir, :string,
           :use_zip64, :uchar,
           :output_buffer, :pointer,
           :output_buffer_size, :pointer
  end

  # = Fields:
  # :file ::
  #   (FFI::Pointer(*FILE))
  # :worksheets ::
  #   (Worksheets)
  # :worksheet_names ::
  #   (WorksheetNames)
  # :charts ::
  #   (Charts)
  # :ordered_charts ::
  #   (Charts)
  # :formats ::
  #   (Formats)
  # :defined_names ::
  #   (DefinedNames)
  # :sst ::
  #   (Sst)
  # :properties ::
  #   (DocProperties)
  # :custom_properties ::
  #   (CustomProperties)
  # :filename ::
  #   (String)
  # :options ::
  #   (WorkbookOptions)
  # :num_sheets ::
  #   (Integer)
  # :first_sheet ::
  #   (Integer)
  # :active_sheet ::
  #   (Integer)
  # :num_xf_formats ::
  #   (Integer)
  # :num_format_count ::
  #   (Integer)
  # :drawing_count ::
  #   (Integer)
  # :font_count ::
  #   (Integer)
  # :border_count ::
  #   (Integer)
  # :fill_count ::
  #   (Integer)
  # :optimize ::
  #   (Integer)
  # :has_png ::
  #   (Integer)
  # :has_jpeg ::
  #   (Integer)
  # :has_bmp ::
  #   (Integer)
  # :used_xf_formats ::
  #   (HashTable)
  module WorkbookWrappers
    # @param [String] sheetname
    # @return [Worksheet]
    def add_worksheet(sheetname)
      Worksheet.new Libxlsxwriter.workbook_add_worksheet(self, sheetname)
    end

    # @return [Format]
    def add_format()
      Format.new Libxlsxwriter.workbook_add_format(self)
    end

    def default_format()
      Format.new Libxlsxwriter.workbook_default_format(self)
    end

    # @param [Integer] chart_type
    # @return [Chart]
    def add_chart(chart_type)
      Chart.new Libxlsxwriter.workbook_add_chart(self, chart_type)
    end

    # @return [Symbol from _enum_error_]
    def close()
      Libxlsxwriter.workbook_close(self)
    end

    # @param [DocProperties] properties
    # @return [Symbol from _enum_error_]
    def set_properties(properties)
      Libxlsxwriter.workbook_set_properties(self, properties)
    end

    # @param [String] name
    # @param [String] value
    # @return [Symbol from _enum_error_]
    def set_custom_property_string(name, value)
      Libxlsxwriter.workbook_set_custom_property_string(self, name, value)
    end

    # @param [String] name
    # @param [Float] value
    # @return [Symbol from _enum_error_]
    def set_custom_property_number(name, value)
      Libxlsxwriter.workbook_set_custom_property_number(self, name, value)
    end

    # @param [String] name
    # @param [Integer] value
    # @return [Symbol from _enum_error_]
    def set_custom_property_integer(name, value)
      Libxlsxwriter.workbook_set_custom_property_integer(self, name, value)
    end

    # @param [String] name
    # @param [Integer] value
    # @return [Symbol from _enum_error_]
    def set_custom_property_boolean(name, value)
      Libxlsxwriter.workbook_set_custom_property_boolean(self, name, value)
    end

    # @param [String] name
    # @param [Datetime] datetime
    # @return [Symbol from _enum_error_]
    def set_custom_property_datetime(name, datetime)
      Libxlsxwriter.workbook_set_custom_property_datetime(self, name, datetime)
    end

    # @param [String] name
    # @param [String] formula
    # @return [Symbol from _enum_error_]
    def define_name(name, formula)
      Libxlsxwriter.workbook_define_name(self, name, formula)
    end

    # @param [String] name
    # @return [Worksheet]
    def get_worksheet_by_name(name)
      Worksheet.new Libxlsxwriter.workbook_get_worksheet_by_name(self, name)
    end

    # @param [String] sheetname
    # @return [Symbol from _enum_error_]
    def validate_worksheet_name(sheetname)
      Libxlsxwriter.workbook_validate_sheet_name(self, sheetname)
    end

    # @return [nil]
    def free()
      Libxlsxwriter.workbook_free(self)
    end

    # @return [nil]
    def assemble_xml_file()
      Libxlsxwriter.workbook_assemble_xml_file(self)
    end

    # @return [nil]
    def set_default_xf_indices()
      Libxlsxwriter.workbook_set_default_xf_indices(self)
    end
  end

  class Workbook < FFI::Struct
    include WorkbookWrappers
    layout :file, :pointer,
           :sheets, Sheets.ptr,
           :worksheets, Worksheets.ptr,
           :chartsheets, :pointer,
           :worksheet_names, WorksheetNames.ptr,
           :chartsheet_names, :pointer,
           :image_md5s, :pointer,
           :embedded_image_md5s, :pointer,
           :header_image_md5s, :pointer,
           :background_md5s, :pointer,
           :charts, Charts.ptr,
           :ordered_charts, Charts.ptr,
           :formats, Formats.ptr,
           :defined_names, DefinedNames.ptr,
           :sst, Sst.ptr,
           :properties, DocProperties.ptr,
           :custom_properties, CustomProperties.ptr,
           :filename, :string,
           :options, WorkbookOptions.by_value,

           :num_sheets,       :uint16,
           :num_worksheets,   :uint16,
           :num_chartsheets,  :uint16,
           :first_sheet,      :uint16,
           :active_sheet,     :uint16,
           :num_xf_formats,   :uint16,
           :num_dxf_formats,  :uint16,
           :num_format_count, :uint16,
           :drawing_count,    :uint16,
           :comment_count,    :uint16,
           :num_embedded_images, :uint32,
           :window_width,    :uint16,
           :window_height,   :uint16,

           :font_count,     :uint16,
           :border_count,   :uint16,
           :fill_count,     :uint16,
           :optimize,       :uchar,
           :max_url_length, :uint16,
           :read_only,      :uchar,

           :has_png,  :uchar,
           :has_jpeg, :uchar,
           :has_bmp,  :uchar,
           :has_gif, :uchar,
           :has_vml, :uchar,
           :has_comments, :uchar,
           :has_metadata, :uchar,
           :has_embedded_images, :uchar,
           :has_dynamic_functions, :uchar,
           :has_embedded_image_descriptions, :uchar,

           :used_xf_formats, :pointer,
           :used_dxf_formats, :pointer,

           :vba_project, :string,
           :vba_project_signature, :string,
           :vba_codename, :string,

           :use_1904_epoch, :uint8,

           :default_url_format, :pointer
  end

  attach_function :workbook_default_format, :workbook_default_format, [Workbook], Format

  # @method workbook_new(filename)
  # @param [String] filename
  # @return [Workbook]
  # @scope class
  attach_function :workbook_new, :workbook_new, [:string], Workbook

  # @method workbook_new_opt(filename, options)
  # @param [String] filename
  # @param [WorkbookOptions] options
  # @return [Workbook]
  # @scope class
  attach_function :workbook_new_opt, :workbook_new_opt, [:string, WorkbookOptions], Workbook

  # @method new_workbook(filename)
  # @param [String] filename
  # @return [Workbook]
  # @scope class
  attach_function :new_workbook, :new_workbook, [:string], Workbook

  # @method new_workbook_opt(filename, options)
  # @param [String] filename
  # @param [WorkbookOptions] options
  # @return [Workbook]
  # @scope class
  attach_function :new_workbook_opt, :new_workbook_opt, [:string, WorkbookOptions], Workbook

  # @method workbook_add_worksheet(workbook, sheetname)
  # @param [Workbook] workbook
  # @param [String] sheetname
  # @return [Worksheet]
  # @scope class
  attach_function :workbook_add_worksheet, :workbook_add_worksheet, [Workbook, :string], Worksheet

  # @method workbook_add_format(workbook)
  # @param [Workbook] workbook
  # @return [Format]
  # @scope class
  attach_function :workbook_add_format, :workbook_add_format, [Workbook], Format

  # @method workbook_add_chart(workbook, chart_type)
  # @param [Workbook] workbook
  # @param [Integer] chart_type
  # @return [Chart]
  # @scope class
  attach_function :workbook_add_chart, :workbook_add_chart, [Workbook, :uchar], Chart

  # @method workbook_close(workbook)
  # @param [Workbook] workbook
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :workbook_close, :workbook_close, [Workbook], :error

  # @method workbook_set_properties(workbook, properties)
  # @param [Workbook] workbook
  # @param [DocProperties] properties
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :workbook_set_properties, :workbook_set_properties, [Workbook, DocProperties], :error

  # @method workbook_set_custom_property_string(workbook, name, value)
  # @param [Workbook] workbook
  # @param [String] name
  # @param [String] value
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :workbook_set_custom_property_string, :workbook_set_custom_property_string, [Workbook, :string, :string], :error

  # @method workbook_set_custom_property_number(workbook, name, value)
  # @param [Workbook] workbook
  # @param [String] name
  # @param [Float] value
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :workbook_set_custom_property_number, :workbook_set_custom_property_number, [Workbook, :string, :double], :error

  # @method workbook_set_custom_property_integer(workbook, name, value)
  # @param [Workbook] workbook
  # @param [String] name
  # @param [Integer] value
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :workbook_set_custom_property_integer, :workbook_set_custom_property_integer, [Workbook, :string, :int], :error

  # @method workbook_set_custom_property_boolean(workbook, name, value)
  # @param [Workbook] workbook
  # @param [String] name
  # @param [Integer] value
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :workbook_set_custom_property_boolean, :workbook_set_custom_property_boolean, [Workbook, :string, :uchar], :error

  # @method workbook_set_custom_property_datetime(workbook, name, datetime)
  # @param [Workbook] workbook
  # @param [String] name
  # @param [Datetime] datetime
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :workbook_set_custom_property_datetime, :workbook_set_custom_property_datetime, [Workbook, :string, Datetime], :error

  # @method workbook_define_name(workbook, name, formula)
  # @param [Workbook] workbook
  # @param [String] name
  # @param [String] formula
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :workbook_define_name, :workbook_define_name, [Workbook, :string, :string], :error

  # @method workbook_get_worksheet_by_name(workbook, name)
  # @param [Workbook] workbook
  # @param [String] name
  # @return [Worksheet]
  # @scope class
  attach_function :workbook_get_worksheet_by_name, :workbook_get_worksheet_by_name, [Workbook, :string], Worksheet

  # @method workbook_validate_sheet_name(workbook, sheetname)
  # @param [Workbook] workbook
  # @param [String] sheetname
  # @return [Symbol from _enum_error_]
  # @scope class
  attach_function :workbook_validate_sheet_name, :workbook_validate_sheet_name, [Workbook, :string], :error

  # @method workbook_free(workbook)
  # @param [Workbook] workbook
  # @return [nil]
  # @scope class
  attach_function :workbook_free, :lxw_workbook_free, [Workbook], :void

  # @method workbook_assemble_xml_file(workbook)
  # @param [Workbook] workbook
  # @return [nil]
  # @scope class
  attach_function :workbook_assemble_xml_file, :lxw_workbook_assemble_xml_file, [Workbook], :void

  # @method workbook_set_default_xf_indices(workbook)
  # @param [Workbook] workbook
  # @return [nil]
  # @scope class
  attach_function :workbook_set_default_xf_indices, :lxw_workbook_set_default_xf_indices, [Workbook], :void
end
