using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace login2
{
    public partial class loginWebForm1 : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Birthday_SelectionChanged(object sender, EventArgs e)
        {
            birth.Text = Birthday.SelectedDate.ToShortDateString();
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
            if(psw1.Text!="")
            {
                psw1.Attributes["Value"]=psw1.Text;
            }
            if (psw2.Text != "")
            {
                psw2.Attributes["Value"] = psw1.Text;
            }
            if (email.Text != "")
            {
                email.Attributes["Value"] = psw1.Text;
                email.CssClass = "normal";
            }
            if (phone.Text != "")
            {
                phone.Attributes["Value"] = psw1.Text;
                phone.CssClass = "normal";
            }
        }

        protected void province_SelectedIndexChanged(object sender, EventArgs e)
        {
            city.Items.Clear();
            int x = province.SelectedIndex;
            city.Items.Add("请选择");
            switch (x)
            {
                case 0: break;
                case 1: city.Items.Add("北京"); city.Items.Add("上海"); break;
                case 2: city.Items.Add("广州"); city.Items.Add("中山"); break;
                case 3: city.Items.Add("成都");  break;
                case 4: city.Items.Add("杭州"); city.Items.Add("金华"); break;
                case 5: city.Items.Add("武汉"); city.Items.Add("十堰"); break;
            }
          
        }

        protected void Unnamed10_Click(object sender, EventArgs e)
        {

                Session["username1"] = username.Text;
                Session["psw1"] = psw1.Text;
                Session["sex1"] = sex.SelectedItem.Text;
                Session["province1"] = province.SelectedItem.Value;
                Session["city1"] = city.SelectedItem.Value;
                Session["email1"] = email.Text;
                Session["phone1"] = phone.Text;
                Session["htn1"] = Session["province1"] + "省" + Session["city1"] + "市";
                string a = "";
                for (int i = 0; i < ability.Items.Count; i++)
                {
                    if (ability.Items[i].Selected)
                        a += ability.Items[i].Text + ",";
                }
                //if (a.Length > 0)
                // a.Substring(0, a.Length - 1);
                Session["ability1"] = a.Substring(0, a.Length - 1);

                String h = "";
                for (int i = 0; i < hobby.Items.Count; i++)
                {
                    if (hobby.Items[i].Selected)
                        h += hobby.Items[i].Text + ",";
                }
                // if (h.Length > 0)

                Session["hobby1"] = h.Substring(0, h.Length - 1);

                Session["photo1"] = photo.ImageUrl;

                Session["birth1"] = birth.Text;
                Session["text1"] = text.Text;
                Response.Redirect("In_f.aspx");
            
            
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\web-project\login2\login2\App_Data\userData.mdf;Integrated Security=True;Connect Timeout=30");
            try
            {
                con.Open();                                          //尝试打开连接
                SqlCommand cmd = new SqlCommand("select count(*) from [Table] where 用户名=@user", con);
                cmd.Parameters.Add("@user", SqlDbType.NChar);
                cmd.Parameters["@user"].Value = username.Text;
                int count = (int)cmd.ExecuteScalar();
                if(count>0)
                    args.IsValid = false;
                else
                    args.IsValid = true;
                //Response.Write(count);
            }
            catch
            {
                Response.Write("error!");
                args.IsValid = false;
            }
            finally
            {
                con.Close();                                      //关闭连接
            }
            
        }

        
    }
}