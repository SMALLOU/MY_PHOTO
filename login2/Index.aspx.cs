using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace login2
{
    public partial class Index : System.Web.UI.Page
    {
        //public String  folder = "~/images/display/";// 网站根目录下的所有图像
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_User"] == null || Session["Admin_User"].ToString() == "")
            {
                welcome.Text = "<b>您还未登陆，请<a href='Loginpage.aspx' style='color:red;'><u>登陆</u></a>或<a href='loginWebForm1.aspx' style='color:red;'><u>注册</u></a>新账号！<b />";
                login.Visible = true;
                register.Visible = true;
                leave1.Visible = false;
                MyAlbum.Visible = false;
                My_Info.Visible = false;
            }
            else
            {
                welcome.CssClass = "nolmal";
                welcome.Text = Session["Admin_User"].ToString() + ",请开始您的图片之旅吧！";
                login.Visible = false;
                register.Visible = false;
                leave1.Visible = true;
                MyAlbum.Visible = true;
                My_Info.Visible = true;
            }
            /******        分页        ******/
            //总页数
            int TotalPages = 0;
            //每页显示的数量
            int pageItem = 5;
            //当前页号
            int pageIndex = Convert.ToInt32(Request.QueryString["page"]);
            if (pageIndex == 0) pageIndex = 1;
            //计算总页数
            if (GridView1.Rows.Count % pageItem == 0) TotalPages = GridView1.Rows.Count / pageItem;
            else
            {   
                TotalPages = (int)Math.Ceiling((decimal)GridView1.Rows.Count / (decimal)pageItem);
            }
            if (pageIndex > TotalPages) pageIndex = TotalPages;
            ////System.IO.FileInfo[] fs2 = new System.IO.FileInfo[pageItem];
            //int leftCount = pageItem;
            //if (GridView1.Rows.Count - ((pageIndex - 1) * pageItem) < pageItem)
            //{
            //    leftCount = GridView1.Rows.Count - (pageIndex - 1) * pageItem;
            //}
            //Array.Copy(fs, (pageIndex - 1) * pageItem, fs2, 0, leftCount);
            //DataList1.DataSource = fs2;
            //DataList1.DataBind();
            
            Label1.Text = GridView1.Rows.Count + "张图片 共" + TotalPages + "页 第" + pageIndex + "页";
            ///*            分页           */
            ///

            int flag = 0;
            img1.Visible = img2.Visible = img3.Visible = img4.Visible = img5.Visible = false;
            imge11.Visible = img21.Visible = img31.Visible = img41.Visible = img51.Visible = false;
            imge12.Visible = img22.Visible = img32.Visible = img42.Visible = img52.Visible = false;
            //img6.Visible = img7.Visible = img8.Visible = img9.Visible = img10.Visible = false;
            //img11.Visible = img12.Visible = img13.Visible = img14.Visible = img15.Visible = false;

            ////************分页***********
            ////每页个数
            //int pageNum = 5;
            ////页码
            //int pageIndex = 1;


            for (int i = ((pageIndex * 5) - 5);( i < GridView1.Rows.Count)&&(i < (pageIndex * 5)); i++)
            {

                flag = 1;
                //Ph_Display.Text += "<img src=\"" + GridView1.Rows[i].Cells[4].Text.Trim()+"\" />"+"haha"+ GridView1.Rows[i].Cells[4].Text.Trim();
                //if (i % 5 == 0)
                //    Ph_Display.Text += "<br/>";
                if (i % pageItem == 0)
                {
                    //zoomImage.MakeZoomImage(GridView1.Rows[i].Cells[4].Text.Trim(), GridView1.Rows[i].Cells[4].Text.Trim().ToString() + "small", 120, 120, "HW");
                    //img11.Visible = img12.Visible = img13.Visible = img14.Visible = img15.Visible = false;
                    img2.Visible = img3.Visible = img4.Visible = img5.Visible = false;
                    img21.Visible = img31.Visible = img41.Visible = img51.Visible = false;
                    img22.Visible = img32.Visible = img42.Visible = img52.Visible = false;
                    //img6.Visible = img7.Visible = img8.Visible = img9.Visible = img10.Visible = false;
                    img1.Visible = imge11.Visible = imge12.Visible = true;
                    imge11.InnerText = GridView1.Rows[i].Cells[2].Text.Trim();
                    imge12.InnerText = GridView1.Rows[i].Cells[3].Text.Trim();
                    img1.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                }
                if (i % pageItem == 1)
                {

                    img2.Visible = img21.Visible = img22.Visible = true;
                    img21.InnerText = GridView1.Rows[i].Cells[2].Text.Trim();
                    img22.InnerText = GridView1.Rows[i].Cells[3].Text.Trim();
                    img2.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                }
                if (i % pageItem == 2)
                {
                    img3.Visible = img31.Visible = img32.Visible = true;
                    img31.InnerText = GridView1.Rows[i].Cells[2].Text.Trim();
                    img32.InnerText = GridView1.Rows[i].Cells[3].Text.Trim();
                    img3.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                }
                if (i % pageItem == 3)
                {
                    img4.Visible = img41.Visible = img42.Visible = true;
                    img41.InnerText = GridView1.Rows[i].Cells[2].Text.Trim();
                    img42.InnerText = GridView1.Rows[i].Cells[3].Text.Trim();
                    img4.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                }
                if (i % pageItem == 4)
                {
                    img5.Visible = img51.Visible = img52.Visible = true;
                    img51.InnerText = GridView1.Rows[i].Cells[2].Text.Trim();
                    img52.InnerText = GridView1.Rows[i].Cells[3].Text.Trim();
                    img5.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                }
                //if (i % 15 == 5)
                //{
                //    img6.Visible = true;
                //    img6.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                //}
                //if (i % 15 == 6)
                //{
                //    img7.Visible = true;
                //    img7.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                //}
                //if (i % 15 == 7)
                //{
                //    img8.Visible = true;
                //    img8.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                //}
                //if (i % 15 == 8)
                //{
                //    img9.Visible = true;
                //    img9.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                //}
                //if (i % 15 == 9)
                //{
                //    img10.Visible = true;
                //    img10.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                //}
                //if (i % 15 == 10)
                //{
                //    img11.Visible = true;
                //    img11.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                //}
                //if (i % 15 == 11)
                //{
                //    img12.Visible = true;
                //    img12.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                //}
                //if (i % 15 == 12)
                //{
                //    img13.Visible = true;
                //    img13.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                //}
                //if (i % 15 == 13)
                //{
                //    img14.Visible = true;
                //    img14.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                //}
                //if (i % 15 == 14)
                //{
                //    img15.Visible = true;
                //    img15.Src = GridView1.Rows[i].Cells[4].Text.Trim();
                //}


            }
            if (flag == 0)
            {
                Ph_Display2.Text = "您还未上传照片！";
            }
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\web-project\login2\login2\App_Data\userData.mdf;Integrated Security=True;Connect Timeout=30");
            try
            {
                con.Open();                                          //尝试打开连接
                SqlCommand cmd = new SqlCommand("select count(*) from [Photos]", con);
                int count = (int)cmd.ExecuteScalar();
                if (count == 0)
                {
                    Ph_Display2.Text = "还未上传照片！";
                }
            }
            catch
            {
                Response.Write("error!");
            }
            finally
            {
                con.Close();                                      //关闭连接
            }

            PrePage.NavigateUrl = Request.FilePath + "?page=" + (pageIndex - 1);
            NextPage.NavigateUrl = Request.FilePath + "?page=" + (pageIndex + 1);

        }

        protected void leave(object sender, EventArgs e)
        {
            Session["Admin_User"] = null;
        }
    }
}