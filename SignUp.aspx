<%@ Page Title="" Language="C#" MasterPageFile="~/HomePage.master" %>
<%@import Namespace="System.Data.SqlClient"  %>
<script runat="server">
    string userDouble;
    bool Defend = false;
    public static bool SpecialKey(string userName)
    {
        string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\MyUsers.mdf;Integrated Security=True;User Instance=True";
        string cmdStr = string.Format("SELECT UserName FROM MyUsersTBL1 WHERE(UserName = N'{0}')", userName);
        SqlConnection conObj = new SqlConnection(conStr);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
        conObj.Open();
        SqlDataReader dr = cmdObj.ExecuteReader();

        if (dr.HasRows)
        {
            return false;
        }
        return true;
    }
    
    protected void Page_Load(object sender, EventArgs e)
    { 
       
        
        
        if (Request.Form["sub"] != null)
        {
            string userName = Request.Form["userName"];
            if (SpecialKey(userName) == false)
            {
                userDouble = "שם המתשמש כבר קיים";
            }
            else
            {
                Defend = true;
            }
            if (Defend)
            {
                string FullName = Request.Form["FullName"];
                string pass = Request.Form["pass"];
                string phoneNumber = Request.Form["phone"];
                string city = Request.Form["city"];
                string street = Request.Form["street"];
                string email = Request.Form["email"];
                string gender = Request.Form["gender"];
                string day = Request.Form["DD"];
                string month = Request.Form["MM"];
                string year = Request.Form["YY"];
                string favorite = Request.Form["favorite"];
                string looking = Request.Form["looking"];
                string perminent = Request.Form["perminent"];
                string think = Request.Form["think"];
                string country = Request.Form["country"];
                string ID = Request.Form["Id"];

                string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\MyUsers.mdf;Integrated Security=True;User Instance=True";
                string cmdStr = string.Format(" INSERT INTO MyUsersTBL1( Id,Name ,UserName, Password , City,Street ,Gender , Email, DD,MM ,YY ,Favorite ,Looking , Perminent,Think , PhoneNumber,Country) VALUES (N'{0}',N'{1}',N'{2}',N'{3}',N'{4}',N'{5}',N'{6}',N'{7}',N'{8}',N'{9}',N'{10}',N'{11}',N'{12}',N'{13}',N'{14}',N'{15}',N'{16}')", ID, FullName, userName, pass, city, street, gender, email, day, month, year, favorite, looking, perminent, think, phoneNumber, country);
                SqlConnection conObj = new SqlConnection(conStr);
                SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
                conObj.Open();
                cmdObj.ExecuteNonQuery();
                conObj.Close();
                Response.Redirect("HomePage.aspx");
            }
        }
    }

    
        
    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
הרשמה לאתר
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><a name="up" style=" margin-left:100px;">הרשמה</a>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<audio id="reset">
    <source src="audio/reset.mp3" type="audio/mp3">
</audio>

<audio id="myAudio">
    <source src="audio/tweet1.mp3" type="audio/mp3">
</audio>

<audio id="myAudioExit">
    <source src="audio/exit.mp3" type="audio/mp3">
</audio>

<audio id="subme">
    <source src="audio/sub.mp3" type="audio/mp3">
</audio>

<div class="middle" style="height:310%;">
<div class="para"  >
<center><h2 style="font-size:80px; font-family:Guttman Hatzvi;"><u>הרשמה לאתר</u></h2></center>
      <span class="text" style=" text-align: right;">
      <div style="text-align:right;">
      הירשמו לאתר שלנו כיד לקבל עדכונים חמים על כל חדשות ומידע הספורט והלחימה ,ותוכלו להנות מפרסים שווים!
       מלאו את הפרטים הדרושים למטה במטרה להיות אחד מהרשומים החשובים שלנו!
       </div>
       <br /><br />
  <form action="SignUp.aspx" method="post" style="font-size:26px;" onsubmit="return CheckForm()">
       <table width="95%" border="0" align="center" style="background-color:#b3ffff; border-bottom:solid 2px;">

         <tr>
       <td style=" padding:30px; text-align:right; width:25%;">
            <b>שם מלא:</b><br />
             <input id="fullName" name="fullName" type="text" class="kelet1" style="width:70%;"  placeholder="הזן שם מלא..."/>
           <span style="color:Red;" id="CorrfullName"></span> </td>
            <td style=" padding:30px; text-align:right; width:20%;">
            <b>תעודת זהות:</b><br />
             <input id="ID" name="ID" type="text" class="kelet1" style="width:80%;"  placeholder="הזן תעודת זהות..."/>
             <span style="color:Red;" id="CorrID"></span> </td>
            <font color="red"><%=userDouble %></font>


           <td style=" padding:30px; text-align:right; width:20%;">
            <b>מספר טלפון:</b><br />
             <input id="phone" name="phone" type="text" class="kelet1" style="width:40%;" maxlength="15"  placeholder="הזן מספר טלפון..."/>
            <span style="color:Red;" id="Corrphone"></span></td>
       
       </tr>

       <tr>
       <td style=" padding:30px; text-align:right; width:25%;">
            <b>עיר:</b><br />
             <input  id="city" name="city" type="text" class="kelet1" style="width:70%;"  placeholder="הזן שם עיר..."/>
              <span style="color:Red;" id="Corrcity"></span>
            </td>

            <td style=" padding:30px; text-align:right; width:20%;">
            <b>רחוב:</b><br />
             <input id="street" name="street"  type="text" class="kelet1" style="width:80%;"  placeholder="הזן שם רחוב..."/>
            <span style="color:Red;" id="Corrstreet"></span>
            </td>


           <td style="padding:30px; text-align:right; width:30%;">
                 <b>דואר אלקטרוני:</b><br />
                <input type="text" name="email" class="kelet1" id="email" style="width:70%;"  maxlength="30" placeholder="הזן דואר אלקטרוני..." />
                <img src="images/qa.png" width="20" height="20"  class="qa"  onmouseover="helpersIn(0)" onmouseout="helpersOut(0)" />
                <span class="qabox" name="helper">
                <font size="2"><b>דואר אלקטרוני</b></font><br /><font face="Arial" size="1">
