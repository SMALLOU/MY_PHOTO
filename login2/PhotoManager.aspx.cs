using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace login2
{
    public partial class PhotoManager : System.Web.UI.Page
    {
        public void DeleteDiskFile(string ImageUrl)
        {
            try
            {
                string FilePath = Server.MapPath(ImageUrl);//转换物理路径
                File.Delete(FilePath);//执行IO文件删除,需引入命名空间System.IO;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //if(!IsPostBack)
            //{
                string s1 = (string)Session["Admin_User"];
                int flag = 0;
                bt.Visible = bt1.Visible = bt2.Visible = bt3.Visible = bt4.Visible = bt5.Visible = bt6.Visible = bt7.Visible = bt8.Visible = bt9.Visible = bt10.Visible = bt11.Visible = bt12.Visible = bt13.Visible = bt14.Visible = false;
                photoName.Visible = TextBox1.Visible = TextBox2.Visible = TextBox3.Visible = TextBox4.Visible = TextBox5.Visible = TextBox6.Visible = TextBox7.Visible = TextBox8.Visible = TextBox9.Visible = TextBox10.Visible = TextBox11.Visible = TextBox12.Visible = TextBox13.Visible = TextBox14.Visible = false;
                img1.Visible = img2.Visible = img3.Visible = img4.Visible = img5.Visible = img6.Visible = img7.Visible = img8.Visible = img9.Visible = img10.Visible = false;
                img11.Visible = img12.Visible = img13.Visible = img14.Visible = img15.Visible = false;
                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    if (s1 == GridView1.Rows[i].Cells[2].Text.Trim())
                    {
                        flag = 1;
                        //Ph_Display.Text += "<img src=\"" + GridView1.Rows[i].Cells[4].Text.Trim()+"\" />"+"haha"+ GridView1.Rows[i].Cells[4].Text.Trim();
                        //if (i % 5 == 0)
                        //    Ph_Display.Text += "<br/>";
                        if (i % 15 == 0)
                        {
                            //zoomImage.MakeZoomImage(GridView1.Rows[i].Cells[4].Text.Trim(), GridView1.Rows[i].Cells[4].Text.Trim().ToString() + "small", 120, 120, "HW");
                            img11.Visible = img12.Visible = img13.Visible = img14.Visible = img15.Visible = false;
                            img2.Visible = img3.Visible = img4.Visible = img5.Visible = img6.Visible = img7.Visible = img8.Visible = img9.Visible = img10.Visible = false;
                            img1.Visible = true;
                            photoName.Text = GridView1.Rows[i].Cells[0].Text.Trim();
                            img1.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                        }
                        if (i % 15 == 1)
                        {
                            TextBox1.Text = GridView1.Rows[i].Cells[0].Text.Trim();
                            img2.Visible = true;
                            img2.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                        }
                        if (i % 15 == 2)
                        {
                            TextBox2.Text = GridView1.Rows[i].Cells[0].Text.Trim();
                            img3.Visible = true;
                            img3.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                        }
                        if (i % 15 == 3)
                        {
                            TextBox3.Text = GridView1.Rows[i].Cells[0].Text.Trim();
                            img4.Visible = true;
                            img4.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                        }
                        if (i % 15 == 4)
                        {
                            TextBox4.Text = GridView1.Rows[i].Cells[0].Text.Trim();
                            img5.Visible = true;
                            img5.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                        }
                        if (i % 15 == 5)
                        {
                            TextBox5.Text = GridView1.Rows[i].Cells[0].Text.Trim();
                            img6.Visible = true;
                            img6.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                        }
                        if (i % 15 == 6)
                        {
                            TextBox6.Text = GridView1.Rows[i].Cells[0].Text.Trim();
                            img7.Visible = true;
                            img7.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                        }
                        if (i % 15 == 7)
                        {
                            TextBox7.Text = GridView1.Rows[i].Cells[0].Text.Trim();
                            img8.Visible = true;
                            img8.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                        }
                        if (i % 15 == 8)
                        {
                            TextBox8.Text = GridView1.Rows[i].Cells[0].Text.Trim();
                            img9.Visible = true;
                            img9.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                        }
                        if (i % 15 == 9)
                        {
                            TextBox9.Text = GridView1.Rows[i].Cells[0].Text.Trim();
                            img10.Visible = true;
                            img10.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                        }
                        if (i % 15 == 10)
                        {
                            TextBox10.Text = GridView1.Rows[i].Cells[0].Text.Trim();
                            img11.Visible = true;
                            img11.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                        }
                        if (i % 15 == 11)
                        {
                            TextBox11.Text = GridView1.Rows[i].Cells[0].Text.Trim();
                            img12.Visible = true;
                            img12.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                        }
                        if (i % 15 == 12)
                        {
                            TextBox12.Text = GridView1.Rows[i].Cells[0].Text.Trim();
                            img13.Visible = true;
                            img13.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                        }
                        if (i % 15 == 13)
                        {
                            TextBox13.Text = GridView1.Rows[i].Cells[0].Text.Trim();
                            img14.Visible = true;
                            img14.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                        }
                        if (i % 15 == 14)
                        {
                            TextBox14.Text = GridView1.Rows[i].Cells[0].Text.Trim();
                            img15.Visible = true;
                            img15.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                        }
                    }

                }
                if (flag == 0)
                {
                    Ph_Display.Text = "您还未上传照片！";
                    Manage.Enabled = false;
                }
                else
                {
                    Manage.Enabled = true;
                }
           // }
            
            //SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\web-project\login2\login2\App_Data\userData.mdf;Integrated Security=True;Connect Timeout=30");
            //try
            //{
            //    con.Open();    
            //    //尝试打开连接

            //    SqlCommand cmd = new SqlCommand("select count(*) from [Photos] where USER='" + Session["Admin_User"].ToString() + "'", con);
            //    int count = (int)cmd.ExecuteScalar();
            //    if(count == 0)
            //    {
            //        Ph_Display.Text = "您还未上传照片！";
            //        Manage.Enabled = false;
            //    }
            //    else
            //    {
            //        Ph_Display.Text = "照片！";
            //        Manage.Enabled = true;
            //    }
            //}
            //catch
            //{
            //    Response.Write("error!");
            //}
            //finally
            //{
            //    con.Close();                                      //关闭连接
            //}
        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {
            Response.Redirect("PhotoUpload.aspx");
        }

        protected void Manage_Click(object sender, EventArgs e)
        {
            if(img1.Visible == true)
            {
                bt.Visible = true;
                photoName.Visible = true;
                
            }
            if (img2.Visible == true)
            {
                bt1.Visible = true;
                TextBox1.Visible = true;
            }
            if (img3.Visible == true)
            {
                bt2.Visible = true;
                TextBox2.Visible = true;
            }
            if (img4.Visible == true)
            {
                bt3.Visible = true;
                TextBox3.Visible = true;
            }
            if (img5.Visible == true)
            {
                bt4.Visible = true;
                TextBox4.Visible = true;
            }
            if (img6.Visible == true)
            {
                bt5.Visible = true;
                TextBox5.Visible = true;
            }
            if (img7.Visible == true)
            {
                bt6.Visible = true;
                TextBox6.Visible = true;
            }
            if (img8.Visible == true)
            {
                bt7.Visible = true;
                TextBox7.Visible = true;
            }
            if (img9.Visible == true)
            {
                bt8.Visible = true;
                TextBox8.Visible = true;
            }
            if (img10.Visible == true)
            {
                bt9.Visible = true;
                TextBox9.Visible = true;
            }
            if (img11.Visible == true)
            {
                bt10.Visible = true;
                TextBox10.Visible = true;
            }
            if (img12.Visible == true)
            {
                bt11.Visible = true;
                TextBox11.Visible = true;
            }
            if (img13.Visible == true)
            {
                bt12.Visible = true;
                TextBox12.Visible = true;
            }
            if (img14.Visible == true)
            {
                bt13.Visible = true;
                TextBox13.Visible = true;
            }
            if (img15.Visible == true)
            {
                bt14.Visible = true;
                TextBox14.Visible = true;
            }
        }

        protected void bt_Click(object sender, EventArgs e)
        {   //按删除按钮删除图片
            bt.Visible = false;
            photoName.Visible = false;
            img1.Visible = false;
            Session["del_photo"] = photoName.Text;
            DeleteDiskFile("~/images/display/" + photoName.Text);
            SqlDataSource1.Delete();
            Response.Redirect("PhotoManager.aspx");
        }

        protected void bt1_Click(object sender, EventArgs e)
        {
            bt1.Visible = false;
            TextBox1.Visible = false;
            img2.Visible = false;
            Session["del_photo"] = TextBox1.Text;
            DeleteDiskFile("~/images/display/" + TextBox1.Text);
            SqlDataSource1.Delete();
            Response.Redirect("PhotoManager.aspx");
        }

        protected void bt2_Click(object sender, EventArgs e)
        {
            bt2.Visible = false;
            TextBox2.Visible = false;
            img3.Visible = false;
            Session["del_photo"] = TextBox2.Text;
            DeleteDiskFile("~/images/display/" + TextBox2.Text);
            SqlDataSource1.Delete();
            Response.Redirect("PhotoManager.aspx");
        }

        protected void bt3_Click(object sender, EventArgs e)
        {
            bt3.Visible = false;
            TextBox3.Visible = false;
            img4.Visible = false;
            Session["del_photo"] = TextBox3.Text;
            DeleteDiskFile("~/images/display/" + TextBox3.Text);
            SqlDataSource1.Delete();
            Response.Redirect("PhotoManager.aspx");
        }

        protected void bt4_Click(object sender, EventArgs e)
        {
            bt4.Visible = false;
            TextBox4.Visible = false;
            img5.Visible = false;
            Session["del_photo"] = TextBox4.Text;
            DeleteDiskFile("~/images/display/" + TextBox4.Text);
            SqlDataSource1.Delete();
            Response.Redirect("PhotoManager.aspx");
        }

        protected void bt5_Click(object sender, EventArgs e)
        {
            bt5.Visible = false;
            TextBox5.Visible = false;
            img6.Visible = false;
            Session["del_photo"] = TextBox5.Text;
            DeleteDiskFile("~/images/display/" + TextBox5.Text);
            SqlDataSource1.Delete();
            Response.Redirect("PhotoManager.aspx");
        }

        protected void bt6_Click(object sender, EventArgs e)
        {
            bt6.Visible = false;
            TextBox6.Visible = false;
            img7.Visible = false;
            Session["del_photo"] = TextBox6.Text;
            DeleteDiskFile("~/images/display/" + TextBox6.Text);
            SqlDataSource1.Delete();
            Response.Redirect("PhotoManager.aspx");
        }

        protected void bt7_Click(object sender, EventArgs e)
        {
            bt7.Visible = false;
            TextBox7.Visible = false;
            img8.Visible = false;
            Session["del_photo"] = TextBox7.Text;
            DeleteDiskFile("~/images/display/" + TextBox7.Text);
            SqlDataSource1.Delete();
            Response.Redirect("PhotoManager.aspx");
        }

        protected void bt8_Click(object sender, EventArgs e)
        {
            bt8.Visible = false;
            TextBox8.Visible = false;
            img9.Visible = false;
            Session["del_photo"] = TextBox8.Text;
            DeleteDiskFile("~/images/display/" + TextBox8.Text);
            SqlDataSource1.Delete();
            Response.Redirect("PhotoManager.aspx");
        }

        protected void bt9_Click(object sender, EventArgs e)
        {
            bt9.Visible = false;
            TextBox9.Visible = false;
            img10.Visible = false;
            Session["del_photo"] = TextBox9.Text;
            DeleteDiskFile("~/images/display/" + TextBox9.Text);
            SqlDataSource1.Delete();
            Response.Redirect("PhotoManager.aspx");
        }

        protected void bt10_Click(object sender, EventArgs e)
        {
            bt10.Visible = false;
            TextBox10.Visible = false;
            img11.Visible = false;
            Session["del_photo"] = TextBox10.Text;
            DeleteDiskFile("~/images/display/" + TextBox10.Text);
            SqlDataSource1.Delete();
            Response.Redirect("PhotoManager.aspx");
        }

        protected void bt11_Click(object sender, EventArgs e)
        {
            bt11.Visible = false;
            TextBox11.Visible = false;
            img12.Visible = false;
            Session["del_photo"] = TextBox11.Text;
            DeleteDiskFile("~/images/display/" + TextBox11.Text);
            SqlDataSource1.Delete();
            Response.Redirect("PhotoManager.aspx");
        }

        protected void bt12_Click(object sender, EventArgs e)
        {
            bt12.Visible = false;
            TextBox12.Visible = false;
            img13.Visible = false;
            Session["del_photo"] = TextBox12.Text;
            DeleteDiskFile("~/images/display/" + TextBox12.Text);
            SqlDataSource1.Delete();
            Response.Redirect("PhotoManager.aspx");
        }

        protected void bt13_Click(object sender, EventArgs e)
        {
            bt13.Visible = false;
            TextBox13.Visible = false;
            img14.Visible = false;
            Session["del_photo"] = TextBox13.Text;
            DeleteDiskFile("~/images/display/" + TextBox13.Text);
            SqlDataSource1.Delete();
            Response.Redirect("PhotoManager.aspx");
        }

        protected void bt14_Click(object sender, EventArgs e)
        {
            bt14.Visible = false;
            TextBox14.Visible = false;
            img15.Visible = false;
            Session["del_photo"] = TextBox14.Text;
            DeleteDiskFile("~/images/display/" + TextBox14.Text);
            SqlDataSource1.Delete();
            Response.Redirect("PhotoManager.aspx");
        }
    }
}