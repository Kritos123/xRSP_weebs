<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
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
<body>
    <form id="form1" runat="server">
         <asp:PlaceHolder runat="server" ID="LoginStatus" Visible="false">
            <p>
               <asp:Literal runat="server" ID="StatusText" />
            </p>
         </asp:PlaceHolder>
         <asp:PlaceHolder runat="server" ID="LogoutButton" Visible="false">
            <div>
               <div>
                  <asp:Button runat="server" OnClick="SignOut" Text="Log out" />
               </div>
            </div>
         </asp:PlaceHolder>
        
        <div style="background-image: url('http://localhost:52439/BG7.png'); height: 437px; width: 901px;">>
            <asp:PlaceHolder runat="server" ID="LoginForm" Visible="false">
            <asp:Button ID="Button1" runat="server" BackColor="#006699" BorderColor="White" ForeColor="White" style="position: relative; top: 358px; left: 721px; width: 114px; height: 30px" Text="Přihlásit se" OnClick="Button1_Click" />
            <asp:TextBox ID="Login_textbox" runat="server" style="position: relative; top: 147px; left: 371px; height: 44px; width: 346px" OnTextChanged="Login_textbox_TextChanged"></asp:TextBox>
            <asp:TextBox ID="Password_textbox" runat="server" style="position: relative; top: 292px; left: 17px; height: 46px; width: 342px" TextMode="Password" OnTextChanged="Password_textbox_TextChanged"></asp:TextBox>
            </asp:PlaceHolder>
             </div>
    </form>
</body>
</html>