עליך לכתוב את הדואר האלקטרוני שלך <br />על מנת שתקבל התראות ישירות אליו </font>
                </span>
<span style="color:Red; font-size:20px;" id="Corremail2"></span>
<span style="color:Red; font-size:20px;" id="Corremail"></span>
            </td>
       
       </tr>

</table>
       <table  width="95%" border="0" align="center" style="background-color:#b3ffff;">
     


       <tr>
        <td style=" padding:30px; text-align:right; width:40%;">
            <b>שם משתמש:</b><br />
             <input id="username" name="userName" type="text" class="kelet1" style="width:65%;" size="10" maxlength="15" placeholder="הזן שם משתמש..." />
             <img src="images/qa.png" width="20" style="display:inline;" height="20"  class="qa"  onmouseover="helpersIn(1)" onmouseout="helpersOut(1)"  />
            <span class="qabox" name="helper">
            <font size="2"><b>שם משתמש</b></font><br /><font face="Arial" size="3">
הזן את שם המשתמש שלך באתר,<br />בעזרתו אנשים יוכלו לזהות אותך</font>
          </span>
<span style="color:Red; font-size:20px;" id="Corrusername"></span> 
            </td>

            <td  style="text-align:right;  width:30%;">
                <br /><b>סיסמה:</b><br />
                <input id="password" name="pass"  type="password" class="pass1" maxlength="25" placeholder="הזן סיסמה..." /><br />
                <span  id="passStatus"></span>
                <button type="button" onclick="show1()" id="name1" class="showed">הצג</button><img src="images/qa.png" width="20" height="20"  class="qa"  onmouseover="helpersIn(2)" onmouseout="helpersOut(2)"  />
                <span class="qabox" name="helper">
                <font size="2"><b>סיסמה</b></font><br /><font face="Arial" size="1">
הזן את הסיסמה הרצויה שלך למשתמש, <br />בעזרתה תוכל להכנס לחשבון הפרטי שלך</font>
                </span> <br />
<span style="color:Red; font-size:20px;" id="Corrpassword"></span> 

            </td>

             <td  style="text-align:right; width:40%;">
                <b>אימות סיסמא:</b><br />
                <input id="verPassword"   type="password" class="pass1" maxlength="25" placeholder="הזן אימות סיסמה..." /><br />
<span style="color:Red; font-size:20px;" id="CorrverPassword"></span> 
          
            </td> 
       </tr>

       <tr>
            
                <td style="padding:30px; text-align:right; width:30%;">
             <b>תאריך לידה:</b><font size="2"> (במספרים)</font><br />
יום: <select id="DD" name="DD" class="date" style="width:50px; right:16px;">
        <option></option>
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
        <option>6</option>
        <option>7</option>
        <option>8</option>
        <option>9</option>
        <option>10</option>
        <option>11</option>
        <option>12</option>
        <option>13</option>
        <option>14</option>
        <option>15</option>
        <option>16</option>
        <option>17</option>
        <option>18</option>
        <option>19</option>
        <option>20</option>
        <option>21</option>
        <option>22</option>
        <option>23</option>
        <option>24</option>
        <option>25</option>
        <option>26</option>
        <option>27</option>
        <option>28</option>
        <option>29</option>
        <option>30</option>
        <option>31</option>
        </select>
<span style="color:Red; font-size:20px;" id="CorrDD"></span> 
        <br />
