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
היסטוריית הקראטה</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

<div class="middle" style="height:85%">

<div class="para">
<u><h1 style="font-size:35px; padding:10 20px;">היסטוריית הקראטה</h1></u>
<span style="float:left;">
<img style=" padding:10px; float:left; border-radius:30px; margin-left:30px" src="images/karate1.jpg" width="300" height="200"/>
</span>
<font size="4" face="Arial" style="line-height:1.4;">
קראטה הוא השם המודרני (תחילת המאה ה-20, בסביבות 1905) שניתן לקבוצה של כמה עשרות אמנויות לחימה בעלות שורשים היסטוריים קרובים. אמנויות לחימה אלה נחשבות כיום 'יפניות'. בפועל, מקורן באי היפני אוקינאווה,<br /> וניכרת בהן השפעה משמעותית של אמנויות לחימה שמקורן בדרום סין. כיום ישנה הפרדה ברורה בין סגנונות<br /> קראטה 'יפניים' (ויותר מודרניים) לאלה הנחשבים 'אוקינאווים'. 
<br /><br />
כל סגנונות הקראטה מאופיינים בדגש על שימוש בהכאה כאמצעי מרכזי ללחימה והגנה עצמית, חולקים ביניהם מגוון רחב של טכניקות ותנוחות גוף דומות או זהות, ומשתמשים בקאטה כאמצעי מרכזי לתרגול והעברת ידע. במהלך המאה ה-20, כל סגנונות הקראטה אימצו קוד לבוש אחיד (גי), וכן את שיטת סיווג ודירוג המתאמנים (המכונים 'קראטקה') בהתבסס על חגורות צבעוניות ושחורות. בדומה לאמנויות לחימה רבות אחרות מן המזרח, הקראטה המסורתי מלווה ברבדים תרבותיים עמוקים, המשליכים על אופן תרגול האמנות, ודורשים את אימוצה כ-'דרך חיים'.
    <br /><br />
    <br />
    <hr align="center" width="90%" color="black" size="6"/>
<br />

<img style="  padding:10px; float:left; position:static; margin-left:40px; margin-top:20px; border:solid 1px black;  border-radius:20px; "  src="images/karate2.jpg" width="300" height="240"/>
<u><h1 style="font-size:35px; padding:0 20px;">אופי</h1></u>


כזה הוא אופיו של הקראטה המסורתי. בו-בעת, קיימים גם סגנונות קראטה פחות מסורתיים ויותר ספורטיביים, שמאפיינים אלה פחות בולטים בהם, או שאינם קיימים כלל.<br /> מעבר להבחנה בין השיטות ובתי ספר השונים כיום מקובלת בעולם ההבחנה בין הקראטה המסורתי \ מקורי (Traditional Karate) לבין הקראטה המודרני \ ספורטיבי. שני זרמים אלה שונים מהותית זה מזה בהיבטים הפילוסופיים, טכניים ותחרותיים ומנוהלים בהתאמה על ידי שני הגופים העולמיים WTKF (מסורתי) ו-WKF (מודרני). <br /><br />


    </font>
    
    </div>
    </div>
</asp:Content>

