using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
//using login2.zoomImage;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace login2
{
    public partial class PhotoUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void button1_Click(object sender, EventArgs e)
        {
            string saveDir = @"\images\display\"+Session["Admin_User"].ToString();  //指定的文件夹要存在
            string appPath = Request.PhysicalApplicationPath;
            DateTime date;
            if (UPL_photo.HasFile)
            {
                string savePath = appPath + saveDir + UPL_photo.FileName;
                UPL_photo.SaveAs(savePath);
                photo.ImageUrl = "~/images/display/" + Session["Admin_User"].ToString()+ UPL_photo.FileName;
                date = DateTime.Now;
                
                //数据库中保存照片信息
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\web-project\login2\login2\App_Data\userData.mdf;Integrated Security=True;Connect Timeout=30");
                try
                {
                    con.Open();                                          //尝试打开连接
                    SqlCommand cmd = new SqlCommand("select * from [Photos]", con);
                    SqlDataAdapter Adapter = new SqlDataAdapter();
                    SqlCommandBuilder sb1 = new SqlCommandBuilder(Adapter);
                    Adapter.SelectCommand = cmd;
                    DataSet myDs = new DataSet();
                    Adapter.Fill(myDs);
                    DataRow dr = myDs.Tables[0].NewRow();
                    dr["NAME"] = Session["Admin_User"].ToString() + UPL_photo.FileName;
                    dr["DATE"] = date.ToString();
                    dr["USER"] = Session["Admin_User"].ToString();
                    dr["URL"] = photo.ImageUrl;
                    dr["TYPE"] = Type.SelectedItem.Value;
                    myDs.Tables[0].Rows.Add(dr);
                    Adapter.Update(myDs);
                }
                catch(Exception ee)
                {
                    Response.Write(ee);
                }
                finally
                {
                    con.Close();                                      //关闭连接
                }
                up_L.Text = "上传成功！" + date.ToString();
            }
            else
                up_L.Text = "上传失败！";
            
        }
    }
}