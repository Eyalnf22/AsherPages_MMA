<%@ Page Title="" Language="C#" MasterPageFile="~/HomePage.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<script runat="server">
    int EnterCount = 0;  
          
    protected void Page_Load(object sender, EventArgs e)
    {

        
        string userName = Request.QueryString["userName"];
        string password = Request.QueryString["password"];
        
        if (Request.QueryString["sub"] != null)
        {      
            if (Login(userName, password))      
            {
                   
                Session["YourUserName"] = "," +userName;
                Session["MyuserNameForUpdate"] = userName;
                Session["login"] = "yes";
                
                Response.Redirect("HomePage.aspx");
            }
            else if (userName == "admin" && password == "1234")
            {
                Session["YourUserName"] = ", מנהל";                
                Session["Admin"] = "yes";
                Response.Redirect("HomePage.aspx");
            }
                
            else
            {
                Response.Redirect("SignUp.aspx");
            }
        }
       
    }

    public  bool Login(string userName, string password)
    {
        bool exist = false;
        string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\MyUsers.mdf;Integrated Security=True;User Instance=True";
        string cmdStr = string.Format("SELECT UserName , Password , Id FROM MyUsersTBL1 WHERE (UserName = N'{0}' AND  Password = N'{1}')", userName, password);
        SqlConnection conObj = new SqlConnection(conStr);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
        conObj.Open();
        SqlDataReader dr = cmdObj.ExecuteReader();
        if (dr.HasRows)
        {
            
            exist = true;
        }

        conObj.Close();
        return exist;

    }

    public static string IdSession(string userName, string password)
    {
        string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\MyUsers.mdf;Integrated Security=True;User Instance=True";
        string cmdStr = string.Format("SELECT Id FROM MyUsersTBL1 WHERE (UserName = N'{0}' AND  Password = N'{1}')", userName, password);
        SqlConnection conObj = new SqlConnection(conStr);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
        conObj.Open();
        SqlDataReader dr = cmdObj.ExecuteReader();
        if (dr.HasRows && dr.Read())
        {
            return dr["Id"].ToString();
        }
        return "0";

    }
    
  
    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
התחברות
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><a name="up" style=" margin-left:100px;">התחברות</a>
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

<div class="middle" style="height:140%;">
<div class="para" style="height:100%;" >
<center><h2 style="font-size:80px; font-family:Guttman Hatzvi;"><u>התחברות לאתר</u></h2></center>
      <span class="text" style=" text-align: right;">
    
       <br /><br />
  <form style="font-size:26px;" onsubmit="return CheckForm()" action="login.aspx" method="get">

       <table width="95%" border="0" align="center" style="background-color:#b3ffff;">
       <tr>
        <td style=" padding:30px; text-align:right; width:20%;">
            <b>שם משתמש:</b><br />
             <input id="userName" type="text" name="userName" class="kelet1" size="10" maxlength="15"  />
 
            </td>

            <td colspan="2" style="text-align:right;  width:40%;">
                <b>סיסמה:</b><br />
                <input id="password" type="password" class="pass1" name="password" maxlength="15"  placeholder="הזן סיסמה" />
                <button  type="button" onclick="show1()" id="name1" class="showed">הצג</button>
     

            </td>


       </tr>

      <tr>
             <td colspan="2" style="padding:30px; width:30%; text-align:right;">
       <center>
               <input type="submit" value="התחבר" class="submit" name="sub" onclick="sub()"/>
                <input type="reset" value="נקה" class="naka" />
                </center>

             </td>
       </tr>
       </table>
       </form>
       <br />
       <hr size="5" align="center" width="80%" color="Teal"/><br />
       </span>

    
   

<br />
<center>
<img id="images" style="border:solid 3px black;" src="loginImages/login1.jpg" width="700" height="500"/>
</center>
<div>
<span style="margin-right:25%; border:solid 1px black; background-color:white; padding:10px; font-size:20px; font-weight:700;" id="speedPara"></span>

