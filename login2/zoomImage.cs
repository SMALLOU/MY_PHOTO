using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
//using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Drawing;

/// <summary>
///zoomImage 的摘要说明
/// </summary>
public class zoomImage
{
	public zoomImage()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}



    /// <summary>
        /// 生成缩略图
        /// </summary>
        /// <param name="originalImagePath">源图路径（物理路径）</param>
        /// <param name="thumbnailPath">缩略图路径（物理路径）</param>
        /// <param name="width">缩略图宽度</param>
        /// <param name="height">缩略图高度</param>
        /// <param name="mode">生成缩略图的方式</param>    
        public static void MakeZoomImage(string originalImagePath, string thumbnailPath, int width, int height, string mode)
        {
            Image originalImage = Image.FromFile(originalImagePath);
            
            int towidth = width;
            int toheight = height;
        
            int x = 0;
            int y = 0;
            int ow = originalImage.Width;
            int oh = originalImage.Height;        

            switch (mode)
            {        
                case "HW":// 按比较缩放(改后)

                    if (originalImage.Width > originalImage.Height)
                    {
                        toheight = originalImage.Height * width / originalImage.Width;
                    }
                    else
                    {
                        towidth = originalImage.Width * height / originalImage.Height;
                    }

                    if (toheight > height)
                    {
                        int h = toheight;
                        toheight = height;
                        towidth = towidth * height / h;
                    }

                    if (towidth > width)
                    {
                        int w = towidth;
                        towidth = width;
                        toheight = toheight * width / w;                        
                    }

                    break;

                case "W"://指定宽，高按比例                    
                    toheight = originalImage.Height * width/originalImage.Width;
                    break;
                case "H"://指定高，宽按比例
                    towidth = originalImage.Width * height/originalImage.Height;                    
                    break;        
                case "Cut"://指定高宽裁减（不变形）                
                    if((double)originalImage.Width/(double)originalImage.Height > (double)towidth/(double)toheight)
                    {
                        oh = originalImage.Height;
                        ow = originalImage.Height*towidth/toheight;
                        y = 0;
                        x = (originalImage.Width - ow)/2;
                    }
                    else
                    {
                        ow = originalImage.Width;
                        oh = originalImage.Width*height/towidth;
                        x = 0;
                        y = (originalImage.Height - oh)/2;
                    }
                    break;                    
                default :
                    break;
            }    
            
            //新建一个bmp图片
            Image bitmap = new System.Drawing.Bitmap(towidth,toheight);

            //新建一个画板
            Graphics g = System.Drawing.Graphics.FromImage(bitmap);

            //设置高质量插值法
            g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;

            //设置高质量,低速度呈现平滑程度
            g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;

            //清空画布并以透明背景色填充
            g.Clear(Color.Transparent);        

            //在指定位置并且按指定大小绘制原图片的指定部分
            g.DrawImage(originalImage, new Rectangle(0, 0, towidth, toheight), 
                new Rectangle(x, y, ow,oh),
                GraphicsUnit.Pixel);

            try
            {            
                //以jpg格式保存缩略图
                bitmap.Save(thumbnailPath, System.Drawing.Imaging.ImageFormat.Jpeg);
            }
            catch(System.Exception e)
            {
                throw e;
            }
            finally
            {
                originalImage.Dispose();
                bitmap.Dispose();                        
                g.Dispose();
            }
        }


}



/*
说明：该类也来源于网上，只不过我对其进行了一些改动。原类生成的缩略图的问题在于：高或者宽可能会大于需求值。比如，我需要的图片宽为150，高为120，当原图
 * 高为150，宽为150或差距不大时，生成的图片不会有变化，即也是高150，宽150，这样，当把这些图片显示到网页上的高为150，高为120的规格里的时候，高方向就会
 * 被撑破 。
 * 修改后：当出现这种情况后，图片会按最小边进行缩略，即如果原图高为150，宽为150，要求宽150，高120，那生成的图片就是120*120。总之，就是不会出现网页被
 * 撑破的或变形的情况。
 * 
 * 使用方法：
         
 * zoomImage.MakeZoomImage(原文件名, 缩略图文件名, 缩略图宽,缩略图高 , 模式);

 * 如：zoomImage.MakeZoomImage(Server.MapPath("~/uploads/")  + bigFilename, Server.MapPath("~/uploads/")  + smallFileName1, 150, 120, "HW");



*/