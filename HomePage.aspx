<%@ Page Title="" Language="C#" MasterPageFile="~/HomePage.master" %>

<script runat="server">
    string strLogin;
     string strSignup;
     string strDis;
    protected void Page_Load(object sender, EventArgs e)
    {
        strDis = "inline-block";
         strLogin = "התחברות";
         strSignup = "הרשמה";
         if (Session["login"] == "yes" || Session["Admin"] == "yes")
         {
             strDis = "none";
             strSignup = "התנתק";
             strLogin = "כניסה למנהלים";
         }      
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
דף הבית
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><a name="up" style=" margin-left:100px;">דף הבית</a>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div class="middle">
<div class="para"  >
<center><h2 style="font-size:80px; font-family:Guttman Hatzvi;"><u>ברוכים הבאים!</u></h2></center>
      <div class="text" style=" text-align: right;">
ברוכים הבאים לאתר אומנויות הלחימה!, בוא תוכלו למצוא מידע בכל מיני סוגי לחימה,מהלכים,מידע בסיסי והיסטוריה ועוד.. לוחמים מכל העולם התראיינו באתר זה ומקומות מידע אמינים סיפקו מידע שמופיע פה! באתר יש למלעה מ-100 עמודים שנוצרו בשביל לשתף מידע!
<br />
כאן תוכלו להירשם לאתר כדי לקבל עידכונים מכל מקום בכל זמן!
<br />
<br />
<hr size="5" color="Teal"  width="80%"/>
    <center>
<a href="signUp.aspx"><input type="button" style=" display:<%=strDis %>;" class="btn" value="<%=strSignup %>" /></a>
<a href="login.aspx"><input type="button" style=" display:<%=strDis %>;" class="btn" value="<%=strLogin %>" /></a>
    </center>
<br />  
</div> 
<input style="left:5px; z-index:0;" type="image" class="slide" id="slideRight" onclick="slideRight()" src="images/rightArrow.png" width="30" height="30" />
    <img class="image" id="image1"  src="images/katare.png" width="325" height="200"/>
    <img class="image" id="image2"  src="images/saif.jpg" width="325" height="200" />
    <img class="image" id="image3"  src="images/jojo.jpg" width="325" height="200" />
<input style="right:5px; bottom:95px; " type="image" class="slide" id="slideLeft" onclick="slideLeft()" src="images/leftArrow.png" width="30" height="30"  disabled="disabled" />

    </div>
    </div>

    <script type="text/javascript">


        function slideLeft() {
            img1 = document.getElementById("image1");
            img2 = document.getElementById("image2");
            img3 = document.getElementById("image3");
            document.getElementById("slideRight").disabled = false;
            document.getElementById("slideLeft").disabled = true;
            op = 1;
            opacity = setInterval(opac, 10);

            function opac() {

                if (op < 0) {
                    clearInterval(opacity);
                    img1.src = "images/katare.png";
                    img2.src = "images/saif.jpg";
                    img3.src = "images/jojo.jpg";
                    opacityReturn = setInterval(opacReturn, 10);
                }
                else {
                    op -= 0.02;
                    img1.style.opacity = op;
                    img2.style.opacity = op;
                    img3.style.opacity = op;
                }
            }
            function opacReturn() {
                if (op == 1) {
                    clearInterval(opacityReturn);
                }
                else {
                    op += 0.02;
                    img1.style.opacity = op;
                    img2.style.opacity = op;
                    img3.style.opacity = op;
                }
            }
        }
        /////

        function slideRight() {

            img1 = document.getElementById("image1");
            img2 = document.getElementById("image2");
            img3 = document.getElementById("image3");
            document.getElementById("slideRight").disabled = true;
            document.getElementById("slideLeft").disabled = false;
            op = 1;
            opacity = setInterval(opac, 10);

            function opac() {

                if (op < 0) {
                    clearInterval(opacity);
                    img1.src = "images/joijo.jpg";
                    img2.src = "images/jodo.jpg";
                    img3.src = "images/igrof.jpg";
                    opacityReturn = setInterval(opacReturn, 10);
                }
                else {
                    op -= 0.02;
                    img1.style.opacity = op;
                    img2.style.opacity = op;
                    img3.style.opacity = op;
                }
            }
            function opacReturn() {
                if (op == 1) {
                    clearInterval(opacityReturn);
                    document.getElementById("slideRight").disabled = true;
                }
                else {
                    op += 0.02;
                    img1.style.opacity = op;
                    img2.style.opacity = op;
                    img3.style.opacity = op;
                }
            }
        }
    </script>
</asp:Content>