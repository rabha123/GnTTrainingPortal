using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GnTAMRDashboard.SecurityManager
{
    public class DAL
    {
        public List<object> getSelectedValues(DevExpress.Web.ASPxGridView.ASPxGridView gv)
        {
            List<object> row = new List<object>();
            List<string> fieldNames = new List<string>();
            foreach (var column in gv.Columns)
            {
                if ((column as GridViewColumn) is GridViewDataColumn)
                {
                    fieldNames.Add((column as GridViewDataColumn).FieldName);
                }
            }

            row = gv.GetSelectedFieldValues(fieldNames.ToArray());
            return row;

        }

    }
}