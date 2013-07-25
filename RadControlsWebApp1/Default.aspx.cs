using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;

using System;
using System.IO;
using System.Text;

public partial class Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void RadAjaxManager1_AjaxRequest(object sender, Telerik.Web.UI.AjaxRequestEventArgs e)
    {
        if (e.Argument == "Sugerir")
        {
            string words = getRandomWords();
            string[] arrWords = words.Split(' ');
            Random random = new Random();
            int randomNumber;
            for (int i = 0; i < 20; i++)
            {
                randomNumber = random.Next(0, arrWords.Length);
                words = words + " " + arrWords[randomNumber];
            }

            Words.Text = words;
        }
    }
    public string getRandomWords() {
        string words = "";
        string path = Server.MapPath("~");
        path = path + "RandomWords.txt";

        // Delete the file if it exists.
        if (File.Exists(path))
        {
            string s = "";
            // Open the stream and read it back.
            using (StreamReader sr = File.OpenText(path))
            {

                while ((s = sr.ReadLine()) != null)
                {
                    words = words + s;

                }
            }
        }
        else words = "Could not load suggestions!";


        return words;

    }
}
