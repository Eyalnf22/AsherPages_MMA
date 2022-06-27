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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><a name="up" style=" margin-left:100px;">
משמעות הקראטה</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div class="middle">

<div class="para">
<table  align="center" cellpadding="10" cellspacing="40" width="100%">
    <tr>
        <td rowspan="3" align="right">
            <img style="border:solid 2px black; border-radius:20px; "  src="images/meaning5.jpg" width="300" height="180"/><br /><br />
            <img style="border:solid 2px black; border-radius:20px; "  src="images/meaning4.jpg" width="300" height="180"/><br /><br />
           <img style="border:solid 2px black; border-radius:20px;" src="images/meaning6.jpg" width="270" height="180"/>

        </td>
        <td  rowspan="3" valign="top">
        <div style="background:white; border-radius:10px; box-shadow: 5px 10px 8px #888888;">
            <center><u><h1 style="font-size:35px; padding:10 20px;">משמעות המילה</h1>
                </u></center>
            <div style="background:white; padding:20px; ">
                <font size="4" face="Arial" style="line-height:1.4; padding:10px;">
            לפני המאה ה-20, באיי הריוקיו מהם הגיע הקראטה, לא היו נהוגים לרוב שמות לאמנויות הלחימה שתורגלו בבתי ספר ומשפחות שונות. לעיתים קרובות, אמנויות לחימה נקראו בפשטות "טה" ("יד", ברמיזה לשונית ללחימה בידיים). המילה קראטה אומצה בהדרגה באוקינאווה ויפן, ולאחר מכן בשאר העולם, במהלך המאה ה-20. מילה זו מורכבת ביפנית משתי סימניות: קרא ; 空) ו-טה (יד; 手). משמעות שתי הסימניות יחדיו היא "יד ריקה".
             במקור, השם קרא-טה נכתב עם סימניה אחרת ביפנית למילה 'קרא', אשר משמעותה היא 'סין' (או ליתר דיוק - נעשה שימוש בסימניה שמציינת את שושלת טאנג הסינית). כלומר, שמה המקורי של האמנות היה "היד הסינית" (בהתאם לעובדת היות שורשי הקראטה מאמנויות לחימה סיניות).
            </div>
            </font></div>
        </td>
        <td rowspan="3" >
           <img style="border:solid 2px black; border-radius:20px;" src="images/meaning2.jpg" width="270" height="180"/><br /><br />
           <img style="border:solid 2px black; border-radius:20px;" src="images/meaning1.jpg" width="270" height="180"/><br /><br />
           <img style="border:solid 2px black; border-radius:20px;" src="images/meaning3.jpg" width="270" height="180"/>
        </td>
    </tr>







  </table>  
    </div>
    </div>

</center>
</asp:Content>

