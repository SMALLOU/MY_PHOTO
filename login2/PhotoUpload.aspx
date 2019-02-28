<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PhotoUpload.aspx.cs" Inherits="login2.PhotoUpload" %>

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
    <title>照片上传</title>
    <style type="text/css">
        .auto-style1 {
            margin-bottom: 10px;
        }
        .auto-style2 {
            height: 11px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div> 
            <ul class="nav nav-tabs">
	         <li ><a href="Index.aspx">主页</a></li>
	         <li><asp:HyperLink runat="server" href="In_f.aspx" id="My_Info">个人信息</asp:HyperLink></li>
	         <li><asp:HyperLink runat="server" href="PhotoManager.aspx" class="active" id="MyAlbum">我的相册</asp:HyperLink></li>
            </ul>
        </div>
    </div>
    <br />
    <div style="padding:0 40px">
    <table class="auto-style1">
    <tr>
        <td>
        <br />
        上传照片类型：&nbsp;&nbsp;
        </td>
        <td >
        <br />
        <asp:RadioButtonList runat="server" ID="Type"  RepeatColumns="5" >
        <asp:ListItem>风景&nbsp;&nbsp;</asp:ListItem>
        <asp:ListItem>人物&nbsp;&nbsp;</asp:ListItem>
        <asp:ListItem>动物&nbsp;&nbsp;</asp:ListItem>
        <asp:ListItem>漫画&nbsp;&nbsp;</asp:ListItem>
        <asp:ListItem Selected="True" >其他&nbsp;&nbsp;</asp:ListItem>
        </asp:RadioButtonList>

        </td>
        <td>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="Type"></asp:RequiredFieldValidator>
        </td>
    </tr>
     <tr>
         <td class="auto-style2">
         照片上传:&nbsp;
         </td>
         <td class="auto-style2">
         <br />
         <asp:FileUpload runat="server"   ID="UPL_photo" />&nbsp;
         </td>
        <td class="auto-style2">
        <asp:Button runat="server" Text="上传" OnClick="button1_Click" CausesValidation="false" class="btn btn-primary btn-xs" ID="button1" />
        </td>
         
     </tr>
     <tr>
        <td>
          图片效果：
        </td>
        <td style="max-width:400px;max-height:280px;">
            <asp:Image runat="server" ID="photo" ImageAlign="AbsMiddle"/><asp:Label runat="server" ID="up_L"></asp:Label>
        </td>
     </tr>
    </table>
    
    </div>
    </form>
    <p>
        <br />
    </p>
    
</body>
</html>
