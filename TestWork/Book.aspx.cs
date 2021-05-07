using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace TestWork
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        bool wasBDError = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            int a = 1;
            LabelException.Text = "";

            DataSourceSelectArguments dssa = new DataSourceSelectArguments();

            DataView dv =  (DataView)SqlDataSource1.Select(dssa);

            if (dv.Count > 0 && TextBoxID.Text == "")
            {
                DataRowView dr = dv[0];

                TextBoxID.Text = dr["id"].ToString();
                TextBoxName.Text = dr["name"].ToString();
                TextBoxAuthor.Text = dr["author"].ToString();
                //"2002-01-01"
                TextBoxYear.Text = DateTime.Parse( dr["year"].ToString()).ToString("yyyy-MM-dd");
                TextBoxContents.Text = dr["contents"].ToString();

            }

            string strParams = this.ClientQueryString;
            if (strParams.Contains("id=0"))
                LabelAction.Text = "Добавление";

            //XmlDocument xdoc = new XmlDocument();

            //xdoc.LoadXml(TextBoxContents.Text);


        }


        protected void SaveButton_Click(object sender, EventArgs e)
        {
            wasBDError = false;
            LabelException.Text = "";
            string name = "", author = "", year = "01.01.0001", contents = "";

            int id = int.Parse(TextBoxID.Text);
            BookStruct bookStruct = SelectBook(id, name, author, year, contents);

            name = TextBoxName.Text;
            author = TextBoxAuthor.Text;
            year = TextBoxYear.Text;
            contents = TextBoxContents.Text;

            if (bookStruct.id != 0)
                UpdateBook(id, name, author, year, contents);
            else
                InsertBook(id, name, author, year, contents);

            if(!wasBDError)
                Response.Redirect("BookViewer.aspx?");


        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            wasBDError = false;

            int id = int.Parse(TextBoxID.Text);

            string name = "", author = "", year = "01.01.0001", contents = "";
            BookStruct bookStruct = SelectBook(id, name, author, year, contents);


            if (bookStruct.id != 0)
            {
                DeleteBook(id);
                if(!wasBDError)
                    Response.Redirect("BookViewer.aspx?");
            }


        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            wasBDError = false;

            Response.Redirect("BookViewer.aspx?");
        }


        private void InsertBook(int id, string name, string author, string year, string contents)
        {
            using (SqlConnection con = new SqlConnection(SqlDataSource1.ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("InsertBook", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;
                    cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = name;
                    cmd.Parameters.Add("@author", SqlDbType.VarChar).Value = author;
                    cmd.Parameters.Add("@year", SqlDbType.Date).Value = year;
                    cmd.Parameters.Add("@contents", SqlDbType.Xml).Value = contents;

                    con.Open();

                    try
                    {

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {

                        }

                    }
                    catch(Exception e) { SetErrorState(e); }
                }
            }
        }

        private void SetErrorState(Exception e)
        {
            LabelException.Text = e.Message; wasBDError = true;
        }

        private void UpdateBook(int id, string name, string author, string year, string contents)
        {
            using (SqlConnection con = new SqlConnection(SqlDataSource1.ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("UpdateBook", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;
                    cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = name;
                    cmd.Parameters.Add("@author", SqlDbType.VarChar).Value = author;
                    cmd.Parameters.Add("@year", SqlDbType.Date).Value = year;
                    cmd.Parameters.Add("@contents", SqlDbType.Xml).Value = contents;

                    con.Open();
                    try
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {

                        }
                    }catch (Exception e) { SetErrorState(e); }
                }
            }
        }

        private BookStruct SelectBook(int id, string name, string author, string year, string contents)
        {
            BookStruct bookStruct;
            bookStruct = new BookStruct();

            using (SqlConnection con = new SqlConnection(SqlDataSource1.ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SelectBook", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    //cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;


                    SqlParameter idParam = cmd.Parameters.Add("@id", SqlDbType.Int);
                    idParam.Value = id;

                    SqlParameter idParamReturn = cmd.Parameters.Add("@idRet", SqlDbType.Int);
                    idParamReturn.Direction = ParameterDirection.Output;
                    idParamReturn.Value = name;

                    SqlParameter nameParam = cmd.Parameters.Add("@name", SqlDbType.VarChar, 255);
                    nameParam.Direction = ParameterDirection.Output;
                    nameParam.Value = name;

                    SqlParameter authorParam = cmd.Parameters.Add("@author", SqlDbType.VarChar, 255);
                    authorParam.Direction = ParameterDirection.Output;
                    authorParam.Value = author;

                    SqlParameter yearParam = cmd.Parameters.Add("@year", SqlDbType.Date);
                    yearParam.Direction = ParameterDirection.Output;
                    yearParam.Value = year;

                    SqlParameter contentsParam = cmd.Parameters.Add("@contents", SqlDbType.Xml);
                    contentsParam.Direction = ParameterDirection.Output;
                    contentsParam.Value = contents;


                    con.Open();
                    try
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {

                            name = nameParam.Value.ToString();
                            author = authorParam.Value.ToString();
                            year = yearParam.Value.ToString();
                            contents = contentsParam.Value.ToString();

                            if (idParamReturn.Value != DBNull.Value)
                                bookStruct = new BookStruct(id, name, author, year, contents);

                            if (reader.HasRows)
                            {
                                if (reader.Read())
                                {
                                    //more code
                                }
                            }
                        }
                    }
                    catch (Exception e) { SetErrorState(e); }
                }
            }

            return bookStruct;
        }

        private void DeleteBook(int id)
        {
            using (SqlConnection con = new SqlConnection(SqlDataSource1.ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("DeleteBook", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;


                    con.Open();

                    try
                    {

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {

                        }

                    }
                    catch (Exception e) { SetErrorState(e); }
                }
            }
        }





        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }


        struct BookStruct
        {
            public int id;
            public string name, author, year, content;

            public BookStruct(int id, string name, string author, string year, string content)
            {
                this.id = id;
                this.name = name;
                this.author = author;
                this.year = year;
                this.content = content;
            }
        }


    }
}