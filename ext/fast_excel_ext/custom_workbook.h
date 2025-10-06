#ifndef CUSTOM_WORKBOOK_H
#define CUSTOM_WORKBOOK_H

#include "xlsxwriter.h"

/* Custom function to get default format (replacement for removed workbook_default_format) */
lxw_format* workbook_default_format(lxw_workbook *workbook);

#endif
