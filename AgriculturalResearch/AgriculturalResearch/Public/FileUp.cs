

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;

namespace AgriculturalResearch.Public
{
    public class FileUp
    {
        /// <summary>
        /// 保存文件获取路径
        /// </summary>
        /// <param name="fileUpload"></param>
        /// <returns></returns>
        public static string SaveFile(FileUpload fileUpload,string savePath, ref string fileName)
        {
            string file = null;

            //判断是否上传了文件
            if (fileUpload.HasFile)
            {
                //指定上传文件在服务器上的保存路径
                //string savePath = Server.MapPath("~/UpFile/");
                //检查服务器上是否存在这个物理路径，如果不存在则创建
                if (!System.IO.Directory.Exists(savePath))
                {
                    //需要注意的是，需要对这个物理路径有足够的权限，否则会报错
                    //另外，这个路径应该是在网站之下，而将网站部署在C盘却把文件保存在D盘
                    System.IO.Directory.CreateDirectory(savePath);
                }

                fileName = fileUpload.FileName;//原文件名

                //文件重命名
                file = fileUpload.FileName;
                string fileFormat = file.Split('.')[file.Split('.').Length - 1]; // 以“.”截取，获取“.”后面的文件后缀
                string timeStamp = DateTime.Now.Ticks.ToString(); // 获取当前时间的string类型
                string firstFileName = timeStamp.Substring(0, timeStamp.Length - 4); // 通过截取获得文件名
                file = firstFileName + "." + fileFormat;// 设置完整（文件名+文件格式） 

                //保存文件
                savePath = savePath + "\\" + file;
                fileUpload.SaveAs(savePath);//保存文件


            }
            return "/UpFile/" + file;
        }
    }
}
