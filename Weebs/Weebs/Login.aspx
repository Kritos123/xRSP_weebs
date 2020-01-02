<%@ Page Language="C#" Theme="Login" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin" %>

<!DOCTYPE html>
<link  rel="stylesheet" type="text/css" href="style.css"/>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title> Přihlásit se </title>
    <style type="text/css">
        #Text1 {
            position: relative;
            top: 150px;
            left: 480px;
            height: 44px;
            width: 348px;
        }
        #Password1 {
            position: relative;
            top: 290px;
            left: 129px;
            height: 37px;
            width: 347px;
        }
    </style>
</head>
<body style="background-color:#4F7D82">
    <form id="form1" runat="server">
               <asp:Literal runat="server" ID="StatusText" Visible="true" />   
        <div style="margin: auto; background-image: url('/Obrazky/login.png'); height: 437px; width: 901px; height: 437px; width: 903px;">
            <asp:Button ID="Button1" runat="server" CssClass="button" style="position: relative; top: 358px; left: 721px; width: 114px; height: 30px" Text="Přihlásit se" OnClick="Button1_Click" ValidationGroup="login"  />
            <asp:TextBox ID="Login_textbox" runat="server" style="position: relative; top: 154px; left: 367px; height: 54px; width: 359px; margin-top: 0px;" OnTextChanged="Login_textbox_TextChanged"></asp:TextBox>
          
            <asp:TextBox ID="Password_textbox" runat="server" style="position: relative; top: 287px; left: 5px; height: 53px; width: 358px" TextMode="Password" OnTextChanged="Password_textbox_TextChanged"></asp:TextBox>
           
             <br />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           
             <asp:Button ID="Button2" runat="server"  CssClass="button"  OnClick="Button2_Click" style="position: relative; top: -70px; left: 300px; width:125px; height: 30px" Text="Hlavní stránka" />
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
            ControlToValidate="Login_textbox" ValidationGroup="login" ErrorMessage="Nebyl vyplněno uživatelské jméno">
        </asp:RequiredFieldValidator>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
            ControlToValidate="Password_textbox" ValidationGroup="login" ErrorMessage="Nebyl vyplněno heslo">
        </asp:RequiredFieldValidator>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
             </div>
    </form>
</body>
</html>
