#include "custom_workbook.h"

/*
 * Returns default format for workbook.
 */
lxw_format *
workbook_default_format(lxw_workbook *self)
{
    return STAILQ_FIRST(self->formats);
}
