<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FoodSales.aspx.cs" Inherits="login2.FoodSales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="styles/StyleSheet1.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 274px;
        }
        .auto-style2 {
            text-align: right;
            width: 274px;
        }
        .auto-style3 {
            width: 78px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="beCenter">
    <asp:ScriptManager ID="m1" runat="server" />
    <h1 class="red">欢迎来到食品购物区！</h1>
    <table>
    <tr>
    <td class="auto-style3">
    <asp:CheckBox runat="server" text="猪肉" ID="mpork" ></asp:CheckBox>
    </td>
    <td class="auto-style1">
    <asp:Label runat="server">  价格：23元/公斤  购买数量  </asp:Label>
    <asp:TextBox runat="server" Width="30px" Height="16px" ID ="porkNum" ></asp:TextBox>公斤
    </td>
    <td>
    <asp:UpdatePanel runat="server" ><ContentTemplate>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
         ValidationExpression="^\+?\d*$" ControlToValidate="porkNum" CssClass="red" ErrorMessage="*购买数量只能为正整数<br/>"></asp:RegularExpressionValidator>
    <asp:CustomValidator ID="CustomValidator1" runat="server"
         CssClass="red" ControlToValidate="porkNum" ErrorMessage="*您还没有选中您要购买的商品<br/>" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator2" runat="server" CssClass="red" ErrorMessage="*您还没有选择您要购买的数量" OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator>
    </ContentTemplate></asp:UpdatePanel>
    </td>
    </tr>

    <tr>
    <td class="auto-style3">
    <asp:CheckBox runat="server" text="牛肉" ID="beaf"></asp:CheckBox>
    </td>
    <td class="auto-style1">
    <asp:Label runat="server" >  价格：36元/公个  购买数量  </asp:Label>
    <asp:TextBox runat="server" Width="30px" Height="16px" ID="beafNum" ></asp:TextBox>公斤
    
    </td>
    <td>
    <asp:UpdatePanel runat="server" ><ContentTemplate>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
         ValidationExpression="^\+?\d*$" ControlToValidate="beafNum" CssClass="red" ErrorMessage="*购买数量只能为正整数<br/>"></asp:RegularExpressionValidator>
    <asp:CustomValidator ID="CustomValidator3" runat="server"
         CssClass="red" ControlToValidate="beafNum" ErrorMessage="*您还没有选中您要购买的商品<br/>" OnServerValidate="CustomValidator3_ServerValidate"></asp:CustomValidator>
        <asp:CustomValidator ID="CustomValidator4" runat="server" CssClass="red" ErrorMessage="*您还没有选择您要购买的数量" OnServerValidate="CustomValidator4_ServerValidate"></asp:CustomValidator>
    </ContentTemplate></asp:UpdatePanel>
    </td>
    </tr>

    <tr>
    <td class="auto-style3">
    <asp:CheckBox runat="server" text="羊肉" ID ="mutton"></asp:CheckBox>
    </td>
    <td class="auto-style1">
    <asp:Label runat="server">  价格：56元/公斤  购买数量  </asp:Label>
    <asp:TextBox runat="server" Width="30px" Height="16px" ID ="muttonNum" ></asp:TextBox>公斤
    
    </td>
    <td>
    <asp:UpdatePanel runat="server" ><ContentTemplate>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
        ValidationExpression="^\+?\d*$" ControlToValidate="muttonNum" CssClass="red" ErrorMessage="*购买数量只能为正整数<br/>"></asp:RegularExpressionValidator>
    <asp:CustomValidator ID="CustomValidator5" runat="server" 
        CssClass="red" ControlToValidate="muttonNum" ErrorMessage="*您还没有选中您要购买的商品<br/>" OnServerValidate="CustomValidator5_ServerValidate"></asp:CustomValidator>
        <asp:CustomValidator ID="CustomValidator6" runat="server" CssClass="red" ErrorMessage="*您还没有选择您要购买的数量" OnServerValidate="CustomValidator6_ServerValidate"></asp:CustomValidator>
    </ContentTemplate></asp:UpdatePanel>
    </td>
    </tr>

    <tr>
    <td class="auto-style3"></td>
    <td class="auto-style1">
    &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button runat="server" Text="购买" ID ="buy2" OnClick="buy2_Click" />
    </td>
    </tr>

    <tr>
    <td class="auto-style3"><a href="BallSales.aspx"><u>买点别的</u></a></td>
    <td class="auto-style2"><a href="shopping.aspx"><u>查看购物车</u></a></td>
    </tr>
    </table>
    </div>
    </form>
</body>
</html>
