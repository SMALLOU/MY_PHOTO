<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="login2.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link href="styles/flex-images.css" rel="stylesheet" type="text/css" />
<link href="styles/StyleSheet1.css" rel="stylesheet" type="text/css" />
<link href="styles/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="scripts/bootstrap.min.js"></script>
    <script src="scripts/jquery-3.2.1.js"></script>
    <script src="scripts/Script1.js"></script>
    <title>MyPhoto</title>
</head>
<body>
    <form id="form1" runat="server">
    <ul class="nav nav-tabs">  <%--网站导航--%>
	    <li class="active"><asp:HyperLink runat="server"  href="#">主页</asp:HyperLink></li>
	    <li><asp:HyperLink runat="server" href="In_f.aspx" id="My_Info">个人信息</asp:HyperLink></li>
        <li><asp:HyperLink runat="server" href="PhotoManager.aspx" id="MyAlbum">我的相册</asp:HyperLink></li>
    </ul>

    <div  style="float:right">
        <asp:Button runat="server" ID="leave1" BorderStyle="None" ForeColor="Blue" BackColor="WindowText" Font-Bold="true" Text="注销" OnClick="leave"></asp:Button>
        <asp:HyperLink runat="server"  href="Loginpage.aspx" id="login"><b>登陆</b></asp:HyperLink>&nbsp;&nbsp;
        <asp:HyperLink runat="server" id="register" href="loginWebForm1.aspx" ><b>注册</b></asp:HyperLink></div>
    <div class="jumbotron" style="background-image:url(images/flower-3204966_1920.jpg)" >
    <div >
        <h2 style="color:white"><b>Welcome to MyPhoto!</b></h2>
        <b style="color:white">欢迎您！<asp:Label runat="server" ID="welcome" CssClass="red"></asp:Label></b>
        <h5 style="color:white">Pictures form world! Pictures from yours! Pictures of your fond!</h5>
    </div>
    </div>
    <div>
    <%--<script src="scripts/flex-images.min.js"></script>
            <div class="flex-images" style="padding: inherit;">
            <asp:DataList ID="DataList1" runat="server" RepeatColumns="2"  >
            <ItemTemplate>
                <img src='<%#Page.ResolveUrl(folder + Eval("Name"))%>' style="max-height:200px;max-width:300px;" />
            </ItemTemplate>
            <AlternatingItemTemplate>
                <img src='<%#Page.ResolveUrl(folder + Eval("Name"))%>' style="max-height:200px;max-width:300px;" />
            </AlternatingItemTemplate>
            </asp:DataList>
            </div>--%>
    <script src="scripts/flex-images.min.js"></script>
            <div class="flex-images" style="padding:10px 40px">
              <div class="item" data-w="219" data-h="180">
                <img src="images/display/blank.gif" style="max-height:180px;max-width:240px;" runat="server" id="img1" onblur="small(img1)" onclick="normal(img1)"/>
                <div class="over" runat="server" id="imge11">Caption 1</div><div class="bottom" runat="server" id="imge12">Caption 1</div>
              </div>
              <div class="item" data-w="279" data-h="180">
                <img src="images/display/blank.gif" style="max-height:180px;max-width:240px;" runat="server" id="img2" onblur="small(img2)" onclick="normal(img2)"/>
                <div class="over" runat="server" id="img21">Caption 2</div><div class="bottom" runat="server" id="img22">Caption 1</div>
              </div>
              <div class="item" data-w="270" data-h="180">
                <img src="images/display/blank.gif" style="max-height:180px;max-width:240px;" runat="server" id="img3" onblur="small(img3)" onclick="normal(img3)"/>
                <div class="over" runat="server" id="img31">Caption 3</div><div class="bottom" runat="server" id="img32">Caption 1</div>
              </div>
              <div class="item" data-w="270" data-h="180">
                <img src="images/display/blank.gif" style="max-height:180px;max-width:240px;" runat="server" id="img4" onblur="small(img4)" onclick="normal(img4)"/>
                <div class="over" runat="server" id="img41">Caption 4</div><div class="bottom" runat="server" id="img42">Caption 1</div>
              </div>
              <div class="item" data-w="147" data-h="180">
                <img src="images/display/blank.gif" style="max-height:180px;max-width:240px;" runat="server" id="img5" onblur="small(img5)" onclick="normal(img5)"/>
                <div class="over" runat="server" id="img51">Caption 5</div><div class="bottom" runat="server" id="img52">Caption 1</div>
              </div>
              <%--<div class="item" data-w="276" data-h="180">
                <img src="images/display/blank.gif" style="max-height:200px;max-width:300px;" runat="server" id="img6"/>
                <div class="over">Caption 1</div><div class="bottom">Caption 1</div>
              </div>
              <div class="item" data-w="319" data-h="180">
                <img src="images/display/blank.gif" style="max-height:200px;max-width:300px;" runat="server" id="img7"/>
                <div class="over">Caption 1</div><div class="bottom">Caption 1</div>
              </div>
              <div class="item" data-w="270" data-h="180">
                <img src="images/display/blank.gif" style="max-height:200px;max-width:300px;" runat="server" id="img8"/>
                <div class="over">Caption 1</div><div class="bottom">Caption 1</div>
              </div>
              <div class="item" data-w="240" data-h="180">
                <img src="images/display/blank.gif" style="max-height:200px;max-width:300px;" runat="server" id="img9"/>
                <div class="over">Caption 1</div><div class="bottom">Caption 1</div>
              </div>
              <div class="item" data-w="270" data-h="180">
                <img src="images/display/blank.gif" style="max-height:200px;max-width:300px;" runat="server" id="img10"/>
                <div class="over">Caption 1</div><div class="bottom">Caption 1</div>
              </div>
              <div class="item" data-w="240" data-h="180">
                <img src="images/display/blank.gif" style="max-height:200px;max-width:300px;" runat="server" id="img11"/>
                <div class="over">Caption 1</div><div class="bottom">Caption 1</div>
              </div>
              <div class="item" data-w="270" data-h="180">
                <img src="images/display/blank.gif" style="max-height:200px;max-width:300px;" runat="server" id="img12"/>
                <div class="over">Caption 1</div><div class="bottom">Caption 1</div>
              </div>
              <div class="item" data-w="283" data-h="180">
                <img src="images/display/blank.gif" style="max-height:200px;max-width:300px;" runat="server" id="img13"/>
                <div class="over">Caption 1</div><div class="bottom">Caption 1</div>
              </div>
              <div class="item" data-w="271" data-h="180">
                <img src="images/display/blank.gif" style="max-height:200px;max-width:300px;" runat="server" id="img14"/>
                <div class="over">Caption 1</div><div class="bottom">Caption 1</div>
              </div>
              <div class="item" data-w="258" data-h="180">
                <img src="images/display/blank.gif" style="max-height:200px;max-width:300px;" runat="server" id="img15"/>
                <div class="over">Caption 1</div><div class="bottom">Caption 1</div>
              </div>--%>
            
         </div>
    </div>
    <section>
        <div style="padding:0 40px">
        <br />
            <p>
               快来找你喜欢的图片吧！<br />
                Come and find your favourite!
            </p>
        </div>
        <div id="display" style="padding:0 40px" >
        <asp:Label runat="server" ID="Ph_Display2"></asp:Label>
        </div>
    </section>
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" SelectCommand="SELECT [NAME], [TYPE], [USER], [DATE], [URL] FROM [Photos]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" Visible="false" AutoGenerateColumns="False" DataKeyNames="NAME" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="NAME" HeaderText="NAME" ReadOnly="True" SortExpression="NAME" />
                <asp:BoundField DataField="TYPE" HeaderText="TYPE" SortExpression="TYPE" />
                <asp:BoundField DataField="USER" HeaderText="USER" SortExpression="USER" />
                <asp:BoundField DataField="DATE" HeaderText="DATE" SortExpression="DATE" />
                <asp:BoundField DataField="URL" HeaderText="URL" SortExpression="URL" />
            </Columns>
        </asp:GridView>
    </div>
    <div style="padding:0px 500px;">
    <%-- 一页放5张图 --%>
        <%--<ul class="pagination">
         <li><a href="#" >&laquo;</a></li>
         <li><a href="#" runat="server" id="page1">1</a></li>
         <li><a href="#" runat="server" id="page2" visible="false">2</a></li>
         <li><a href="#" runat="server" id="page3" visible="false">3</a></li>
         <li><a href="#" runat="server" id="page4" visible="false">4</a></li>
         <li><a href="#" runat="server" id="page5" visible="false">5</a></li>
         <li><a href="#" runat="server" >&raquo;</a></li>
        </ul><br/>--%>
        <asp:HyperLink ID="PrePage" class="pagination" runat="server">上一页</asp:HyperLink>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <asp:HyperLink ID="NextPage" class="pagination" runat="server">下一页</asp:HyperLink>
        
     </div>
     <div>

     </div>
    </form>
</body>
</html>
