<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
            height: 379px;
        }
    </style>
</head>
<body  style="background-color:#4F7D82">
    <form id="form1" runat="server">
    <p>
        Admin page</p>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Admin.png" style="position: relative; top: 0px; left: 0px; height: 75px; width: 378px" />
        <asp:Button ID="Button1" runat="server" BackColor="#00CCFF" BorderColor="White" Font-Size="X-Large" OnClick="Button1_Click" style="position: relative; top: 73px; left: -305px; width: 208px; height: 63px" Text="Logout" />
    </form>
    <hr style="color: #FFFFFF; background-color: #FFFFFF; position: relative; top: -205px; left: 1px;" />


</body>
</html>
