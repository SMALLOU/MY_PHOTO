using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace login2
{
    public partial class shopping : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int p, m, b, bb, fb,sum;
            p = m = b = bb = fb = 0;
            Response.Write("<div class='beCenter'><h5 class='red'>欢迎查看您的购物车！</h5><h1 class='red'>您的购物详情如下:</h1>");
            if (Session["mpork"] != null)
            {
                try
                {
                    p = int.Parse((string)Session["porkNum"]) * 23;
                    Response.Write("猪肉<br/>  价格：23元/公斤<br/>购买数量："
                        + Session["porkNum"] + "公斤<br>总价：" + p + "元<br/><br/>");
                }
                catch
                {
                    Response.Write("int.Parse(porkNum)error!");
                }

            }
            if (Session["beaf"] != null)
            {
                try
                {
                    b = int.Parse((string)Session["beafNum"]) * 36;
                    Response.Write("牛肉<br/>  价格：36元/公斤<br/>购买数量："
                        + Session["beafNum"] + "公斤<br>总价：" + b + "元<br/><br/>");
                }
                catch
                {
                    Response.Write("int.Parse(beafNum)error!");
                }
            }
            if (Session["mutton"] != null)
            {
                try
                {
                    m = int.Parse((string)Session["muttonNum"]) * 56;
                    Response.Write("羊肉<br/>  价格：56元/公斤<br/>购买数量："
                        + Session["muttonNum"] + "公斤<br>总价：" + m + "元<br/><br/>");
                }
                catch
                {
                    Response.Write("int.Parse(muttonNum)error!");
                }
            }
            if (Session["football"] != null)
            {
                try
                {
                    fb = int.Parse((string)Session["footballNum"]) * 30;
                    Response.Write("足球<br/>  价格：30元/公斤<br/>购买数量："
                        + Session["footballNum"] + "个<br>总价：" + fb + "元<br/><br/>");
                }
                catch
                {
                    Response.Write("int.Parse(footballNum)error!");
                }
            }
            if (Session["basketball"] != null)
            {
                try
                {
                    bb = int.Parse((string)Session["basketballNum"]) * 40;
                    Response.Write("篮球<br/>  价格：40元/公斤<br/>购买数量："
                        + Session["basketballNum"] + "个<br>总价：" + bb + "元<br/><br/>");
                }
                catch
                {
                    Response.Write("int.Parse(basketballNum)error!");
                }
            }
            sum = p + m + b + bb + fb;
            Response.Write("您的总消费额为："
                        +  sum + "元<br/><br/>");
            Response.Write("<a href='FoodSales.aspx'><u>继续购物</u></a>     ");
            Response.Write("<a href='Loginpage.aspx'><u>注销</u></a>");
            Response.Write("</div>");
        }
    }
}