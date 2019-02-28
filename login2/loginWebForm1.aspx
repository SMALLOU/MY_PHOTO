<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginWebForm1.aspx.cs" Inherits="login2.loginWebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登入页面</title>
    <link href="styles/StyleSheet1.css" rel="stylesheet" type="text/css" />
    <script src="scripts/Script1.js" type="text/javascript" ></script>
    <style type="text/css">
        .auto-style1 {
            text-align: right;
            height: 23px;
        }
        .auto-style2 {
            height: 23px;
        }
    </style>
</head>

<body style="background-image:url('images/cyprus-3184019_1920.jpg')">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" SelectCommand="SELECT [用户名] FROM [Table]"></asp:SqlDataSource>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="m1" runat="server" />
    <div class="beCenter" >
    <h1 style="color:aqua;" > 注册成为MyPhoto用户</h1>
    </div>
    <div  class="beCenter">
    
    <table class="table_width1">
    <tr>
    <td  class="right" >
        <br />
        用户名</td>

    <td>
        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
            ErrorMessage="  必填6~18个字符，包括字母、数字、下划线，以字母开头，字母或数字结尾。<br/>"
            ControlToValidate="username" ForeColor="Red" Font-Size="XX-Small"
             ValidationExpression="^[a-zA-Z]\w{5,17}$">
        </asp:RegularExpressionValidator>
       
    <asp:TextBox ID="username" runat="server"  ></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
        ControlToValidate="username" ForeColor="Red" Font-Size="XX-Small" ErrorMessage="*"></asp:RequiredFieldValidator>
        <asp:CustomValidator ID="CustomValidator1" runat="server" 
         ErrorMessage="*用户重名" ForeColor="Red" Font-Size="XX-Small" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
        
        <asp:Button ID="Button2" runat="server"   Text="检查重名" />
       
    </td>
    </tr>

    <tr>
    <td class="right">密码</td>
    <td>
    <asp:TextBox runat="server" TextMode="Password" ID="psw1"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
        ControlToValidate="psw1"  ForeColor="Red" Font-Size="XX-Small" ErrorMessage="*"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
         ErrorMessage="长度不少于6位，最多16位，不能包含’$’和’\’。"
         ForeColor="Red" Font-Size="XX-Small" ValidationExpression="[^$\\]{6,16}$" 
         ControlToValidate="psw1" ></asp:RegularExpressionValidator>
    </td>
    </tr>

    <tr>
    <td class="right">确认密码</td>

    <td>
    <asp:TextBox runat="server" ID="psw2" TextMode="Password"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" 
         ForeColor="Red" Font-Size="XX-Small"  ErrorMessage="确认密码与密码不一致"
         ControlToValidate="psw1" ControlToCompare="psw2" ></asp:CompareValidator>
    </td>
    </tr>

    <tr>
    <td class="right">性别</td>
    <td>
    <asp:radiobuttonlist RepeatDirection="Horizontal" RepeatColumns="2" runat="server" ID="sex">
    <asp:ListItem value="男" Selected="True" ></asp:ListItem>
    <asp:ListItem value="女"></asp:ListItem>
    </asp:radiobuttonlist>
    </td>
    </tr>

    <tr>
    <td class="right">籍贯</td>
    <td>
    <asp:UpdatePanel runat="server" >
    <ContentTemplate>
    <asp:DropDownList Height="20px" AutoPostBack="true" runat="server" ID="province" OnSelectedIndexChanged="province_SelectedIndexChanged"  >
    <asp:ListItem>请选择省</asp:ListItem>
    <asp:ListItem>直辖市</asp:ListItem>
    <asp:ListItem>广东</asp:ListItem>
    <asp:ListItem>四川</asp:ListItem>
    <asp:ListItem>浙江</asp:ListItem>
    <asp:ListItem>湖北</asp:ListItem>
    </asp:DropDownList> 省
    <asp:DropDownList Height="20px" runat="server" ID="city" >
    <asp:ListItem>请选择省</asp:ListItem>
    </asp:DropDownList> 市

    </ContentTemplate>
    </asp:UpdatePanel>
    </td>
    </tr>

    <tr>
    <td class="auto-style1">Email</td>
    <td class="auto-style2">
    <asp:TextBox runat="server" CssClass="InputText" onclick="InputText('email')"  onblur="pop('email')"  ID="email" Width="148px">如xm@163.com</asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
        ErrorMessage="格式错误" ForeColor="Red" Font-Size="XX-Small" ControlToValidate="email"
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </td>
    </tr>

    <tr>
    <td class="right">手机号</td>
    <td>
    <asp:TextBox runat="server" CssClass="InputText" onclick="InputText('phone')" onblur="pop('phone')"  ID="phone" Width="148px" >11位,全数字</asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
        ErrorMessage="手机号必须是11位数字" ValidationExpression="d{11}"
        ForeColor="Red" Font-Size="XX-Small" ControlToValidate="phone"></asp:RegularExpressionValidator>
    </td>
    </tr>

    <tr>
    <td class="right">专业擅长</td>
    <td>
    <asp:ListBox runat="server" Width="152px" ID="ability" SelectionMode="Multiple">
    <asp:ListItem>摄影</asp:ListItem>
    <asp:ListItem>绘画</asp:ListItem>
    <asp:ListItem>美图</asp:ListItem>
    </asp:ListBox>
    </td>
    </tr>

    <tr>
    <td class="right">业余爱好</td>
    <td>
    <asp:CheckBoxList runat="server" ID="hobby" RepeatDirection="Horizontal" >
    <asp:ListItem>摄影</asp:ListItem>
    <asp:ListItem>绘画</asp:ListItem>
    <asp:ListItem>看书</asp:ListItem>
    <asp:ListItem>旅游</asp:ListItem>
    <asp:ListItem>其他</asp:ListItem>
    </asp:CheckBoxList>
    </td>
    </tr>

    <tr>
    <td class="right">个人照片</td>
    <td>
        <br />
        <asp:FileUpload runat="server" ID="Uload"  />&nbsp;
        <asp:Button runat="server" Text="上传" OnClick="button1_Click" CausesValidation="false" style="height: 21px" ID="button1" />
        <asp:Image runat="server" ID="photo" ImageUrl="/images/winter-1964361_640.jpg" Height="40px" Width="40px"  ImageAlign="AbsMiddle"/>
    </td>
    </tr>

    <tr>
    
    <td class="right">出生年月</td>
    <td>
    <asp:UpdatePanel runat="server" ChildrenAsTriggers="true" ID="UPbirth">
    <ContentTemplate>
    <asp:textbox runat="server" ID="birth"></asp:textbox>
    </ContentTemplate>
    </asp:UpdatePanel>
    </td>
    </tr>
    
    <tr id="calendar">
    <td></td>
    <td>
    <asp:UpdatePanel runat="server">
    <ContentTemplate>
    <asp:Calendar runat="server" ID="Birthday" OnSelectionChanged="Birthday_SelectionChanged" BackColor="#ccccff"></asp:Calendar>
    </ContentTemplate>
    <Triggers>
    <asp:AsyncPostBackTrigger ControlID="birth" />
    </Triggers>
    </asp:UpdatePanel>
    </td>
    </tr>
    
    <tr>
    <td class="right">备注信息</td>
    <td>
    <asp:TextBox runat="server" Height="100" Width="148" onclick="InputText('text')" onblur="pop('text')"
     CssClass="InputText" ID="text" TextMode="MultiLine" text="可以补充一下"  />
    </td>
    </tr>

    <tr>
    <td></td>
    <td>
    <asp:Button runat="server" Text="提交" CausesValidation ="false" OnClick="Unnamed10_Click" /> &nbsp;&nbsp;&nbsp;
    <asp:Button runat="server" CausesValidation ="false" Text="重置" />
    </td>
    </tr>

    </table>
    </div>
    
    </form>
    
</body>

</html>
