# login2
在线相册
一、设计内容
用ASP.NET技术开发一个在线相册的动态网站，界面自定，要求具有如下功能：
1、首页分页显示所有用户的图片，上传的用户和上传日期
2、用户能够注册
3、用户登录后，进行相册管理：
上传新图片
对本人上传的图片进行修改、删除（注意：修改图片的时候，要注意对原上传图片文件的删除，防止图片越来越多的情况出现）
用户信息的修改
二、系统总体设计
1、包括系统功能模块设计
系统功能模块有：用户注册模块、用户登录模块、用户个人信息管理模块、首页相片显示模块、个人相片上传模块和个人相片显示模块。

2、系统数据库总体设计
用户信息表：               照片信息表：
   
三、数据库设计
数据库中的表和表之间的联系：
用户可以上传多张图，所以用户信息表中一条信息可以对应照片信息表中多条照片信息，对应关系为“用户名”=“USER”，是一对多的关系；
而一张图只能对应一个用户，不同用户上传相同的图片名字不相同（添加用户名前缀）。

四、系统功能设计与实现
1.首页分页显示所有图片：

<ul class="nav nav-tabs">  <%--网站导航--%>
	    <li class="active"><asp:HyperLink runat="server"  href="#">主页</asp:HyperLink></li>
	    <li><asp:HyperLink runat="server" href="In_f.aspx" id="My_Info">个人信息</asp:HyperLink></li>
          <li><asp:HyperLink runat="server" href="PhotoManager.aspx" id="MyAlbum">我的相册</asp:HyperLink></li>  </ul>
<%--首页分页显示图片，每页五张--%>
<script src="scripts/flex-images.min.js"></script>
<div class="flex-images" style="padding:10px 40px">
  <div class="item" data-w="219" data-h="180">
    <img src="images/display/blank.gif" style="max-height:200px;max-width:290px;" runat="server" id="img1" onblur="small(img1)" onclick="normal(img1)"/>
    <div class="over" runat="server" id="imge11">Caption 1</div><div class="bottom" runat="server" id="imge12">Caption 1</div>
  </div>  <%--img11为展示上传用户名，img12为展示上传时间--%>
          。。。。。。img1—img5五张图片控件处
</div>

/******        判断用户是否登录        ******/                              //Page_Load 里面
if (Session["Admin_User"] == null || Session["Admin_User"].ToString() == "")
            { //通过Session判断用户未登录，登录注册控件显示，其他相关控件隐藏
                welcome.Text = "<b>您还未登陆，请<a href='Loginpage.aspx' style='color:red;'>
<u>登陆</u></a>或<a href='loginWebForm1.aspx' style='color:red;'>
<u>注册</u></a>新账号！<b />";
                login.Visible = true; register.Visible = true; leave1.Visible = false;
                MyAlbum.Visible = false;My_Info.Visible = false;
            }
            else
            { //通过Session判断用户未登录，登录注册控件隐藏，其他相关控件如注销显示
                welcome.CssClass = "nolmal";
                welcome.Text = Session["Admin_User"].ToString() + ",请开始您的图片之旅吧！";
                login.Visible = false; register.Visible = false;
                leave1.Visible = true;  //注销控件显示
                MyAlbum.Visible = true;  My_Info.Visible = true;
            }
/*********     判断用户是否登录     ********/                                    

/******        分页        ******/                                    //Page_Load 里面
int TotalPages = 0;   //总页数
int pageItem = 5;     //每页显示的数量
int pageIndex = Convert.ToInt32(Request.QueryString["page"]);  //当前页号
if (pageIndex == 0) pageIndex = 1;
//计算总页数
if (GridView1.Rows.Count % pageItem == 0) TotalPages = GridView1.Rows.Count / pageItem;
else
{   TotalPages = (int)Math.Ceiling((decimal)GridView1.Rows.Count / (decimal)pageItem);}
if (pageIndex > TotalPages)  pageIndex = TotalPages;
PrePage.NavigateUrl = Request.FilePath + "?page=" + (pageIndex - 1);  //上一页按钮
NextPage.NavigateUrl = Request.FilePath + "?page=" + (pageIndex + 1); //下一页按钮
Label1.Text = GridView1.Rows.Count + "张图片 共" + TotalPages + "页 第" + pageIndex + "页";
/******        分页        ******/
细节效果图：



/******        每页显示五张图片       ******/                            //Page_Load 里面
//(pageIndex * 5) - 5)表示从该页显示的第一张图片信息开始读，i小于五张图并不超过数据库范围
for (int i = ((pageIndex * 5) - 5);( i < GridView1.Rows.Count)&&(i < (pageIndex * 5)); i++)
          {
              flag = 1;
              if (i % pageItem == 0) //图片一控件读取图片信息并显示
              {   //未显示的图片控件设置为不可见
                  img2.Visible = img3.Visible = img4.Visible = img5.Visible = false;
                  img21.Visible = img31.Visible = img41.Visible = img51.Visible = false;
                  img22.Visible = img32.Visible = img42.Visible = img52.Visible = false;                   			    img1.Visible = imge11.Visible = imge12.Visible = true;
                  imge11.InnerText = GridView1.Rows[i].Cells[2].Text.Trim();
                  imge12.InnerText = GridView1.Rows[i].Cells[3].Text.Trim();
                  img1.Src = GridView1.Rows[i].Cells[4].Text.Trim();
              }
              if (i % pageItem == 1)     //图片二控件读取图片信息并显示
              {
                  img2.Visible = img21.Visible = img22.Visible = true;
                  img21.InnerText = GridView1.Rows[i].Cells[2].Text.Trim();
                  img22.InnerText = GridView1.Rows[i].Cells[3].Text.Trim();
                  img2.Src = GridView1.Rows[i].Cells[4].Text.Trim();
              }      。。。。。。后面图片代码与第二张图片相同
}
/******        每页显示五张图片        ******/

