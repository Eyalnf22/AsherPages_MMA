<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">
    //link
    string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\MyUsers.mdf;Integrated Security=True;User Instance=True";


    string str = "<form method='post' action='admin.aspx'><table  cellspacing='0'  border='2' style=' background-color:white; width:70%; '> <tr> <th>Delete</th> <th>UserName</th> <th>Name</th> <th>Id</th> <th>Password</th> <th>City</th>  <th>Street</th> <th>Gender</th> <th>Email</th>  <th>DD</th> <th>MM</th> <th>YY</th> <th>PhoneNumber</th> <th>Country</th></tr>";
    int  count = 0;
         double countMales = 0;
         double countFemales = 0;
         double countOther = 0;
         string MalesStr = "0";
         string FemalesStr ="0" ;
         string OtherStr ="0";
         bool flagG = true;
         bool flagYY = true;
         protected void Page_Load(object sender, EventArgs e)
         {
             //update
             string PasswordSet = Request.Form["PasswordSet"];
             string UserNameSet = Request.Form["UserNameSet"];
             string subSet = Request.Form["subSet"];
             string decide =  Request.Form["decide"];
             string Change = "Name";
             switch (decide)
             {
                                
                 case "סיסמה":
                     Change = "Password";
                     break;
                 case "תעודת זהות":
                     Change = "Id";
                     break;
                 case "שם מלא":
                     Change = "Name";
                     break;
                 case "עיר":
                     Change = "City";
                     break;
                 case "רחוב":
                     Change = "Street";
                     break;
                 case "מדינה":
                     Change = "Country";
                     break;
                 case "מין":
                     Change = "Gender";
                     break;
               case "אימייל":
                     Change = "Email";
                     break;
               case "יום לידה":
                     Change = "DD";
                     break;
               case "חודש לידה":
                     Change = "MM";
                     break;
               case "שנת לידה":
                     Change = "YY";
                     break;
               case "מספר טלפון":
                     Change = "PhoneNumber";
                     break;
                   
             }
             if (subSet != null)
             {

                 string cmdStrSet = string.Format("UPDATE MyUsersTBL1 SET {0} = N'{1}' WHERE (UserName = N'{2}')", Change, PasswordSet, UserNameSet);
                 SqlConnection conObjSet = new SqlConnection(conStr);
                 SqlCommand cmdObjSet = new SqlCommand(cmdStrSet, conObjSet);
                 conObjSet.Open();
                 cmdObjSet.ExecuteNonQuery();
                 conObjSet.Close();

             }

             //
             
             
             
             //login sesion
             if (Session["Admin"] != "yes")
             {
                 Response.Redirect("login.aspx");
             }
             if (Request.Form["show"] != null)
             {

             //
                 
             //filters


                 //חתך תאריך
                 string MM = Request.Form["MM"];
                 string YY = Request.Form["YY"];
                 if (YY != "" && MM != "")
                 {
                     flagYY = false;
                 }
                 
                 string cmdStrYY = string.Format("SELECT * FROM MyUsersTBL1 WHERE(MM = N'{0}') AND (YY = N'{1}') ", MM, YY);
                 SqlConnection conObjYY = new SqlConnection(conStr);
                 SqlCommand cmdObjYY = new SqlCommand(cmdStrYY, conObjYY);
                 conObjYY.Open();
                 SqlDataReader drYY = cmdObjYY.ExecuteReader();
                 if (drYY.HasRows)
                 {
                     while (drYY.Read())
                     {
                         if (flagG)
                         {
                             str += "<tr></td><td><input  type='submit' class='robot' value='מחק' style='background-color:red;' name='"+drYY["UserName"]+"' /> </td> <td>" + drYY["UserName"] + "</td><td>" + drYY["Name"] + "</td><td>" + drYY["Id"] + "</td> <td>" + drYY["Password"] + "</td><td>" + drYY["City"] + "</td><td>" + drYY["Street"] + "</td> <td>" + drYY["Gender"] + "</td><td>" + drYY["Email"] + "</td><td>" + drYY["DD"] + "</td> <td>" + drYY["MM"] + "<td>" + drYY["YY"] + "</td><td>" + drYY["PhoneNumber"] + "</td><td>" + drYY["Country"] + "</td></tr>";
                         }
                     }
                 }
                 conObjYY.Close();
                 
                 
                 //חתך מין
                 string Gender = Request.Form["Gender"];
                 if (Gender != "")
                 {
                     flagG = false;
                 }
                 
                 string cmdStrGen = string.Format("SELECT * FROM MyUsersTBL1 WHERE(Gender = N'{0}')", Gender);
                 SqlConnection conObjGen = new SqlConnection(conStr);
                 SqlCommand cmdObjGen = new SqlCommand(cmdStrGen, conObjGen);
                 conObjGen.Open();
                 SqlDataReader drGen = cmdObjGen.ExecuteReader();
                 if (drGen.HasRows)
                 {
                     while (drGen.Read())
                     {
                         if (flagYY)
                         {
                             str += "<tr></td><td><input  type='submit' class='robot' value='מחק' style='background-color:red;' name='" + drGen["UserName"] + "' /> </td>  <td>" + drGen["UserName"] + "</td><td>" + drGen["Name"] + "</td><td>" + drGen["Id"] + "</td> <td>" + drGen["Password"] + "</td><td>" + drGen["City"] + "</td><td>" + drGen["Street"] + "</td> <td>" + drGen["Gender"] + "</td><td>" + drGen["Email"] + "</td><td>" + drGen["DD"] + "</td> <td>" + drGen["MM"] + "<td>" + drGen["YY"] + "</td><td>" + drGen["PhoneNumber"] + "</td><td>" + drGen["Country"] + "</td></tr>";
                         }
                     }
                 }
                 conObjGen.Close();

                 //חתך ברירת מחדל
                 string cmdStr = string.Format("SELECT * FROM MyUsersTBL1");
                 SqlConnection conObj = new SqlConnection(conStr);
                 SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
                 conObj.Open();
                 SqlDataReader dr = cmdObj.ExecuteReader();
                 if (dr.HasRows)
                 {
                     while (dr.Read())
                     {
                         if (flagG && flagYY)
                         {
                             str += "<tr></td><td><input  type='submit' class='robot' value='מחק' style='background-color:red;' name='" + dr["UserName"] + "' /></td>  <td>" + dr["UserName"] + "</td><td>" + dr["Name"] + "</td><td>" + dr["Id"] + "</td> <td>" + dr["Password"] + "</td><td>" + dr["City"] + "</td><td>" + dr["Street"] + "</td> <td>" + dr["Gender"] + "</td><td>" + dr["Email"] + "</td><td>" + dr["DD"] + "</td> <td>" + dr["MM"] + "<td>" + dr["YY"] + "</td><td>" + dr["PhoneNumber"] + "</td><td>" + dr["Country"] + "</td>" + "</tr>";
                         }
                         count++;
                     }
                     str += "</table></form>";
                     count.ToString();
                 }
                 conObj.Close();
                 if (flagG == false && flagYY == false)
                 {
                     Response.Redirect("admin.aspx");
                 }

    
                 
                 
                 
                 
                 //
                 
                 
                 
                 
                 //statistics
                 string cmdStrMales = string.Format("SELECT Gender FROM MyUsersTBL1 WHERE (Gender = N'זכר')");
                 SqlConnection conObjMales = new SqlConnection(conStr);
                 SqlCommand cmdObjMales = new SqlCommand(cmdStrMales, conObjMales);
                 conObjMales.Open();
                 SqlDataReader drMales = cmdObjMales.ExecuteReader();

                 while (drMales.Read())
                 {
                     countMales++;
                 }
                 conObjMales.Close();

                
                 
                
                 
                 string cmdStrFemales = string.Format("SELECT Gender FROM MyUsersTBL1 WHERE (Gender = N'נקבה')");
                 SqlConnection conObjFemales = new SqlConnection(conStr);
                 SqlCommand cmdObjFemales = new SqlCommand(cmdStrFemales, conObjFemales);
                 conObjFemales.Open();
                 SqlDataReader drFemales = cmdObjFemales.ExecuteReader();

                 while (drFemales.Read())
                 {
                     countFemales++;
                 }
                 conObjFemales.Close();


                 string cmdStrOthers = string.Format("SELECT Gender FROM MyUsersTBL1 WHERE (Gender = N'אחר')");
                 SqlConnection conObjOthers = new SqlConnection(conStr);
                 SqlCommand cmdObjOthers = new SqlCommand(cmdStrOthers, conObjOthers);
                 conObjOthers.Open();
                 SqlDataReader drOthers = cmdObjOthers.ExecuteReader();

                 while (drOthers.Read())
                 {
                     countOther++;
                 }
                 conObjOthers.Close();



                 MalesStr = (Math.Round((countMales * 100) / count)).ToString();
                 FemalesStr = (Math.Round((countFemales * 100) / count)).ToString();
                 OtherStr = (Math.Round((countOther * 100) / count)).ToString();
                 if (count == 0)
                 {
                     MalesStr = "0";
                     FemalesStr = "0";
                     OtherStr = "0";
                 }
                 //
                 
             }
             
             //delete

             string cmdStrDel = string.Format("SELECT UserName FROM MyUsersTBL1");
             SqlConnection conObjDel = new SqlConnection(conStr);
             SqlCommand cmdObjDel = new SqlCommand(cmdStrDel, conObjDel);
             conObjDel.Open();
             SqlDataReader drDel = cmdObjDel.ExecuteReader();
             if (drDel.HasRows)
             {
                 while (drDel.Read())
                 {
                     if (Request.Form["" + drDel["UserName"] + ""] != null)
                     {
                         string cmdStrD2 = string.Format("DELETE FROM MyUsersTBL1 WHERE UserName=N'" + drDel["UserName"] + " '  ");
                         SqlConnection conObjD2 = new SqlConnection(conStr);
                         SqlCommand CmdObjD2 = new SqlCommand(cmdStrD2, conObjD2);
                         conObjD2.Open();
                         CmdObjD2.ExecuteNonQuery();
                         conObjD2.Close();
                     }

                 }


             }
             conObjDel.Close();
             
             
             //
         }
          
    
    
    
    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
