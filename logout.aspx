<%@ Page Title="" Language="C#" MasterPageFile="~/HomePage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
      

            if (Session["login"] == "yes" || Session["Admin"] == "yes")
            {
                Session.Abandon();
                Response.Redirect("HomePage.aspx");

                Response.Redirect(Page.Request.Url.ToString(), true);
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

