<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Admin page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
    
<table ID="header" width="100%">
    <tr>
        <td>
            <p> Admin page </p>
        </td>
        <td style="align-content: right">
            <p> You are logged as:
                <asp:Label ID="Label2" runat="server"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" Height="33px" OnClick="Button3_Click" Text="Logout" Width="94px" />
            </p>
        </td>
    </tr>
</table>
    
        <p>
        <asp:Button ID="Button1" runat="server" Text="Users" Width="96px" OnClick="Button1_Click" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Articles" Width="100px" OnClick="Button2_Click" />
        </p>
       
        <div></div>
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
