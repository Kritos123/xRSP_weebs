﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

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
        <div      <div style="background-image: url('http://localhost:52439/BG7.png'); height: 437px; width: 901px;">>
            <asp:Button ID="Button1" runat="server" BackColor="#006699" BorderColor="White" ForeColor="White" style="position: relative; top: 358px; left: 721px; width: 114px; height: 30px" Text="Přihlásit se" />
            <asp:TextBox ID="Login_textbox" runat="server" style="position: relative; top: 147px; left: 371px; height: 44px; width: 346px"></asp:TextBox>
            <asp:TextBox ID="Password_textbox" runat="server" style="position: relative; top: 292px; left: 17px; height: 46px; width: 342px" TextMode="Password"></asp:TextBox>
        </div>
    </form>
</body>
</html>
