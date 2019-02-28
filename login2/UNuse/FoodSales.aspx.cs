using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace login2
{
    public partial class FoodSales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["porkNum"] != null)
                {
                    porkNum.Text = (string)Session["porkNum"];
                    mpork.Checked = true;
                }
                if (Session["beafNum"] != null)
                {
                    beafNum.Text = (string)Session["beafNum"];
                    beaf.Checked = true;
                }
                if (Session["muttonNum"] != null)
                {
                    muttonNum.Text = (string)Session["muttonNum"];
                    mutton.Checked = true;
                }
            }
                
        }

        protected void buy2_Click(object sender, EventArgs e)
        {
            if (mpork.Checked)
            {
                Session["porkNum"] = porkNum.Text;
                Session["mpork"] = mpork.Text;
            }
            else {
                Session["mpork"] = null;
                Session["porkNum"] = null;
            }

            if (beaf.Checked)
            {
                Session["beafNum"] = beafNum.Text;
                Session["beaf"] = beaf.Text;
            }
            else {
                Session["beaf"] = null;
                Session["beafNum"] = null;
            }

            if (mutton.Checked)
            {
                Session["muttonNum"] = muttonNum.Text;
                Session["mutton"] = mutton.Text;
            }
            else
            {
                Session["mutton"] = null;
                Session["muttonNum"] = null;
            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //未勾选商品猪肉
            if ((!mpork.Checked) && (porkNum.Text != null))
            {
                args.IsValid = false;
            }
            else args.IsValid = true;
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //未选择猪肉数量
            if ((mpork.Checked) && (porkNum.Text == ""))
            {
                args.IsValid = false;
            }
            else args.IsValid = true;
        }

        protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //未勾选商品肉
            if ((!beaf.Checked) && (beafNum.Text != null))
            {
                args.IsValid = false;
            }
            else args.IsValid = true;
        }

        protected void CustomValidator4_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //未选择肉数量
            if ((beaf.Checked) && (beafNum.Text == ""))
            {
                args.IsValid = false;
            }
            else args.IsValid = true;
        }

        protected void CustomValidator5_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //未勾选商品肉
            if ((!mutton.Checked) && (muttonNum.Text != null))
            {
                args.IsValid = false;
            }
            else args.IsValid = true;
        }

        protected void CustomValidator6_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //未选择肉数量
            if ((mutton.Checked) && (muttonNum.Text == ""))
            {
                args.IsValid = false;
            }
            else args.IsValid = true;
        }
    }
}