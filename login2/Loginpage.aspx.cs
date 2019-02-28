using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace login2
{
    public partial class Loginpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("loginWebForm1.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(IsValid)
            {
                Session["Admin_User"] = username.Text;
                Response.Redirect("Index.aspx");
            }
            
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\web-project\login2\login2\App_Data\userData.mdf;Integrated Security=True;Connect Timeout=30");
            try
            {
                conn.Open();       //尝试打开数据库连接，判断用户名密码是否通过验证
                SqlCommand cmd = new SqlCommand("select count(*) from [Table] where 用户名=@user and 密码=@psw", conn);
                cmd.Parameters.Add("@user", SqlDbType.NChar);
                cmd.Parameters.Add("@psw", SqlDbType.NVarChar);
                cmd.Parameters["@user"].Value = username.Text;   
                cmd.Parameters["@psw"].Value = psw.Text;
                int count = (int)cmd.ExecuteScalar();
                if (count == 0)
                {
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                }
                    
            }
            catch
            {
                Response.Write("error!");
                args.IsValid = false;
            }
            finally
            {
                conn.Close();                                      //关闭连接
            }
        }
    }
}