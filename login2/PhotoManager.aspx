<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PhotoManager.aspx.cs" Inherits="login2.PhotoManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link href="styles/StyleSheet1.css" rel="stylesheet" type="text/css" />
<link href="styles/flex-images.css" rel="stylesheet" type="text/css" />
<link href="styles/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="scripts/bootstrap.min.js"></script>
    <script src="scripts/jquery-3.2.1.js"></script>
    <title>我的相册</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div>
            <ul class="nav nav-tabs">
	         <li ><a href="Index.aspx">主页</a></li>
	         <li><asp:HyperLink runat="server" href="In_f.aspx" id="My_Info">个人信息</asp:HyperLink></li>
	         <li><asp:HyperLink runat="server" class="active" id="MyAlbum">我的相册</asp:HyperLink></li>
            </ul>
        </div>
        <br />
        <div style="padding:0 20px">
        <asp:Button runat="server" Text="相册管理" class="btn btn-primary btn-xs" ID="Manage" OnClick="Manage_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button runat="server" Text="上传照片" class="btn btn-primary btn-xs" OnClick="Unnamed2_Click" />
        </div>
        <br />
        <div style="padding:0 40px">
        <asp:Label runat="server" ID="Ph_Display"></asp:Label>
        </div>
        <div>
            <script src="scripts/flex-images.min.js"></script>
            <div class="flex-images">
              <div class="item" data-w="219" data-h="180"><img src="images/display/blank.gif" style="max-height:200px;max-width:300px;" runat="server" id="img1"/>
              <div class="bottom"><asp:TextBox runat="server" ID="photoName"></asp:TextBox><asp:Button runat="server" ID="bt" Text="删除" OnClick="bt_Click" /></div>
              </div>
              <div class="item" data-w="279" data-h="180"><img src="images/display/blank.gif" style="max-height:200px;max-width:300px;" runat="server" id="img2"/>
              <div class="bottom"><asp:TextBox runat="server" ID="TextBox1"></asp:TextBox><asp:Button runat="server" ID="bt1" Text="删除" OnClick="bt1_Click" /></div>
              </div>
              <div class="item" data-w="270" data-h="180"><img src="images/display/blank.gif" style="max-height:200px;max-width:300px;" runat="server" id="img3"/>
              <div class="bottom"><asp:TextBox runat="server" ID="TextBox2"></asp:TextBox><asp:Button runat="server" ID="bt2" Text="删除" OnClick="bt2_Click" /></div>
              </div>
              <div class="item" data-w="270" data-h="180"><img src="images/display/blank.gif" style="max-height:200px;max-width:300px;" runat="server" id="img4"/>
              <div class="bottom"><asp:TextBox runat="server" ID="TextBox3"></asp:TextBox><asp:Button runat="server" ID="bt3" Text="删除" OnClick="bt3_Click" /></div>
              </div>
              <div class="item" data-w="147" data-h="180"><img src="images/display/blank.gif" style="max-height:200px;max-width:300px;" runat="server" id="img5"/>
              <div class="bottom"><asp:TextBox runat="server" ID="TextBox4"></asp:TextBox><asp:Button runat="server" ID="bt4" Text="删除" OnClick="bt4_Click" /></div>
              </div>
              <div class="item" data-w="276" data-h="180"><img src="images/display/blank.gif" style="max-height:200px;max-width:300px;" runat="server" id="img6"/>
              <div class="bottom"><asp:TextBox runat="server" ID="TextBox5"></asp:TextBox><asp:Button runat="server" ID="bt5" Text="删除" OnClick="bt5_Click" /></div>
              </div>
              <div class="item" data-w="319" data-h="180"><img src="images/display/blank.gif" style="max-height:200px;max-width:300px;" runat="server" id="img7"/>
              <div class="bottom"><asp:TextBox runat="server" ID="TextBox6"></asp:TextBox><asp:Button runat="server" ID="bt6" Text="删除" OnClick="bt6_Click" /></div>
              </div>
              <div class="item" data-w="270" data-h="180"><img src="images/display/blank.gif" style="max-height:200px;max-width:300px;" runat="server" id="img8"/>
              <div class="bottom"><asp:TextBox runat="server" ID="TextBox7"></asp:TextBox><asp:Button runat="server" ID="bt7" Text="删除" OnClick="bt7_Click" /></div>
              </div>
              <div class="item" data-w="240" data-h="180"><img src="images/display/blank.gif" style="max-height:200px;max-width:300px;" runat="server" id="img9"/>
              <div class="bottom"><asp:TextBox runat="server" ID="TextBox8"></asp:TextBox><asp:Button runat="server" ID="bt8" Text="删除" OnClick="bt8_Click" /></div>
              </div>
              <div class="item" data-w="270" data-h="180"><img src="images/display/blank.gif" style="max-height:200px;max-width:300px;" runat="server" id="img10"/>
              <div class="bottom"><asp:TextBox runat="server" ID="TextBox9"></asp:TextBox><asp:Button runat="server" ID="bt9" Text="删除" OnClick="bt9_Click" /></div>
              </div>
              <div class="item" data-w="240" data-h="180"><img src="images/display/blank.gif" style="max-height:200px;max-width:300px;" runat="server" id="img11"/>
              <div class="bottom"><asp:TextBox runat="server" ID="TextBox10"></asp:TextBox><asp:Button runat="server" ID="bt10" Text="删除" OnClick="bt10_Click" /></div>
              </div>
              <div class="item" data-w="270" data-h="180"><img src="images/display/blank.gif" style="max-height:200px;max-width:300px;" runat="server" id="img12"/>
              <div class="bottom"><asp:TextBox runat="server" ID="TextBox11"></asp:TextBox><asp:Button runat="server" ID="bt11" Text="删除" OnClick="bt11_Click" /></div>
              </div>
              <div class="item" data-w="283" data-h="180"><img src="images/display/blank.gif" style="max-height:200px;max-width:300px;" runat="server" id="img13"/>
              <div class="bottom"><asp:TextBox runat="server" ID="TextBox12"></asp:TextBox><asp:Button runat="server" ID="bt12" Text="删除" OnClick="bt12_Click" /></div>
              </div>
              <div class="item" data-w="271" data-h="180"><img src="images/display/blank.gif" style="max-height:200px;max-width:300px;" runat="server" id="img14"/>
              <div class="bottom"><asp:TextBox runat="server" ID="TextBox13"></asp:TextBox><asp:Button runat="server" ID="bt13" Text="删除" OnClick="bt13_Click" /></div>
              </div>
              <div class="item" data-w="258" data-h="180"><img src="images/display/blank.gif" style="max-height:200px;max-width:300px;" runat="server" id="img15"/>
              <div class="bottom"><asp:TextBox runat="server" ID="TextBox14"></asp:TextBox><asp:Button runat="server" ID="bt14" Text="删除" OnClick="bt14_Click" /></div>
              </div>
        </div>
        </div>
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" SelectCommand="SELECT [NAME], [TYPE], [USER], [DATE], [URL] FROM [Photos]" DeleteCommand="DELETE FROM Photos WHERE NAME = @name">
            <DeleteParameters>
                <asp:SessionParameter Name="name" SessionField="del_photo" />
            </DeleteParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" Visible="false" runat="server" AutoGenerateColumns="False" DataKeyNames="NAME" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="NAME" HeaderText="NAME" ReadOnly="True" SortExpression="NAME" />
                <asp:BoundField DataField="TYPE" HeaderText="TYPE" SortExpression="TYPE" />
                <asp:BoundField DataField="USER" HeaderText="USER" SortExpression="USER" />
                <asp:BoundField DataField="DATE" HeaderText="DATE" SortExpression="DATE" />
                <asp:BoundField DataField="URL" HeaderText="URL" SortExpression="URL" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
