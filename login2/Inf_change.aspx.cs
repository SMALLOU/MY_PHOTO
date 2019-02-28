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
    public partial class Inf_change : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                username.Text = (string)Session["Admin_User"];
                SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\web-project\login2\login2\App_Data\userData.mdf;Integrated Security=True;Connect Timeout=30");
                try
                {
                    conn.Open();                                          //尝试打开连接
                    SqlCommand cmd = new SqlCommand("select count(*) from [Table] where 用户名=@user", conn);
                    cmd.Parameters.Add("@user", SqlDbType.NChar);
                    cmd.Parameters["@user"].Value = username.Text;
                    int count = (int)cmd.ExecuteScalar();
                    if (count == 0)
                    {
                        username.Text = sex.Text = hometwon.Text = email.Text = phone.Text = ability.Text = hobby.Text = "未知";
                        photo.ImageUrl = "";
                        birth.Text = text.Text = "未知";
                    }
                    else
                    {
                        cmd = new SqlCommand("select * from [Table] where 用户名='" + username.Text + "'", conn);
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                if (dr[2].ToString() == "男")
                                    sex.SelectedIndex = 0;
                                else
                                    sex.SelectedIndex = 1;
                                hometwon.Text = dr[3].ToString();
                                email.Text = dr[4].ToString();
                                phone.Text = dr[5].ToString();
                                ability.Text = dr[6].ToString();
                                hobby.Text = dr[7].ToString();
                                photo.ImageUrl = dr[8].ToString();
                                birth.Text = dr[9].ToString();
                                text.Text = dr[10].ToString();
                            }
                        }
                    }

                }
                catch (Exception ee)
                {
                    Response.Write(ee.ToString());
                }
                finally
                {
                    conn.Close();                                      //关闭连接
                }
            }
            
        }

        protected void button1_Click(object sender, EventArgs e)
        {
            string saveDir = @"\images\";  //指定的文件夹要存在
            string appPath = Request.PhysicalApplicationPath;
            if (Uload.HasFile)
            {
                string savePath = appPath + saveDir + Uload.FileName;
                Uload.SaveAs(savePath);
                photo.ImageUrl = "~/images/" + Uload.FileName;
                Response.Write("上传成功！");
            }
            else
                Response.Write("上传失败！");
            if (email.Text != "")
            {
                email.Attributes["Value"] = email.Text;
                email.CssClass = "normal";
            }
            if (phone.Text != "")
            {
                phone.Attributes["Value"] = phone.Text;
                phone.CssClass = "normal";
            }
            if (hobby.Text != "")
            {
                hobby.Attributes["Value"] = hobby.Text;
            }
            if (birth.Text != "")
            {
                birth.Attributes["Value"] = birth.Text;
            }
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Update();
            Response.Redirect("In_f.aspx");
        }

        protected void Birthday_SelectionChanged(object sender, EventArgs e)
        {
            birth.Text = Birthday.SelectedDate.ToShortDateString();
        }
    }
}