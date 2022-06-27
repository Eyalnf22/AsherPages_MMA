<%@ Page Title="" Language="C#" MasterPageFile="~/HomePage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != "yes" && Session["Admin"] != "yes")
        {
            Response.Redirect("login.aspx");
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
קראטה
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">קאטות<a name="up" style=" margin-left:100px;"></a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

<div class="middle">

<div class="para">
<u><h1 style="font-size:35px; padding:10 20px;">מהי קאטה?</h1></u>
<span style="float:left;">
<img style=" padding:0 15px; float:left; position:static; margin-left:30px" src="images/taka.jpg" width="350" height="230"/>
</span>
<font size="4" face="Arial" style="line-height:1.4;">קאטה (型) (מכונה גם פורם - Form, כלומר תבנית תנועה) היא מילה יפנית המתארת סדרת תנועות קבועה מראש המבוצע כנגד יריב מדומה.

באמנויות הלחימה השונות הקאטות משמשות לתרגול קרב כנגד יריב אחד או כנגד מספר יריבים. אימוני הקאטות מיועדים לפתח את יכולת הלוחם ולשפר את מוכנותו לקרב אמת. מכלול הקאטות של שיטה מסוימת כולל את רוב העקרונות וההיבטים של תורת הלחימה שלה. הקאטות נפוצות כמעט בכל שיטות אמנויות הלחימה (עם זאת, באייקידו למשל, אין קאטות משום שמייסד השיטה לא ראה בזה כל צורך), גם באלו המוגדרות קשות וחיצוניות וגם באלו המכונות רכות ופנימיות.<br /<br />
<br /><br />
    <br /><br />

<center>
<iframe style="float:right; margin:0 20px;"  width="560" height="315" src="https://www.youtube.com/embed/sgN7fUGPgMM" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>
<u><h1 style="font-size:35px; padding:10 20px;">ביקורת ותגובה</h1></u>
מבקרי הקאטות, השוללים את התועלת שבאימוני הקאטות, טוענים, שהקאטות גורמות לתלמידים להגיב באופן אחיד וצפוי. דבר העושה צעדים בלתי צפויים של היריב, ליעילים יותר.

עוד הם טוענים, כי הקאטה מלמדת את התלמיד מעט מאד. תלמיד המבצע קאטה רק המחקה תנועות, וזה במקום שהתלמיד ילמד לשלוט בטכניקה.

אמנויות הלחימה מהוות מקור פרנסה למורים רבים. ורבים, אולי אף רוב האנשים, חסרים את הכישורים כדי להעשות אומני לחימה מיומנים. כישלון עלול לגרום להם לזנוח את אמנויות הלחימה, דבר שיפגע בהכנסות המורים.

    </font>
    
    </div>
    </div>

</asp:Content>

