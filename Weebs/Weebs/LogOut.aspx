﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LogOut.aspx.cs" Inherits="LogOut" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body  style="background-color:#4F7D82">
    <form id="form1" runat="server">
        <div style="height: 248px">
            <asp:Button ID="Button1" runat="server"  OnClick="Button1_Click" Text="Odhlásit" style="position: relative; top: 106px; width: 133px; left: 97px;" BackColor="#0066FF" BorderColor="White" ForeColor="White" />
            <p> &nbsp;&nbsp;&nbsp;&nbsp; Nyní jste úspěšně zaregistrován/zaregistrována. Vaše současná role je čtenář.<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nyní se odhlašte.</p>
            </div>
    </form>
</body>
</html>
