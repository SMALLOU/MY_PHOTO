using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace login2
{
    public partial class BallSales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["footballNum"] != null)
                {
                    footballNum.Text = (string)Session["footballNum"];
                    football.Checked = true;

                }
                if (Session["basketballNum"] != null)
                {
                    basketballNum.Text = (string)Session["basketballNum"];
                    basketball.Checked = true;
                }
            }
                
        }

        protected void buy1_Click(object sender, EventArgs e)
        {
            if (football.Checked)
            {
                Session["footballNum"] = footballNum.Text;
                Session["football"] = football.Text;
            }
            else {
                Session["football"] = null;
                Session["footballNum"] = null;
            }
            if (basketball.Checked)
            {
                Session["basketballNum"] = basketballNum.Text;
                Session["basketball"] = basketball.Text;
            }
            else {
                Session["basketball"] = null;
                Session["basketballNum"] = null;
            } 
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {    //未勾选商品足球
            if ((!football.Checked) && (footballNum.Text != null))
            {
                args.IsValid = false;
            }
            else args.IsValid = true;
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //未选择足球数量
            if ((football.Checked) && (footballNum.Text == ""))
            {
                args.IsValid = false;
            }
            else args.IsValid = true;
        }

        protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //未勾选商品篮球
            if ((!basketball.Checked) && (basketballNum.Text != ""))
            {
                args.IsValid = false;
            }
            else args.IsValid = true;
        }

        protected void CustomValidator4_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //未选择篮球数量
            if ((basketball.Checked) && (basketballNum.Text == ""))
            {
                args.IsValid = false;
            }
            else args.IsValid = true;
        }
    }
}