2.用户登入：

conn.Open();       //尝试打开数据库连接，判断用户名密码是否通过验证
SqlCommand cmd = new SqlCommand("select count(*) from [Table] where 用户名=@user and 密码=@psw", conn);
cmd.Parameters.Add("@user", SqlDbType.NChar);
cmd.Parameters.Add("@psw", SqlDbType.NVarChar);
cmd.Parameters["@user"].Value = username.Text;   
cmd.Parameters["@psw"].Value = psw.Text;
int count = (int)cmd.ExecuteScalar();
if (count == 0)      //用户名或密码错误
{  args.IsValid = false; }
else                 //用户存在且密码正确
{  args.IsValid = true; }

3.用户信息显示：
      
protected void Page_Load(object sender, EventArgs e)
        {
            //如果注册页面跳转过来表示注册成功，将新用户数据通过Session导入数据库
            if ((Session["Admin_User"] == null || Session["Admin_User"].ToString() == "")&& Session["username1"]!=null)
            {
                Session["Admin_User"] = username.Text = (string)Session["username1"];
                sex.Text = (string)Session["sex1"];
                。。。。。。
                photo.ImageUrl = (string)Session["photo1"];
                SqlDataSource1.Insert();//插入数据库
            }
            else //从登入界面跳转过来则通过Session["Admin_User"]中保存的登入用户名
            {    //读取数据库中该用户信息
                username.Text = (string)Session["Admin_User"];
                //数据库连接
                SqlConnection conn = new SqlConnection(@"Data Source=连接字符串");
                try
                {   conn.Open();                                          //尝试打开连接
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
                               。。。。。。
                                text.Text = dr[10].ToString();
                            }
                        }
                    }
                }
                catch (Exception ee){ Response.Write(ee.ToString());}
                finally{  conn.Close();   //关闭连接 }
            }
        }

4.用户信息修改：
SqlDataSource1.Update();

5.我的相册：
//代码与主页相似

6.相册管理：

protected void bt_Click(object sender, EventArgs e)
      {   //按删除按钮删除图片
          bt.Visible = false;
          photoName.Visible = false;
          img1.Visible = false;
          Session["del_photo"] = photoName.Text;
          DeleteDiskFile("~/images/display/" + photoName.Text);     //把图片从文件夹中删除
          SqlDataSource1.Delete();
          Response.Redirect("PhotoManager.aspx");
      }

7.上传照片：
     
   
     protected void button1_Click(object sender, EventArgs e)
        {   //指定的文件夹要存在
            string saveDir = @"\images\display\"+Session["Admin_User"].ToString();              		   string appPath = Request.PhysicalApplicationPath;
            DateTime date;
            if (UPL_photo.HasFile)
            {
                string savePath = appPath + saveDir + UPL_photo.FileName;
                UPL_photo.SaveAs(savePath);
                photo.ImageUrl = "~/images/display/" + Session["Admin_User"].ToString()+ 							UPL_photo.FileName;
                date = DateTime.Now;
                //数据库中保存照片信息
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)。。。连接字符串");
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
                    。。。。。。
                    dr["TYPE"] = Type.SelectedItem.Value;
                    myDs.Tables[0].Rows.Add(dr);      //插入表中
                    Adapter.Update(myDs);
                }
                catch(Exception ee)
                {  Response.Write(ee);  }
                finally
                {  con.Close();  //关闭连接 }
                up_L.Text = "上传成功！" + date.ToString();
            }
            else  up_L.Text = "上传失败！";   }

五、课设总结
本次的网络应用开发课程设计中，我尝试着自己做了一个界面相对清新、功能简单的多用户的相册系统，深刻的体验到了一个网站的整体架构体系及用户体验、用户验证和界面美观等相关细节，颇有收获。
在此次的设计中，自己独自一人思考着敲代码，既要对UI界面有一定的构思和把控，又要对相关功能的实现进行研究并决定选用的解决方案。为此我参考了一些图片网页如Pixabay和QQ相册，并且网上有一些样式可以找到并下载导入到项目中去，虽然其中的样式有的调出来的效果和原来的效果差很多，但因为时间有限而排版也相对比较整齐，就直接使用了，比如导航和图片的一些控件。
功能实现的过程中，比如分页，完全不清楚，不能多弄几个Web窗体，只能上网搜。但是发现别人贴的代码是不同的实现方式实现的，比如不经过数据库直接把一个文件夹里面的图片读出来，既没有上传用户和上传时间，格式也很丑，只能把那段代码读懂了，选取需要的部分，在和自己的代码组合在一起，最终达到自己需要的效果。另外，还有许多功能如图片缩略，幻灯片展示，批量管理等未实现。最后，调试的过程真的很漫长，需要很多的耐心和时间。
