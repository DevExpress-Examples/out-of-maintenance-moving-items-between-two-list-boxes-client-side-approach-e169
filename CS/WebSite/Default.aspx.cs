using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class MakeItemVisible : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        object[] options = new object[lbOptions.Items.Count];
        for(int i = 0; i < lbOptions.Items.Count; i++)
            options[i] = lbOptions.Items[i].Value;
        hiddenField["options"] = options;
    }
}