גישה למנהל
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
גישה למנהל
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div class="middle" style="height:160%; background-image:radial-gradient(circle, #ff3333 50%, #ff704d);">
<div class="para">
<form  method="post" action="admin.aspx">
<div style=" direction:rtl;">
<input type="submit" value="רענן פרטי משתמשים" name="show" style=" position:relative; cursor:pointer; border:solid 2px #ffb3b3;background :linear-gradient(180deg,red, #ff6666) ;width:280px; top:10; right:20;  height:54px; font-size:25px;font-family:Guttman Hatzvi;border-radius:14px;color:white;"/>
<span class= "text">
<br />
<br />
<b>  בחר את הסננים (חתכים)</b><br />
<form method="post"  action="admin.aspx">מין:
<select id="date" name="Gender" class="date">
    <option></option>
    <option>זכר</option>
    <option>נקבה</option>
    <option>אחר</option>
</select>
<br /><br />
<b>או</b><br />
<b>חובה למלא את שניהם!</b>
<br /><br />
שנת לידה:
<select id="YY" name="YY" style="width:70px; right:4px;" class="date">
        <option ></option>
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

חודש:<select id="MM"   name="MM" class="date">
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
    </select><br />


</form>
</span>
</div>
</form>
<br />
<br />


<div style=" height:50%;overflow:auto; background:#ff9980; direction:ltr; width:100%;" >
<%=str %>
<center><span class="text"><b>
הכנס את שם המשתמש והסיסמה החדשה שברצונך לעדכן עבורו
</span></b>
<div style=" direction:rtl;">
<table  dir="rtl"  cellspacing='0'  border='2' style=' background-color:white; width:70%;'>
<form  action="admin.aspx" method="post">
    <tr>
     <td>
        <input type="text" style="font-size:20;" name="UserNameSet" placeholder="הכנס שם משתמש"/>
     </td>
     <td>
        <select name="decide" class="date" style="width:200px;">
            <option>תעודת זהות</option>
            <option>סיסמה</option>
            <option>שם מלא</option>
            <option>עיר</option>
            <option>רחוב</option>
            <option>מדינה</option>
            <option>מין</option>
            <option>אימייל</option>
            <option>יום לידה</option>
            <option>חודש לידה</option>
            <option>שנת לידה</option>
            <option>מספר טלפון</option>
        </select>   
     </td>
     <td>
        <input type="text" style="font-size:20;" name="PasswordSet" placeholder="הכנס ערך" />     
     </td>
     <td>
        <input type="submit"  name="subSet" value="עדכן" class="robot" style="background:orange;"/>          
     </td>
    </tr>
    </form>
