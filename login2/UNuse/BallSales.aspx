<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BallSales.aspx.cs" Inherits="login2.BallSales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="styles/StyleSheet1.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 256px;
        }
        .auto-style2 {
            width: 221px;
        }
        .auto-style3 {
            width: 77px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="beCenter" >
    <asp:ScriptManager ID="m1" runat="server" />
    <h1 class="red">欢迎来到球类购物区!</h1>
    <table>
    <tr>
    <td class="auto-style3">
    
    <asp:CheckBox runat="server" text="足球" ID ="football"></asp:CheckBox>
    </td>
    <td class="auto-style1">
    <asp:Label runat="server">  价格：30元/每个  购买数量  </asp:Label>
    <asp:TextBox runat="server" Width="30px" Height="16px" ID ="footballNum" ></asp:TextBox>个
     
    </td>
    <td class="auto-style2">

    <asp:UpdatePanel runat="server" ><ContentTemplate>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
         ValidationExpression="^\+?\d*$" ControlToValidate="footballNum" CssClass="red" ErrorMessage="*购买数量只能为正整数<br/>"></asp:RegularExpressionValidator>
    <asp:CustomValidator ID="CustomValidator1" runat="server" 
    CssClass="red" ControlToValidate="footballNum" ErrorMessage="*您还没有选中您要购买的商品<br/>" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator2" runat="server" 
    CssClass="red"  ErrorMessage="*您还没有选择您要购买的数量" OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator>
    </ContentTemplate></asp:UpdatePanel>
    </td>
    </tr>

    <tr>
    <td class="auto-style3">
    <asp:CheckBox runat="server" text="篮球" ID ="basketball"></asp:CheckBox>
    </td>
    <td class="auto-style1">
    <asp:Label runat="server">  价格：40元/每个  购买数量  </asp:Label>
    <asp:TextBox runat="server" Width="30px" Height="16px" ID ="basketballNum" ></asp:TextBox>个
    </td>

    <td class="auto-style2">
    <asp:UpdatePanel runat="server" ><ContentTemplate>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
    ValidationExpression="^\+?\d*$" ControlToValidate="basketballNum" CssClass="red" ErrorMessage="*购买数量只能为正整数<br/>"></asp:RegularExpressionValidator>
        <asp:CustomValidator ID="CustomValidator3" ControlToValidate="basketballNum" runat="server" CssClass="red" ErrorMessage="*您还没有选中您要购买的商品<br/>" OnServerValidate="CustomValidator3_ServerValidate"></asp:CustomValidator>
        <asp:CustomValidator ID="CustomValidator4" runat="server" CssClass="red" ErrorMessage="*您还没有选择您要购买的数量" OnServerValidate="CustomValidator4_ServerValidate"></asp:CustomValidator>
    </ContentTemplate></asp:UpdatePanel>
    </td>
    </tr>

    <tr>
    <td class="auto-style3"></td>
    <td>
    <asp:UpdatePanel runat="server" >
    <ContentTemplate>
    &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button runat="server" Text="购买" ID ="buy1" OnClick="buy1_Click" />
    </ContentTemplate>
    </asp:UpdatePanel>
    </td>
    </tr>

    <tr>
    <td class="auto-style3"><a href="FoodSales.aspx"><u>买点别的</u></a></td>
    <td class="right"><a href="shopping.aspx"><u>查看购物车</u></a></td>
    </tr>
    </table>
    
    </div>

    </form>
</body> 
</html>
