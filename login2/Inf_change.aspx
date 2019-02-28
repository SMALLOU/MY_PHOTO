<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inf_change.aspx.cs" Inherits="login2.Inf_change" %>

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
            width: 311px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
            <ul class="nav nav-tabs">
	         <li ><a href="Index.aspx">主页</a></li>
	         <li><asp:HyperLink runat="server" class="active" href="In_f.aspx"  id="My_Info">个人信息</asp:HyperLink></li>
	         <li><asp:HyperLink runat="server" href="PhotoManager.aspx" id="MyAlbum">我的相册</asp:HyperLink></li>
            </ul>
    </div>
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\userData.mdf;Integrated Security=True;Connect Timeout=30" InsertCommand="INSERT INTO [Table] (用户名, 密码, 性别, 籍贯, Email, 手机号, 专业擅长, 业余爱好, 个人照片, 出生年月, 备注信息) VALUES (@usr,@psw,@sex,@htn,@email,@phone,@ability,@hobby,@photo,@date,@Info)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [用户名], [密码], [性别], [籍贯], [Email], [手机号], [专业擅长], [业余爱好], [个人照片], [出生年月], [备注信息] FROM [Table]" UpdateCommand="UPDATE [Table] SET 性别 =@sex, 籍贯 =@hometwon, Email =@email, 手机号 =@phone, 专业擅长 =@ability, 业余爱好 =@hobby, 个人照片 =@photo, 出生年月 =@date, 备注信息 =@text WHERE 用户名=@user">
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
            <UpdateParameters>
                <asp:ControlParameter ControlID="sex" DefaultValue="未知" Name="sex" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="hometwon" DefaultValue="未知" Name="hometwon" PropertyName="Text" />
                <asp:ControlParameter ControlID="email" DefaultValue="未知" Name="email" PropertyName="Text" />
                <asp:ControlParameter ControlID="phone" DefaultValue="未知" Name="phone" PropertyName="Text" />
                <asp:ControlParameter ControlID="ability" DefaultValue="未知" Name="ability" PropertyName="Text" />
                <asp:ControlParameter ControlID="hobby" DefaultValue="未知" Name="hobby" PropertyName="Text" />
                <asp:ControlParameter ControlID="photo" DefaultValue="/images/winter-1964361_640.jpg" Name="photo" PropertyName="ImageUrl" />
                <asp:ControlParameter ControlID="birth" DefaultValue="未知" DbType="DateTime" Name="date" PropertyName="Text" />
                <asp:ControlParameter ControlID="text" DefaultValue="未知" Name="text" PropertyName="Text" />
                <asp:ControlParameter ControlID="username" DefaultValue="" Name="user" PropertyName="Text" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" Visible="false" DataSourceID="SqlDataSource1"></asp:GridView>
    <div class="beCenter" >
    <h1 class="red" >&nbsp;&nbsp;&nbsp;您的个人详细信息</h1>
    </div>
    <div  class="beCenter">
    
    <table style="border:outset,solid;padding:10px 10px 10px 10px; border-color:antiquewhite">
    <tr>
    <td  class="right" style="width:80px;padding:5px 5px 5px 5px;" >用户名:</td>
    <td class="auto-style1">
    <asp:TextBox ID="username" runat="server" Enabled="false"  ></asp:TextBox>
    </td>
    </tr>

    <tr>
    <td class="right" style="padding:5px 5px 5px 5px;" >性别:</td>
    <td class="auto-style1">
    <asp:RadioButtonList runat="server" ID="sex" RepeatColumns="2" >
        <asp:ListItem>男</asp:ListItem>
        <asp:ListItem>女</asp:ListItem>
    </asp:RadioButtonList>
    </td>
    </tr>

    <tr>
    <td class="right" style="padding:5px 5px 5px 5px;">籍贯:</td>
    <td class="auto-style1">
    <asp:TextBox runat="server" ID="hometwon"></asp:TextBox>
    </td>
    </tr>

    <tr>
    <td class="right" style="padding:5px 5px 5px 5px;">Email:</td>
    <td class="auto-style1">
    <asp:TextBox runat="server"   ID="email" ></asp:TextBox>
    </td>
    </tr>

    <tr>
    <td class="right" style="padding:5px 5px 5px 5px;">手机号:</td>
    <td class="auto-style1">
    <asp:TextBox runat="server" ID="phone" ></asp:TextBox>
    </td>
    </tr>

    <tr>
    <td class="right" style="padding:5px 5px 5px 5px;">专业擅长:</td>
    <td class="auto-style1">
    <asp:TextBox runat="server"  ID="ability" ></asp:TextBox>
    </td>
    </tr>

    <tr>
    <td class="right" style="padding:5px 5px 5px 5px;">业余爱好:</td>
    <td class="auto-style1">
    <asp:TextBox runat="server" ID="hobby"  ></asp:TextBox>
    </td>
    </tr>

    <tr>
    <td class="right" style="padding:5px 5px 5px 5px;">个人照片:</td>
    <td class="auto-style1">
    <br />
        <asp:FileUpload runat="server" ID="Uload"  />&nbsp;
        <asp:Button runat="server" Text="上传" OnClick="button1_Click" CausesValidation="false" style="height: 21px" ID="button1" />
        <asp:Image runat="server" ID="photo" ImageUrl="/images/winter-1964361_640.jpg" Height="40px" Width="40px"  ImageAlign="AbsMiddle"/>
    </td>
    </tr>

    <tr>
    <td class="right" style="padding:5px 5px 5px 5px;">出生年月:</td>
    
    <td class="auto-style1">
    <asp:TextBox runat="server"  ID="birth"></asp:TextBox>
    <asp:Calendar runat="server" ID="Birthday" OnSelectionChanged="Birthday_SelectionChanged"></asp:Calendar>
    </td>
    </tr>
    
    <tr>
    <td class="right" style="padding:5px 5px 5px 5px;">备注信息:</td>
    <td class="auto-style1">
    <asp:TextBox runat="server" ID="text" text="可以补充一下" ></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td></td>
    <td style="padding: 0 10px;"><asp:Button runat="server" Text="保存" OnClick="Unnamed1_Click" /></td>
    </tr>
    </table>
    
    </div>
    </div>
    </form>
</body>
</html>