</table>
</div>
</center>
</div>
<br />
<div style=" direction:rtl;">
<div class="text"><b>
מספר המשתמשים הקיימים האתר:<%=count %> ,התנתונים מעוגלים כלפי מעלה באומדן<br />
<span id="males" style="color:Red;">הבנים:<%=MalesStr%>%</span><br />
<span id="females" style="color:blue;   ">הבנות:<%=FemalesStr%>%</span><br />
<span id="others" style="color:green; ">אנשים מוגדרים ניטרלי:<%=OtherStr%>%</span><br />
<br />
<div style=" position:relative;">
<canvas id="myCanvas" width="240" height="200" style="border:1px solid white; background-color:white;">
</canvas>
</div>

</b>
</div>
  </div>
</div>



</div>
<script type="text/javascript">
    var filters = document.getElementsByName("filter");
    for (var i = 0; i < filters.length; i++) {
    //alert(filters[i].value);
    //alert(filters[i].checked);
    
}


    var c = document.getElementById("myCanvas");
    var ctx = c.getContext("2d");
    ctx.fillStyle = "red";
    var x=c.height/5.5;
    var y = c.height;
    var M = <%=MalesStr%>;
    var F = <%=FemalesStr%>;
    var O = <%=OtherStr%>;
    ctx.fillRect(x, y, 40, -M * 2);
    ctx.fillStyle = "blue";
    ctx.fillRect(x + 70, y, 40, -F * 2);
    ctx.fillStyle = "green";
    ctx.fillRect(x+140, y, 40, -O*2);


</script>
</asp:Content>