חודש:<select  id="MM" name="MM" class="date">
        <option></option>
        <option>ספטמבר</option>
        <option>אוקטובר</option>
        <option>נובמבר</option>
        <option>דצמבר</option>
        <option>ינואר</option>
        <option>פברואר</option>
        <option>מרץ</option>
        <option>אפריל</option>
        <option>מאי</option>
        <option>יוני</option>
        <option>יולי</option>
        <option>אוגוסט</option>
    </select>
<span style="color:Red; font-size:20px;" id="CorrMM"></span> 
    
    <br />
שנה: <select id="YY" name="YY" style="width:70px; right:4px;" class="date">
        <option></option>
        <option>2020</option>
        <option>2019</option>
        <option>2018</option>
        <option>2017</option>
        <option>2016</option>
        <option>2015</option>
        <option>2014</option>
        <option>2013</option>
        <option>2012</option>
        <option>2011</option>
        <option>2010</option>
        <option>2009</option>
        <option>2008</option>
        <option>2007</option>
        <option>2006</option>
        <option>2005</option>
        <option>2004</option>
        <option>2002</option>
        <option>2002</option>
        <option>2001</option>
        <option>2000</option>
        <option>1999</option>
        <option>1998</option>
        <option>1997</option>
        <option>1996</option>
        <option>1995</option>
        <option>1994</option>
        <option>1993</option>
        <option>1992</option>
        <option>1991</option>
        <option>1990</option>
    </select>
<span style="color:Red; font-size:20px;" id="CorrYY"></span>     

             </td>


            <td style="text-align:right;  width:30%;">
 <img id="gender" src="images/unknown.png" width="45" height="45" hspace="10" style=" position:relative; top:10;"/>
<b>בחר מין:</b><br />
 <input type="radio" style="margin:10px 10px;  cursor:pointer;" name="gender" value ="זכר"  onclick="male()"/>זכר<br />
 <input type="radio" style="margin:10px 10px; cursor:pointer;" name="gender" value ="נקבה" onclick="female()"/>נקבה<br />
 <input type="radio" style="margin:10px 10px;  cursor:pointer;" name="gender"  value ="אחר" onclick="other()" />אחר