<center>
<input  onclick="backOne()" class="robot" type="button" value="<"/>
<input id="faster" onclick="faster()" class="robot" type="button" value="האץ" />
<input id="start"  style=" position:relative; top:9; background-color:#e6e6e6;" onclick="play()" class="robot" type="image" src="loginImages/playBtn.png"/>
<input  id="slower" onclick="slower()" class="robot" type="button" value="האט"/>
<input onclick="skipOne()" class="robot" type="button" value=">"/>
<span style=" position:relative; right:20px; border:solid 1px black; border-radius:100%; padding:15px; background-color:white; font-weight:700; font-size:20px;" id="picNumPara"></span>

<br /><br />

<input onclick="smaller()" class="robot" type="button" style="width:40px;" value="-"/>
<input onclick="bigger()" class="robot" type="button"  style="width:40px;" value="+"/><br />
</center>
</div>

    </div>
    </div>
    <script type="text/javascript">
    
        var imaegsSum = 5;
        var picNum;
        var startBtn = document.getElementById("start");
        var images = document.getElementById("images");
        var run = 2000;
        picNum = 1;
        var slideShow;
        var playing = false;
        setInterval(update, 1);
        function update() {

            document.getElementById("speedPara").innerHTML = "מהירות: " + ((2000 - run) / 200 + 1);
            document.getElementById("picNumPara").innerHTML = picNum;
            if (2000 - run == 1800) {

                document.getElementById("faster").disabled = true;
            }
            else {
                document.getElementById("faster").disabled = false;
            }
            if (2000 - run == 0) {
                document.getElementById("slower").disabled = true;
            }
            else {
                document.getElementById("slower").disabled = false;
            }


        }
        function StartShow() {
            slideShow = setInterval('ImageSlide()', run);
        }
        function ImageSlide() {

            picNum++;
            images.src = "loginImages/login" + picNum + ".jpg";
            if (picNum == imaegsSum + 1) {
                images.src = "loginImages/login" + 1 + ".jpg";
                picNum = 1;
            }
        }
        function StopShow() {
            clearInterval(slideShow);
        }
        function faster() {
            run -= 200;
            clearInterval(slideShow);
            if (playing) {
                slideShow = setInterval('ImageSlide()', run);
            }

        }
        function slower() {
            run += 200;
            clearInterval(slideShow);
            if (playing) {
                slideShow = setInterval('ImageSlide()', run);
            }
        }
        function smaller() {
            images.width -= 20;
            images.height -= 20;
        }
        function bigger() {
            images.width += 20;
            images.height += 20;

        }
        function play() {
            if (playing == false) {
                playing = true;
                StartShow();
                startBtn.src = "loginImages/stopBtn.png"

            }
            else if (playing == true) {
                playing = false;
                clearInterval(slideShow);
                startBtn.src = "loginImages/playBtn.png"
            }
        }

        function skipOne() {
            if (picNum == imaegsSum) {
                picNum = 0;
            }
            picNum++;
            images.src = "loginImages/login" + picNum + ".jpg";

        }
        function backOne() {
            if (picNum == 1) {
                picNum = imaegsSum + 1;
            }
            picNum--;
            images.src = "loginImages/login" + picNum + ".jpg";
        }

        function sub() {
            document.getElementById("subme").play();
        }


        var helpers = document.getElementsByName("helper");
        function helpersIn(num) {
            helpers[num].style.display = "block";
        }

        function helpersOut(num) {
            helpers[num].style.display = "none";
        }

        function show1() {
            var y = document.getElementById("password");
            var x = document.getElementById("name1");
            if (y.type === "password") {
                y.type = "text";
                x.innerHTML = "הסתר";

            }
            else {
                y.type = "password";
                x.innerHTML = "הצג";

            }
        }


        function CheckForm() {
            return CheckTxt() && CheckPass();
        }

        function CheckTxt() {
            var userName = document.getElementById("userName").value;
            if (userName == "") {
                return false;
            }
            else {
                return true;
            }
        }

        function CheckPass() {
            var password = document.getElementById("password").value;
            if (password == "") {
                return false;
            }
            else {
                return true;
            }
        }
    </script>

</asp:Content>