<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Admin page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body style="background-color:#4F7D82">
    <form id="form1" runat="server">
    
       
    
        <asp:Image ID="Image1" runat="server" Width="222px" Height="44px" ImageUrl="~/Admin.png" />   <asp:Button ID="Button3" runat="server" Text="Logout" Width="178px" Height="38px" />
    </p><p>  </p>
        
        <asp:Button ID="Button1" runat="server" Text="Users" Width="96px" OnClick="Button1_Click" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Articles" Width="100px" OnClick="Button2_Click" />
    
    </form>

    <div>

        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

    </div>
    
    <div>
        <asp:Table class="table table-striped" ID="tabel1" runat="server">

        </asp:Table>
    </div>
    

    </body>
</html>
