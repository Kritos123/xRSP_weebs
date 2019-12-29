<%@ Page Language="C#" Theme="Register" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link  rel="stylesheet" type="text/css" href="style.css"/>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registrovat se</title>
</head>
<body style="background-color:#4F7D82">
    <form id="form1" runat="server">
       <h1>Zaregistrovat nového uživatele</h1> <br />
       
        <p>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Literal runat="server" ID="StatusMessage" />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click"  Text="Hlavní stránka" href="#" class="button"/>
        </p>  
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="Jmeno" href="#" class="text" ></asp:Label>
&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" ForeColor="Black" Height="28px" Width="200px"></asp:TextBox>
        <br />
        &nbsp;&nbsp;<br />
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="Heslo" href="#" class="text"></asp:Label>
        <br />

        &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged" TextMode="Password" href="#" class="text" ForeColor="Black" Height="28px" Width="200px"></asp:TextBox>
        <br />
        &nbsp;&nbsp;&nbsp;<br />
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label3" runat="server" Text="Heslo znovu" href="#" class="text"></asp:Label>
        <br />
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox3" runat="server" TextMode="Password" href="#" class="text" ForeColor="Black" Height="28px" Width="200px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <br />
&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Uložit" OnClick="Button1_Click" href="#" class="button" />
    </form>
</body>
</html>
