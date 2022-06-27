<%@ Page Title="" Language="C#" MasterPageFile="~/HomePage.master" %>
<%@import Namespace="System.Data.SqlClient"  %>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != "yes" || Session["Admin"] == "yes")
        {
            Response.Redirect("login.aspx");
        }
        
        if (Request.Form["sub"] != null)
        {

            string pass = Request.Form["pass"];

            
            string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\MyUsers.mdf;Integrated Security=True;User Instance=True";
            string cmdStr = string.Format(" UPDATE MyUsersTBL1 SET Password = N'{0}' WHERE (UserName = N'{1}') ", pass, Session["MyuserNameForUpdate"]);
            SqlConnection conObj = new SqlConnection(conStr);
            SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
            conObj.Open();     
            cmdObj.ExecuteNonQuery();
            conObj.Close();
        }
    }
    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
עדכון פרטי משתמש
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><a name="up" style=" margin-left:100px;">עדכון פרטיך</a>
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

<div class="middle" style="height:110%;">
<div class="para"  >
<center><h2 style="font-size:80px; font-family:Guttman Hatzvi;"><u>עדכון הפרטים</u></h2></center>
      <span class="text" style=" text-align: right;">
      <div style="text-align:right;">
    כאן תוכל לעדכן את הפרטים האישייםש ל המשתמש שלך ולהתאים אותם כבקשתך
       </div>
       <br /><br />
  <form method="post" style="font-size:26px;" onsubmit="return CheckForm()">
       <table width="95%" border="0" align="center" style="background-color:#b3ffff; border-bottom:solid 2px;">

</table>
       <table  width="95%" border="0" align="center" style="background-color:#b3ffff;"> 
       <tr>
            <td  style="text-align:right;  width:30%;">
                <br /><b>סיסמה:</b><br />
                <span  id="passStatus"></span>

                <input id="password" name="pass"  type="password" class="pass1" maxlength="25" placeholder="הזן סיסמה..." /><br />
                <button type="button" onclick="show1()" id="name1" class="showed"> הצג</button>
            </td>

             <td  style="text-align:right; width:40%;">
                <b>אימות סיסמה:</b><br />
                <input id="verPassword"   type="password" class="pass1" maxlength="25" placeholder="הזן אימות סיסמה..." /><br />
            </td> 
       </tr>

       </table>

       

       
       
     
      
            
      

         <table border="1" width="95%" border="0" align="center" style="background-color:#b3ffff;">
         <tr>
             <td colspan="2" style="padding:30px; text-align:center; width:30%;">
       
               <input type="submit" value="עדכן" class="submit" name="sub" />
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
function privateEyal() {
    document.getElementById("pri").style.display = "block";
}



    function exitPrivate() {
        document.getElementById("myAudioExit").play();
        document.getElementById("pri").style.display = "none";

    }


    password = document.getElementById("password").value;
    verPassword = document.getElementById("verPassword").value; 
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
            color = "red";
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

    function CheckEqual() {
        return password == verPassword;
    }


    function CheckAllPass() {    
        return CheckEqual();
    }

function CheckForm() {
    checkPass();
    return CheckAllPass();
}
</script>
    

</asp:Content>