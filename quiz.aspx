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
שאלון
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><a name="up" style=" margin-left:100px;">השאלון הגדול</a>
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

<div class="middle" style="height:410%;">
<div class="para" style="height:100%;" >
<center><h2 style="font-size:80px; font-family:Guttman Hatzvi;"><u>שאלון</u></h2></center>
      <span class="text" style=" text-align: right;">
      <div style="text-align:right;">
      שאלון זה מתייחס לכל המידע שנצמא בדפים שעל האתר הגדול, והוא מסכם את כל אומנויות הלחימה וכל מה  שצריך לדעת עליהן!<br />
      נסו לפתור אותו!
       </div>
       <br /><br />
  <form style="font-size:26px;">

      

       <table width="95%" border="0" align="center" style="background-color:#b3ffff;">

       
       <tr>
      
             <td style="padding:30px; text-align:right; width:10%;">
             <img src="images/saif3.jpg" width="380" height="220" style="float:left; margin-left: 20px; margin-top: 40px; border-radius:20px;" />
            <img src="images/sandClock.gif" width="80" height="70" style=" position:relative; top:20px"/>             
            <input id="startBtn" type="button" value="התחל טיימר!" onclick="preTime()" class="robot"/>
            <br /><br />
             <b><u>ענה על השאלות הבאות:</u></b><br /><br />
                 <b> 1) מהי החגורה הכי חזקה בקראטה מבין הבאות?</b><br />
                    <input type="radio" name="answer1"  style="margin:16px 10px; cursor:pointer;" />כתומה<br />
                    <input type="radio" name="answer1"  style="margin:16px 10px; cursor:pointer;"  />ירוקה<br />
                    <input type="radio" name="answer1" id="rightAns1"  style="margin:16px 10px; cursor:pointer;" />
                    <span id="rightq1" >הניקוד הכי גבוה שאפשר לקבל בתחרות</span><br />
                    <input type="radio" name="answer1"  style="margin:16px 10px; cursor:pointer;"/ >חומה<br />

            
            <br />
      
             </td>
             </tr>
               <tr>
      
             <td style="padding:30px; text-align:right; width:10%;">
             <img src="images/ig9.jpg" width="380" height="220" style="float:left; margin-left: 20px; margin-top: 40px; border-radius:20px;" />
                 <b> 2) מה המטרה העיקרית קרב המגע?</b><br />
                    <input type="radio" name="answer2"  style="margin:16px 10px; cursor:pointer;" />חיזוק שרירי הגב<br />
                    <input type="radio" name="answer2" id="rightAns2" style="margin:16px 10px; cursor:pointer;"  />
                    <span id="rightq2" >הניקוד הכי גבוה שאפשר לקבל בתחרות</span><br />
                    <input type="radio" name="answer2"  style="margin:16px 10px; cursor:pointer;" />הגברת הביטחון העצמי<br />
                    <input type="radio" name="answer2"  style="margin:16px 10px; cursor:pointer;" />לימוד קאטות<br />

            
            <br />
      
             </td>
             </tr>
               <tr>
      
             <td style="padding:30px; text-align:right; width:10%;">
             <img src="images/grap3.jpg" width="380" height="220" style="float:left; margin-left: 20px; margin-top: 40px; border-radius:20px;" />
                 <b> 3) מהו איפון?</b><br />
                    <input type="radio" name="answer3" id="rightAns3"  style="margin:16px 10px; cursor:pointer;" />
                    <span id="rightq3" >הניקוד הכי גבוה שאפשר לקבל בתחרות</span><br />
                    
                    <input type="radio" name="answer3"  style="margin:16px 10px; cursor:pointer;"  />הזמן שלוקח להגיע לחגורה שחורה<br />
                    <input type="radio" name="answer3"  style="margin:16px 10px; cursor:pointer;" />מגן שיניים <br />
                    <input type="radio" name="answer3"  style="margin:16px 10px; cursor:pointer;" />כלי נשק מימי הסמוראים<br />


            
            <br />
      
             </td>
             </tr>
             
               <tr>
      
             <td style="padding:30px; text-align:right; width:10%;">
             <img src="images/joj2.jpg" width="380" height="220" style="float:left; margin-left: 20px; margin-top: 40px; border-radius:20px;" />
                 <b> 4) מה פירוש המילה "סאן" ביפנית?</b><br />
                    <input type="radio" name="answer4"  style="margin:16px 10px; cursor:pointer;" />כוח<br />
                    <input type="radio" name="answer4"  id="rightAns4" style="margin:16px 10px; cursor:pointer;"  />שלוש 
                    <span id="rightq4" >התאבדות תוך כדי תקיעת סכין בבטן</span><br />
                    <input type="radio" name="answer4"  style="margin:16px 10px; cursor:pointer;" />קאטה<br />
                    <input type="radio" name="answer4"  style="margin:16px 10px; cursor:pointer;" />להתחיל<br />
            
            <br />
      
             </td>
             </tr>
               <tr>
      
             <td style="padding:30px; text-align:right; width:10%;">
             <img src="images/smor5.jpg" width="320" height="220" style="float:left; margin-left: 20px; margin-top: 40px; border-radius:20px;" />
                 <b>
                  5) מהו חראקירי?
                  </b><br />
                    <input type="radio" name="answer5"  style="margin:16px 10px; cursor:pointer;" />התאבדות תוך כדי תקיעת סכין בגב<br />
                    <input type="radio" name="answer5"  id="rightAns5" style="margin:16px 10px; cursor:pointer;"  />
                    <span id="rightq5" >התאבדות תוך כדי תקיעת סכין בבטן</span>
                    <br />
                    <input type="radio" name="answer5"  style="margin:16px 10px; cursor:pointer;" />חוקן ביפנית<br />
                    <input type="radio" name="answer5"  style="margin:16px 10px; cursor:pointer;" />מאכל יפני<br />

            
            <br />
      
             </td>
             </tr>
        

          <tr>
      
             <td style="padding:30px; text-align:right; width:10%;">
             <img src="images/smor1.jpg" width="310" height="220" style="float:left; margin-left: 20px; margin-top: 40px; border-radius:20px;" />
                 <b> 6) כמה שוקלת הקטאנה</b><br />
                    <input type="radio" name="answer6"  style="margin:16px 10px; cursor:pointer;" />1.5 ק"ג<br />
                    <input type="radio" name="answer6"  style="margin:16px 10px; cursor:pointer;"  />5 ק"ג<br />
                    <input type="radio" name="answer6"  id="rightAns6" style="margin:16px 10px; cursor:pointer;" />
                    <span id="rightq6" >2 ק"ג</span><br /> 
                    <input type="radio" name="answer6"  style="margin:16px 10px; cursor:pointer;"/ >3 ק"ג<br />

            
            <br />
      
             </td>
             </tr>

                <tr>
      
             <td style="padding:30px; text-align:right; width:10%;">
             <img src="images/jo2.jpg" width="380" height="220" style="float:left; margin-left: 20px; margin-top: 40px; border-radius:20px;" />
                 <b> 7) מה שמו של ג'ודוקא הישראלי?</b><br />
                    <input type="radio" name="answer7"  style="margin:16px 10px; cursor:pointer;" />לברון ג'יימס<br />
                    <input type="radio" name="answer7"  id="rightAns7" style="margin:16px 10px; cursor:pointer;"  />
                     <span id="rightq7" >שגיא מוקי</span><br />
                    <input type="radio" name="answer7"  style="margin:16px 10px; cursor:pointer;" />אנבול ריי<br />
                    <input type="radio" name="answer7"  style="margin:16px 10px; cursor:pointer;"/ >דוויד בולט<br />

            
            <br />
      
             </td>
             </tr>

                <tr>
      
             <td style="padding:30px; text-align:right; width:10%;">
             <img src="images/tak1.jpg" width="380" height="220" style="float:left; margin-left: 20px; margin-top: 40px; border-radius:20px;" />
                 <b> 8) מהו מקור הטאקוונדו?</b><br />
                    <input type="radio" name="answer8"  id="rightAns8" style="margin:16px 10px; cursor:pointer;" />
                    <span id="rightq8" >קוריאה</span><br />
                    <input type="radio" name="answer8"  style="margin:16px 10px; cursor:pointer;"  />יפן<br />
                    <input type="radio" name="answer8"  style="margin:16px 10px; cursor:pointer;" />סין<br />
                    <input type="radio" name="answer8"  style="margin:16px 10px; cursor:pointer;"/ >ישראל<br />

            
            <br />
      
             </td>
             </tr>

                <tr>
      
             <td style="padding:30px; text-align:right; width:10%;">
             <img src="images/kar4.jpg" width="380" height="220" style="float:left; margin-left: 20px; margin-top: 40px; border-radius:20px;" />
                 <b> 9) מהי קאטה?</b><br />
                    <input type="radio" name="answer9" id="rightAns9"  style="margin:16px 10px; cursor:pointer;" />
                    <span id="rightq9" >תבנית</span><br />
                    <input type="radio" name="answer9"  style="margin:16px 10px; cursor:pointer;"  />ריקוד<br />
                    <input type="radio" name="answer9"  style="margin:16px 10px; cursor:pointer;" />עינוי<br />
                    <input type="radio" name="answer9"  style="margin:16px 10px; cursor:pointer;"/ >נשימה<br />

            
            <br />
      
             </td>
             </tr>

                <tr>
      
             <td style="padding:30px; text-align:right; width:10%;">
             <img src="images/ig5.jpg" width="380" height="220" style="float:left; margin-left: 20px; margin-top: 40px; border-radius:20px;" />
                 <b> 10)עד כמה סיבובים יש באיגרוף מקצועי ?</b><br />
                    <input type="radio" name="answer10"  id="rightAns10"  style="margin:16px 10px; cursor:pointer;" />
                    <span id="rightq10" >12</span><br />
                    <input type="radio" name="answer10"  style="margin:16px 10px; cursor:pointer;"  />4<br />
                    <input type="radio" name="answer10"  style="margin:16px 10px; cursor:pointer;" />3<br />
                    <input type="radio" name="answer10"  style="margin:16px 10px; cursor:pointer;"/ >8<br />            
            <br />
      
             </td>
             </tr>

       </span>
             <tr>
             <td colspan="2" style="padding:30px; text-align:center; width:30%;">
       
               <input type="submit" value="שלח" class="submit"/>
                <input type="reset" value="נקה" class="naka" /><br /><br />
                <input onclick="checkMe()" type="button" value="בדוק!" class="robot" /><br /><br />
                <span id="results"></span>
             </td>
       </tr>
        </table>  
        </form>
            
