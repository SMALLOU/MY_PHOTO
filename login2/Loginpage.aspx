<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loginpage.aspx.cs" Inherits="login2.Loginpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="styles/StyleSheet1.css" type="text/css" rel="stylesheet" />
</head>
<body  style="background-image:url(images/nature-3113318_1920.jpg)">
    <form id="form1" runat="server">
    <br />
    <br />
    <br />
    <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" SelectCommand="SELECT [用户名], [密码] FROM [Table]"></asp:SqlDataSource>
    <div class="beCenter" style="background-color:bisque; width:300px; background-image:url(images/nature-3184889_640.jpg)">
    <br />
    <h1 style="color:ActiveCaption,darkslateblue">&nbsp;&nbsp;MyPhoto欢迎您！</h1>
    <table>
     <tr>
     <td class="right">
        &nbsp;<asp:Label ID="Label1" runat="server" Text="用户名"></asp:Label>
     </td>
     <td>
        <asp:TextBox ID="username" runat="server" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="psw"></asp:RequiredFieldValidator>
     </td>
     </tr>
     <tr>
     <td class="right">
        &nbsp;<asp:Label ID="Label2" runat="server" Text="密码"></asp:Label>
        
     </td>
     <td>
        <asp:TextBox ID="psw" TextMode="Password" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  runat="server" ErrorMessage="*" ControlToValidate="psw" ForeColor="Red"></asp:RequiredFieldValidator>
     </td>
     </tr>
     <tr>
     <td></td>
     <td> <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="*用户名或密码错误"
     ForeColor="Red" Font-Size="Small" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>

     </td>
     </tr>
     <tr>
     <td></td>
     <td>
          &nbsp; &nbsp;<asp:Button ID="Button1" runat="server" Text="登入" OnClick="Button1_Click" />
     &nbsp;&nbsp;
         <asp:Button ID="Button2" runat="server" Text="注册" PostBackUrl="~/loginWebForm1.aspx" CausesValidation="false" OnClick="Button2_Click" />
         
         
     </td>
     </tr>
    </table>
    <br />
    </div>
    </form>
</body>
</html>
