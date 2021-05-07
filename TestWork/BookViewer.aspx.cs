using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestWork
{
    public partial class BookViewer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            string bookid = GridView1.SelectedDataKey.Value.ToString();
            string s = GridView1.SelectedDataKey.Values.ToString();

            Response.Redirect("book.aspx?id=" + bookid);


        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("book.aspx?id=" + 0);
        }
    }
}