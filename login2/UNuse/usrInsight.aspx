<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="usrInsight.aspx.cs" Inherits="login2.usrInsight" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT [用户名], [密码], [性别], [籍贯], [Email], [手机号], [业余爱好], [专业擅长], [个人照片], [出生年月], [备注信息] FROM [Table]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="用户名" DataSourceID="SqlDataSource1" >
            <Columns>
                <asp:BoundField DataField="用户名" HeaderText="用户名" ReadOnly="True" SortExpression="用户名" />
                <asp:BoundField DataField="密码" HeaderText="密码" SortExpression="密码" />
                <asp:BoundField DataField="性别" HeaderText="性别" SortExpression="性别" />
                <asp:BoundField DataField="籍贯" HeaderText="籍贯" SortExpression="籍贯" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="手机号" HeaderText="手机号" SortExpression="手机号" />
                <asp:BoundField DataField="业余爱好" HeaderText="业余爱好" SortExpression="业余爱好" />
                <asp:BoundField DataField="专业擅长" HeaderText="专业擅长" SortExpression="专业擅长" />
                <asp:BoundField DataField="个人照片" HeaderText="个人照片" SortExpression="个人照片" />
                <asp:BoundField DataField="出生年月" HeaderText="出生年月" SortExpression="出生年月" />
                <asp:BoundField DataField="备注信息" HeaderText="备注信息" SortExpression="备注信息" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