<span style="color:Red; font-size:20px;" id="Corrgender""></span> 
            </td>
                    <td style="text-align:right;  width:30%;">
                    <b>בחר מדינה:</b>
                    <select id="country" name="country" style="direction:rtl" style="width:140px; right:4px;" class="date">
        <option value=""></option>
        <option value="אוגנדה">אוגנדה</option>
        <option value="אוסטריה">אוסטריה</option>
        <option value="אוקראינה">אוקראינה</option>
        <option value="אזרביג`אן">אזרביג`אן</option>
        <option value="איי בהאמה">איי בהאמה</option>
        <option value="איי סיישל">איי סיישל</option>
        <option value="אינדונזיה">אינדונזיה</option>
        <option value="איראן">איראן</option>
        <option value="אל סלבדור">אל סלבדור</option>
        <option value="אלג`יריה">אלג`יריה</option>
        <option value="אנגולה">אנגולה</option>
        <option value="אנטיגואה וברבודה">אנטיגואה וברבודה</option>
        <option value="אפגניסטאן">אפגניסטאן</option>
        <option value="ארגנטינה">ארגנטינה</option>
        <option value="ארמניה">ארמניה</option>
        <option value="אתיופיה">אתיופיה</option>
        <option value="בולגריה">בולגריה</option>
        <option value="בוסניה הרצגובינה">בוסניה הרצגובינה</option>
        <option value="בורונדי">בורונדי</option>
        <option value="בחריין">בחריין</option>
        <option value="בלגיה">בלגיה</option>
        <option value="בנגלדש">בנגלדש</option>
        <option value="ברבדוס">ברבדוס</option>
        <option value="ברזיל">ברזיל</option>
        <option value="ג`יבוטי">ג`יבוטי</option>
        <option value="גאבון">גאבון</option>
        <option value="גווטמלה">גווטמלה</option>
        <option value="גינאה">גינאה</option>
        <option value="גינאה-ביסאו">גינאה-ביסאו</option>
        <option value="גרוזיה">גרוזיה</option>
        <option value="גרנדה">גרנדה</option>
        <option value="דנמרק">דנמרק</option>
        <option value="האיים המלדיביים">האיים המלדיביים</option>
        <option value="הודו">הודו</option>
        <option value="הולנד">הולנד</option>
        <option value="הונגריה">הונגריה</option>
        <option value="הייטי">הייטי</option>
        <option value="הרפובליקה הדומיניקנית">הרפובליקה הדומיניקנית</option>
        <option value="ויטנאם">ויטנאם</option>
        <option value="ונצואלה">ונצואלה</option>
        <option value="זימבבואה">זימבבואה</option>
        <option value="חוף השנהב">חוף השנהב</option>
        <option value="טובלו">טובלו</option>
        <option value="טונגה">טונגה</option>
        <option value="טנזניה">טנזניה</option>
        <option value="יוון">יוון</option>
        <option value="ירדן">ירדן</option>
        <option value="ישראל" selected>ישראל</option>
        <option value="לאוס">לאוס</option>
        <option value="לוב">לוב</option>
        <option value="לטביה">לטביה</option>
        <option value="ליטא">ליטא</option>
        <option value="לסוטו">לסוטו</option>
        <option value="מאוריציוס">מאוריציוס</option>
        <option value="מדגסקר">מדגסקר</option>
        <option value="מולדובה">מולדובה</option>
        <option value="מונקו">מונקו</option>
        <option value="מיינמר">מיינמר</option>
        <option value="מלאווי">מלאווי</option>
        <option value="מלטה">מלטה</option>
        <option value="מקדוניה">מקדוניה</option>
        <option value="מרוקו">מרוקו</option>
        <option value="נורווגיה">נורווגיה</option>
        <option value="ניו זילנד">ניו זילנד</option>
        <option value="ניקרגואה">ניקרגואה</option>
        <option value="נפאל">נפאל</option>
        <option value="סודאן">סודאן</option>
        <option value="סומליה">סומליה</option>
        <option value="סורינאם">סורינאם</option>
        <option value="סין">סין</option>
        <option value="סלובניה">סלובניה</option>
        <option value="סמואה">סמואה</option>
        <option value="סנגל">סנגל</option>
        <option value="סנט לוסיה">סנט לוסיה</option>
        <option value="ספרד">ספרד</option>
        <option value="סרי לנקה">סרי לנקה</option>
        <option value="עראק">עראק</option>
        <option value="פאלאו">פאלאו</option>
        <option value="פורטוגל">פורטוגל</option>
        <option value="פינלנד">פינלנד</option>
        <option value="פפואה ניו גיני">פפואה ניו גיני</option>
        <option value="פרגוואי">פרגוואי</option>
        <option value="צ`אד">צ`אד</option>
        <option value="צ`כיה">צ`כיה</option>
        <option value="קובה">קובה</option>
        <option value="חלקית קומורוס">חלקית קומורוס</option>
        <option value="קונגו">קונגו</option>
        <option value="קוסטה ריקה">קוסטה ריקה</option>
        <option value="קוריאה הצפונית">קוריאה הצפונית</option>
        <option value="קטאר">קטאר</option>
        <option value="קירגיזסטן">קירגיזסטן</option>
        <option value="קמבודיה">קמבודיה</option>
        <option value="קנדה">קנדה</option>
        <option value="קפריסין">קפריסין</option>
        <option value="רואנדה">רואנדה</option>
        <option value="רוסיה">רוסיה</option>
        <option value="שווייץ">שווייץ</option>
        <option value="תאילנד">תאילנד</option>
        <option value="תורכיה">תורכיה</option>
        <option value="תימן">תימן</option>
</select>
<span style="color:Red; font-size:20px;" id="Corrcountry"></span>             
            </td>
       </tr>

       </table>

       <table border="1" width="95%" border="0" align="center" style="background-color:#b3ffff;">

       
       
       <tr>
      
             <td style="padding:30px; text-align:right; width:10%;">
             <img src="images/mar1.jpg" width="380" height="220" style="float:left; margin-left: 20px; margin-top: 40px; border-radius:20px;" />
            <b><u>ענה על השאלות הבאות:</u><span style="color:Red; font-size:20px;" id="Corrfavorite"></span></b><br /><br />
                 <b> 1) מה סגנון הלחימה האהוב עליך?</b><br />
                    <input type="radio" name="favorite"  style="margin:16px 10px; cursor:pointer;"  value="קראטה" />קראטה<br />
                    <input type="radio" name="favorite"  style="margin:16px 10px; cursor:pointer;"  value="איגרוף" />איגרוף<br />
                    <input type="radio" name="favorite"  style="margin:16px 10px; cursor:pointer;"  value="טאקוונדו"/>טאקוונדו<br />
                    <input type="radio" name="favorite"  style="margin:16px 10px; cursor:pointer;" value="קרב מגע" />קרב מגע<br />
                    <input type="radio" name="favorite"  style="margin:16px 10px; cursor:pointer;" value="ג'ו ג'יטסו" />ג'ו ג'יטסו<br />
                    <input type="radio" name="favorite"  style="margin:16px 10px; cursor:pointer;" value="ג'ודו"/ >ג'ודו<br />
                    <input type="radio" name="favorite" style="margin:16px 10px; cursor:pointer;" value="אחר"/ >אחר
            
            <br />
      
             </td>
             <tr>
                  
             <td style="padding:30px; text-align:right; width:60%; ">
             <img src="images/mar3.jpg" width="350" height="220" style="float:left; margin-left: 20px; margin-top: 40px; border-radius:20px;" />

            <b> 2) מה אתה מחפש באתר זה ?<span style="color:Red; font-size:20px;" id="Corrlooking"></span></b><br /><br />
             <input type="checkbox" name="looking" style="margin:16px 10px; cursor:pointer;" value="ללמוד על אומנויות הלחימה השונות"/ >ללמוד על אומנויות הלחימה השונות<br />
             <input type="checkbox" name="looking" style="margin:16px 10px; cursor:pointer;" value="להיחשף לאומנות לחימה חדשה שאוכל לעסוק בה"/ >להיחשף לאומנות לחימה חדשה שאוכל לעסוק בה<br />
             <input type="checkbox" name="looking" style="margin:16px 10px; cursor:pointer;" value="לשאוב השראה מסגנון מסוים"/ >לשאוב השראה מסגנון מסוים<br />
             <input type="checkbox" name="looking" style="margin:16px 10px; cursor:pointer;" value="אחר" / >אחר
            
                
                  </td>
       
       </tr>

       <tr>
       
             <td style="padding:30px; text-align:right; width:60%;">
            <b> 3) האם אתה מתאמן באופן קבוע על אומנות לחימה מסוימת?<span style="color:Red; font-size:20px;" id="Corrperminent"></span></b><br /><br />
             <input type="radio" name="perminent"  style="margin:16px 10px; cursor:pointer; value="כן!" "/>כן!<br />
             <input type="radio" name="perminent" style="margin:16px 10px; cursor:pointer; value="לא..."  "/>לא...
            
           
            </td>       
         
       </tr>

          <tr>
            
       
             <td style="padding:30px; text-align:right; width:60%;">
              <img src="images/mar2.jpg" width="300" height="200" style="float:left; margin-left: 20px; margin-top: 40px;  border-radius:20px;" />
            <b> 4) איך אתה חושב שהאתר יעזור לך? <span style="color:Red; font-size:20px;" id="Corrhelp"></span></b><br /><br />
             <input type="checkbox" name="help" style="margin:16px 10px; cursor:pointer; value="אני אלמד עוד על קראטה ואתחיל ללמוד אולי" "/ >אני אלמד עוד על קראטה ואתחיל ללמוד אולי<br />
             <input type="checkbox" name="help" style="margin:16px 10px; cursor:pointer; value="אני אפתח למגוון רחב של ידע" "/ >אני אפתח למגוון רחב של ידע<br />
             <input type="checkbox" name="help" style="margin:16px 10px; cursor:pointer; value="אני אפתח במחקר מעמיק על תולדות אומנויות הלחימה" "/ >אני אפתח במחקר מעמיק על תולדות אומנויות הלחימה<br />
             <input type="checkbox" name="help" style="margin:16px 10px; cursor:pointer; value="לא חושב שהוא יעזור" "/ >לא חושב שהוא יעזור
                        
            
            </td>       
         
       </tr>

       <tr>
      <td colspan="2" style="padding:30px; text-align:right; width:30%;">

      <b>אנא אשר את הבקשות הבאות: <span style="color:Red; font-size:20px;" id="Corrfinish"></span></b><br /><br /><span style="line-height:1.8;">
<input id="finish" type="checkbox" style="margin:16px 10px; cursor:pointer;" class="cek"  />אני מאשר/ת שקראתי את  <span onclick="privateEyal()" class="private">התנאים וההגבלות של התקנון .  </span><br />
<input type="checkbox" style="margin:16px 10px; cursor:pointer;" class="cek" />אני מעוניין/ת שהאתר ישלח לי עדכונים לכתובת האימייל שלי.<br />
<input type="checkbox" style="margin:16px 10px; cursor:pointer;"  class="cek"  />אני מעוניין/ת שהאתר ישלח לי תזכורות לבקר בו מדי פעם.
    
    </span>
                            
    </td>       
       
       </tr>

       <tr>
             <td colspan="2" style="padding:30px; text-align:center; width:30%;">
       
               <input type="submit" value="הרשם" class="submit" name="sub" />
                <input type="reset" value="נקה" class="naka" />
              

             </td>
       </tr>
       </form>
       </span>
        </table>  

            
        
       
 







<div class="opacity" id="pri" style="z-index:10;">

<div class="priform">
  <b><span class="closepri" onclick="exitPrivate()">&times</span></b>
   
<center>
<img src="images/star.png" width="30" height="30" align="left" class="star1"/>
<img src="images/star.png" width="30" height="30" align="right" class="star2"/>
<u><h1><font  color="#000e0e">תקנון האתר</font></h1></u>
</center>
<br /> 
<p style="margin:0 20px; font-family:Arial;">

-מטעמי נוחות נוקט התקנון בלשון זכר, ואולם כל הנאמר בו מתייחס לנשים ולגברים כאחד. 
<br />
<ol style="font-family:Arial;">
<li>השימוש באתר על תכניו והשירותים הניתנים בו, מוצעים לך בכפוף לקבלתך את כל התנאים הכלולים בתקנון זה.</li>
<li>הגלישה באתר ו/או הרשמתך כמנוי לקבלת שירותיו, ייחשבו להסכמה מצדך לתנאים אלה.</li>
<li>הנהלת האתר רשאית להשעות, לחסום או להפסיק לאלתר את גישת הגולש לשירות אם יפר את תנאי התקנון.</li>
<li>הנהלת האתר רשאית לעדכן את תנאי התקנון מעת לעת.</li>
<li>אין לעשות באתר או באמצעותו כל שימוש למטרות בלתי חוקיות.</li>
<li>אין לרשום אדם אחר שלא בהסכמתו ו/או ללא נוכחותו מול המסך בשעת הרישום ולאחר שהוסברו לו כל תנאי תקנון זה.</li>
<li>הרישום באתר הוא לשימוש האישי והבלעדי של הגולש אשר אינו רשאי להעביר את הרשאת השימוש לאדם אחר כלשהו. חובה מיוחדת לדייק לחלוטין בכל הפרטים האישיים הנדרשים לצורך הרישום ולצורך הקשר השוטף עם המנוי.</li>
<li>הנך אחראי באופן בלעדי לנכונות המידע אותו תפרסם או תעביר באמצעות האתר. הנהלת האתר אינה מקבלת על עצמה כל אחריות לתכנים המפורסמים או מועברים בין המנויים.</li>
<li>הנך מצהיר כי ידוע לך שלהנהלת האתר אין כל יכולת או אפשרות לבדוק, לנפות או לסנן את המנויים הנרשמים לאתר.</li>
<li><b>כל הזכויות שמורות ל"אייל בניית אתרים בע"מ"</b></li>
</ol>
</p>
</div>



</div>
<br />
<center>
<img src="images/star.png" width="30" height="30" />
<img src="images/star.png" width="30" height="30" />
<img src="images/star.png" width="30" height="30" />
</center>
    </div>
    </div>


<script type="text/javascript">
    function show1() {
        var Hiddens = "password,verPassword";
        var HiddensSplit = Hiddens.split(",");
        var x = document.getElementById("name1");
        for (var i = 0; i < HiddensSplit.length; i++) {
            if (document.getElementById(HiddensSplit[i]).type === "password") {
                document.getElementById(HiddensSplit[i]).type = "text";
                x.innerHTML = "הצג";
            }
            else {
                document.getElementById(HiddensSplit[i]).type = "password";
                x.innerHTML = "הסתר";
            }
        }
    }

    //תיבות טקסט צהובות שמסבירות מה זה כל קלט (איימיל סיסמס וכולי)
    var helpers = document.getElementsByName("helper");
    function helpersIn(num) {
        helpers[num].style.display = "block";
    }

    function helpersOut(num) {
        helpers[num].style.display = "none";
    }

    function privateEyal() {
        document.getElementById("pri").style.display = "block";
    }
    function male() {
        document.getElementById("gender").src = "images/male.png";
    }

    function female() {
        document.getElementById("gender").src = "images/female.png";
    }

    function other() {
        document.getElementById("gender").src = "images/other.png";
    }



    function exitPrivate() {
        document.getElementById("myAudioExit").play();
        document.getElementById("pri").style.display = "none";

    }


    function CheckTxt() {
        textCorret = true;
        var texts = "fullName,city,street,email,username";
        var textsSplit = texts.split(",");
        for (var i = 0; i < textsSplit.length; i++) {
            if (document.getElementById(textsSplit[i]).value == "") {
                document.getElementById("Corr" + textsSplit[i]).innerHTML = "מלא אותי!";
                textCorret = false;
            }
            else {
                document.getElementById("Corr" + textsSplit[i]).innerHTML = "";
            }
        }
        return textCorret;
    }

    function CheckOnlyNum(number) {

        var up = true;
        var low = true;
        var upper = number.toUpperCase();
        for (var i = 0; i < number.length; i++) {
            if (number.charAt(i) != upper.charAt(i)) {
                up = false;
            }
        }
        var lower = number.toLowerCase();
        for (var j = 0; j < number.length; j++) {
            if (number.charAt(j) != lower.charAt(j)) {
                low = false;
            }
        }
        if (low && up) {
            return true;
        }
        else {
            return false;
        }
    }
    setInterval(checkPass, 1);
    function checkPass() {
        var color;
        var strength = "";
        var password = document.getElementById("password").value;


        function WeakPass(password) {
            var WrongPasses = "123456,asdf,qwer,password";
            var x = WrongPasses.split(",");
            for (var i = 0; i < x.length; i++) {
                if (password == x[i]) {
                    return true;
                }
                else {
                    return false;
                }
            }
        }
        function NormalPass(password) {
            if (password.length > 6) {
                return true
            }
            else {
                return false;
            }
        }

        function StorngPass(password) {

            var ch = false;
            var num = false;
            password = password.toLowerCase();
            for (var i = 0; i < password.length; i++) {

                if (password.charAt(i) >= "a" && password.charAt(i) <= "z") {
                    ch = true;
                }
                if (password.charAt(i) >= "0" && password.charAt(i) <= "9") {
                    num = true;
                }
            }
            return num && ch;
        }


        if (WeakPass(password) || NormalPass(password) == false) {
            strength = "סיסמתך חלשה";
            color = "brown";
        }
        else if (NormalPass(password) && StorngPass(password) == false) {
            strength = "סיסמתך בינונית";
            color = "orange";

        }
        if (StorngPass(password) && NormalPass(password)) {
            strength = "סיסמתך חזקה";
            color = "green";
        }

        document.getElementById("passStatus").innerHTML = strength;
        document.getElementById("passStatus").style.color = color;
    }


    function CheckEmail() {
        var strodel = false;
        var dot = false;
        email = document.getElementById("email").value;
        for (var i = 0; i < email.length; i++) {
            if (email.charAt(i) == "@") {
                strodel = true;
            }
            if (email.charAt(i) == ".") {
                dot = true;
            }
        }
        var emailResult = strodel && dot;
        if (emailResult == false) {
            alert();
            document.getElementById("Corremail2").innerHTML = "אימייל לא תקין";
        }
        else {
            document.getElementById("Corremail2").innerHTML = "";
        }
        return emailResult;
    }

    function CheckFullName(fullName) {
        var flag = true;
        var wrongLetters = "!,<,>,@,#,$,%,/,&,*,(,),?,{,},[,],=,+,_";
        wrongLetters = wrongLetters.split(",");
        for (var i = 0; i < wrongLetters.length; i++) {
            for (var k = 0; k < fullName.length; k++) {
                if (wrongLetters[i] == fullName.charAt(k)) {
                    flag = false;
                    document.getElementById("CorrfullName").innerHTML = "תווים לא תקינים";
                }

            }
        }
        return flag;
    }
    function CheckEqual(a, b) {
        return a == b;
    }

    function CheckPhone(number) {

        return CheckOnlyNum(number) && number.charAt(0) == 0 && number.charAt(3) == "-" && number.charAt(7) == "-";
    }
    function CheckID(ID) {

        return CheckOnlyNum(ID) && ID.length >= 9;
    }

    function CheckHebrow(fullName) {
        var hebrow = true;
        var street = document.getElementById("street").value;
        var city = document.getElementById("city").value;
        var HebrowBoxs = [street, city, fullName];

        for (var i = 0; i < HebrowBoxs.length; i++) {
            for (var k = 0; k < HebrowBoxs[i].length; k++) {
                if (!(HebrowBoxs[i].charAt(k) >= "a" && HebrowBoxs[i].charAt(k) <= "z") || HebrowBoxs[i].charAt(k) == " " || HebrowBoxs[i].charAt(k) == "'" || !(HebrowBoxs[i].charAt(k) >= "A" && HebrowBoxs[i].charAt(k) <= "Z")) {
                }
                else {
                    hebrow = false;
                }
            }
        }
        return hebrow;
    }

    function CheckAllTxt(fullName) {


    }



    function CheckAllPass(username) {
        var password = document.getElementById("password").value;

        var verPassword = document.getElementById("verPassword").value;

        if (CheckEqual(password, username) && password != "") {
            document.getElementById("corrsame").innerHTML = "שם המשתמש והסיסמה זהים";

        }

        if (password == "") {

            document.getElementById("Corrpassword").innerHTML = "הזן סיסמה";
        }
        else {

            if (CheckEqual(password, verPassword) == false) {
                document.getElementById("Corrpassword").innerHTML = "אימות הסיסמה שגוי";
            }
            else {
                document.getElementById("Corrpassword").innerHTML = "";
            }
        }
        var CEPass = CheckEqual(password, verPassword);
        var CEUsername = !CheckEqual(password, username);
        return CEPass && CEUsername;


    }

    function CheckAllNum() {
        var PhoneNumber = document.getElementById("phone").value;
        var ID = document.getElementById("ID").value;
        if (CheckPhone(PhoneNumber) == false) {
            document.getElementById("Corrphone").innerHTML = "הכנס טלפון תקין";
        }
        else {
            document.getElementById("Corrphone").innerHTML = "";
        }
        if (CheckID(ID) == false) {
            document.getElementById("CorrID").innerHTML = "הכנס ת.ז תקינה";
        }
        else {
            document.getElementById("CorrID").innerHTML = "";
        }
        var Cphone = CheckPhone(PhoneNumber);
        var CId = CheckID(ID);
        return CId && Cphone;
    }

    function CheckBTns() {


        var CkNames = ["gender", "perminent", "favorite", "looking", "finish", "help"];
        var Cks = [false, false, false, false, false, false];
        var Sums = [0, 0, 0]; //כמה פעמים לחצו על סוג checkbox שזה רבפעמי
        for (var i = 0; i < CkNames.length; i++) {
            var CkBTns = document.getElementsByName(CkNames[i]);
            for (var k = 0; k < CkBTns.length; k++) {

                if (CkBTns[k].checked == true) {
                    Cks[i] = true;
                    if (i >= 3) {
                        Sums[i - 3]++;
                    }
                }
            }
        }
        for (var a = 0; a < Sums.length; a++) {
            if (Cks[a] == false) {
                return false;
            }
        }
        return true;
    }
    function CheckSelect() {
        var D = true;
        var dates = "DD,MM,YY,country";
        var datesSplit = dates.split(",");
        for (var i = 0; i < datesSplit.length; i++) {
            if (document.getElementById(datesSplit[i]).value == "") {
                document.getElementById("Corr" + datesSplit[i]).innerHTML = "עליך לבחור ";
                D = false;
            }
            else {
                document.getElementById("Corr" + datesSplit[i]).innerHTML = "";
            }
        }
        return D;
    }


    function CheckForm() {
        checkPass();
        var username = document.getElementById("username").value;
        var fullName = document.getElementById("fullName").value;
        var Cpass = CheckAllPass(username);
        var CNnum = CheckAllNum();
        var Cselect = CheckSelect();
        var Cbtn = CheckBTns();
        var Cad = admin();

        var Cemail = CheckEmail();
        var Ctxts = CheckTxt();
        var CfullName = CheckFullName(fullName);
        var Cheb = CheckHebrow(fullName);
        var Crad = CheckRadio();
        var result = Cpass && CNnum && Cselect && Cbtn && Cad && Cemail && Ctxts && CfullName && Cheb && Crad;
        return result;

    }


    function CheckRadio() {
        var flag1 = false;
        var flag2 = false;
        var flag3 = false;
        var flag4 = false;
        var flag5 = false;
        var flag6 = false;
        var myNameGender = document.getElementsByName("gender");
        var myNamePerminent = document.getElementsByName("perminent");
        var myNameFavorite = document.getElementsByName("favorite");
        var myNameLooking = document.getElementsByName("looking");
        var myNameHelp = document.getElementsByName("help");
        var myNameFinish = document.getElementById("finish");

        if (myNameFinish.checked == true) {
            flag6 = true;

        }
        for (var i = 0; i < myNameGender.length; i++) {
            if (myNameGender[i].checked == true) {
                flag1 = true;
            }
        }

        for (var j = 0; j < myNamePerminent.length; j++) {
            if (myNamePerminent[j].checked == true) {
                flag2 = true;
            }
        }

        for (var k = 0; k < myNameFavorite.length; k++) {
            if (myNameFavorite[k].checked == true) {
                flag3 = true;
            }

        }

        for (var i = 0; i < myNameLooking.length; i++) {
            if (myNameLooking[i].checked == true) {
                flag4 = true;
            }
        }

        for (var i = 0; i < myNameHelp.length; i++) {
            if (myNameHelp[i].checked == true) {
                flag5 = true;
            }
        }

        if (flag1 == false) {
            document.getElementById("Corrgender").innerHTML = "עליך לבחור";
        }
        else {
            document.getElementById("Corrgender").innerHTML = "";
        }
        if (flag2 == false) {
            document.getElementById("Corrperminent").innerHTML = "עליך לבחור";
        }
        else {
            document.getElementById("Corrperminent").innerHTML = "";
        }
        if (flag3 == false) {
            document.getElementById("Corrfavorite").innerHTML = "עליך לבחור";
        }
        else {
            document.getElementById("Corrfavorite").innerHTML = "";
        }
        if (flag4 == false) {
            document.getElementById("Corrlooking").innerHTML = "עליך לבחור";
        }
        else {
            document.getElementById("Corrlooking").innerHTML = "";
        }
        if (flag5 == false) {
            document.getElementById("Corrhelp").innerHTML = "עליך לבחור";
        }
        else {
            document.getElementById("Corrhelp").innerHTML = "";
        }
        if (flag6 == false) {
            document.getElementById("Corrfinish").innerHTML = "עליך לאשר את התקנון";
        }
        else {
            document.getElementById("Corrfinish").innerHTML = "";
        }




        return flag1 && flag2 && flag3 && flag4 && flag5 && flag6;
    }


    function admin() {
        var username = document.getElementById("username").value;
        var adminPAss = document.getElementById("password").value;
        if (username != "admin" && adminPAss != "1234") {
            return true;
        }
        return false;
    }


    function CheckBox5() {
        var countH = 0;
        var help = document.getElementsByNames("help");
        for (var i = 0; i < help.length; i++) {
            if (help[i].checked == true) {
                alert()
                countH++;
            }
        }
        if (countH >= 1 && countH <= 2) {
            return true;
        }
        else {
            return false;
        }
    }
</script>

    

</asp:Content>