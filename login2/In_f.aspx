<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="In_f.aspx.cs" Inherits="login2.In_f" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link href="styles/StyleSheet1.css" rel="stylesheet" type="text/css" />
<link href="styles/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="scripts/bootstrap.min.js"></script>
    <script src="scripts/jquery-3.2.1.js"></script>
    <title>个人信息</title>
    <link href="styles/StyleSheet1.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            width: 170px;
        }
        .auto-style2 {
            margin-top: 0px;
        }
    </style>
</head>
<body style="background-image:url('images/nature-3113318_1920.jpg')">
    <form id="form1" runat="server">
    <div>
            <ul class="nav nav-tabs">
	         <li ><a href="Index.aspx">主页</a></li>
	         <li><asp:HyperLink runat="server" class="active"  id="My_Info">个人信息</asp:HyperLink></li>
	         <li><asp:HyperLink runat="server" href="PhotoManager.aspx" id="MyAlbum">我的相册</asp:HyperLink></li>
            </ul>
    </div>
    <div style="background-color:azure;width:800px;" >
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\userData.mdf;Integrated Security=True;Connect Timeout=30" InsertCommand="INSERT INTO [Table] (用户名, 密码, 性别, 籍贯, Email, 手机号, 专业擅长, 业余爱好, 个人照片, 出生年月, 备注信息) VALUES (@usr,@psw,@sex,@htn,@email,@phone,@ability,@hobby,@photo,@date,@Info)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [用户名], [密码], [性别], [籍贯], [Email], [手机号], [专业擅长], [业余爱好], [个人照片], [出生年月], [备注信息] FROM [Table]">
            <InsertParameters>
                <asp:SessionParameter DefaultValue="001" Name="usr" SessionField="username1" />
                <asp:SessionParameter DefaultValue="123123" Name="psw" SessionField="psw1" />
                <asp:SessionParameter DefaultValue="男" Name="sex" SessionField="sex1" />
                <asp:SessionParameter DefaultValue="未知" Name="htn" SessionField="htn1" />
                <asp:SessionParameter DefaultValue="" Name="email" SessionField="email1" />
                <asp:SessionParameter Name="phone" SessionField="phone1" />
                <asp:SessionParameter Name="ability" SessionField="ability1" />
                <asp:SessionParameter DefaultValue="hobby1" Name="hobby" SessionField="hobby1" />
                <asp:SessionParameter DefaultValue="" Name="photo" SessionField="photo1" />
                <asp:SessionParameter Name="date" SessionField="birth1" />
                <asp:SessionParameter DefaultValue="" Name="Info" SessionField="text1" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" Visible="false" DataSourceID="SqlDataSource1"></asp:GridView>
    <div class="beCenter" >
    <h1 style="color:darkorange" >&nbsp;&nbsp;&nbsp;您的个人详细信息</h1>
    </div>
    <div  class="beCenter">
    
    <table style="border:outset,solid;padding:10px 10px 10px 10px; border-color:antiquewhite">
    <tr>
    <td  class="right" style="width:80px;padding:5px 5px 5px 5px;" >用户名:</td>
    <td class="auto-style1">
    <asp:Label ID="username" runat="server"  ></asp:Label>
    </td>
    </tr>

    <tr>
    <td class="right" style="padding:5px 5px 5px 5px;" >性别:</td>
    <td class="auto-style1">
    <asp:Label runat="server" ID="sex" ></asp:Label>
    </td>
    </tr>

    <tr>
    <td class="right" style="padding:5px 5px 5px 5px;">籍贯:</td>
    <td class="auto-style1">
    <asp:Label runat="server" ID="hometwon"></asp:Label>
    </td>
    </tr>

    <tr>
    <td class="right" style="padding:5px 5px 5px 5px;">Email:</td>
    <td class="auto-style1">
    <asp:Label runat="server"   ID="email" ></asp:Label>
    </td>
    </tr>

    <tr>
    <td class="right" style="padding:5px 5px 5px 5px;">手机号:</td>
    <td class="auto-style1">
    <asp:Label runat="server" ID="phone" ></asp:Label>
    </td>
    </tr>

    <tr>
    <td class="right" style="padding:5px 5px 5px 5px;">专业擅长:</td>
    <td class="auto-style1">
    <asp:Label runat="server"  ID="ability" ></asp:Label>
    </td>
    </tr>

    <tr>
    <td class="right" style="padding:5px 5px 5px 5px;">业余爱好:</td>
    <td class="auto-style1">
    <asp:Label runat="server" ID="hobby"  ></asp:Label>
    </td>
    </tr>

    <tr>
    <td class="right" style="padding:5px 5px 5px 5px;">个人照片:</td>
    <td class="auto-style1">
        <asp:Image runat="server" ID="photo" ImageUrl="/images/winter-1964361_640.jpg" Height="40px" Width="40px"  ImageAlign="AbsMiddle"/>
    </td>
    </tr>

    <tr>
    <td class="right" style="padding:5px 5px 5px 5px;">出生年月:</td>
    <td class="auto-style1">
    <asp:Label runat="server" ID="birth"></asp:Label>
    </td>
    </tr>
    
    <tr>
    <td class="right" style="padding:5px 5px 5px 5px;">备注信息:</td>
    <td class="auto-style1">
    <asp:Label runat="server" ID="text" text="可以补充一下"  />
    </td>
    </tr>

    </table>
    <div style="padding:10px 80px;" class="auto-style2"><asp:Button runat="server" ID="Inf_Change" Text="修改个人信息" OnClick="Inf_Change_Click" /></div>
    </div>
    </div>
    </form>
</body>
</html>
