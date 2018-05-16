using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDCIDWebService;

public partial class preview_dotnet_index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
 
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        var userName = Request.Form["user_name"];
        var password = Request.Form["password"];
        var language = Request.Form["language"];
        Session["language"] = language; //Get Using (string)(Session["language"])

        TDWebService serv = new TDWebService();
        String result = serv.AuthenticateUser(userName, password);
        if (result != null)
        {
            Session["token"] = result; //Get Using (string)(Session["token"])
            Response.Redirect("~/detailPage.aspx");
        }
        else
        {
            
            Label ErrorMessage = this.FindControl("ErrorMessage") as Label;
            ErrorMessage.Visible = true;
            ErrorMessage.Text = "Invalid Username/password";
        }
        
    }
}