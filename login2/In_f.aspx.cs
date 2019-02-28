using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace login2
{
    public partial class In_f : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //如果注册页面跳转过来表示注册成功，将新用户数据通过Session导入数据库
            if ((Session["Admin_User"] == null || Session["Admin_User"].ToString() == "")&& Session["username1"]!=null)
            {
                Session["Admin_User"]= (string)Session["username1"];
                username.Text = (string)Session["username1"];
                sex.Text = (string)Session["sex1"];
                hometwon.Text = (string)Session["province1"] + "省 " + (string)Session["city1"] + "市";
                email.Text = (string)Session["email1"];
                phone.Text = (string)Session["phone1"];
                ability.Text = (string)Session["ability1"];
                hobby.Text = (string)Session["hobby1"];
                photo.ImageUrl = (string)Session["photo1"];
                birth.Text = (string)Session["birth1"];
                text.Text = (string)Session["text1"];
                SqlDataSource1.Insert();
                string sql = "insert into sex values(N'" + Session["sex1"] + "')";
            }
            else //从登入界面跳转过来则通过Session["Admin_User"]中保存的登入用户名
            {    //读取数据库中该用户信息
                username.Text = (string)Session["Admin_User"];
                //数据库连接
                SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\web-project\login2\login2\App_Data\userData.mdf;Integrated Security=True;Connect Timeout=30");
                try
                {
                    conn.Open();                                          //尝试打开连接
                    //查询该用户名在数据库中是否存在
                    SqlCommand cmd = new SqlCommand("select count(*) from [Table] where 用户名=@user", conn);
                    cmd.Parameters.Add("@user", SqlDbType.NChar);
                    cmd.Parameters["@user"].Value = username.Text;
                    int count = (int)cmd.ExecuteScalar();
                    if (count == 0)
                    {   //错误跳转不存在用户信息填充未知
                        username.Text = sex.Text = hometwon.Text = email.Text = phone.Text = ability.Text = hobby.Text = "未知";
                        photo.ImageUrl = "";
                        birth.Text = text.Text = "未知";
                    }
                    else
                    {   //用户名存在读取用户信息
                        cmd = new SqlCommand("select * from [Table] where 用户名='"+username.Text+"'", conn);
                        SqlDataReader dr = cmd.ExecuteReader();
                        if(dr.HasRows)
                        {
                            while (dr.Read())
                            {   //把数据库中读出的用户信息填入对应的Label标签中
                                sex.Text = dr[2].ToString();
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

        protected void Inf_Change_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inf_change.aspx");
        }
    }
}