</span>

<br />
<center>
<img src="images/star.png" width="30" height="30" />
<img src="images/star.png" width="30" height="30" />
<img src="images/star.png" width="30" height="30" />
</center>
    </div>
    </div>
    <script type="text/javascript">
        var sec =0;
        var startTimer = true;
        function preTime() {
       
            if (startTimer) {
                document.getElementById("startBtn").style.display = "none";
               countTime =  setInterval(time, 1000);
                clearInterval(preTimeId);
                startTimer = false              
            }
        }
        
            function time() {
            sec++;
            }


            function sumMinutes() {
            var minutes;
            minutes = parseInt(sec/60);
            return minutes;
            }

            function sumSeconds() {
            var seconds;
            seconds = sec % 60;
            return seconds;
            }

            function result() {
                var rightAnswers = 0;
                for (var i = 1; i <= 10; i++) {
                    if (document.getElementById("rightAns" + i).checked == true)
                        rightAnswers++;
                }
                return rightAnswers;
            }

            function showAnswers() {
                for (var i = 1; i <= 10; i++) {
                    if (document.getElementById("rightAns" + i).checked == true) {
                        document.getElementById("rightq" + i).style.backgroundColor = "lightGreen";
                    } 
                } 
            }

        function checkMe() {
            document.getElementById("results").innerHTML = "ענית על " + result() + " תשובות נכונות!   <br /> תוך "+ sumMinutes() +" דקות ו-"+ sumSeconds()+ " שניות ";
            showAnswers();
            clearInterval(countTime);
          
            
            
        }

    </script>

</asp:Content>