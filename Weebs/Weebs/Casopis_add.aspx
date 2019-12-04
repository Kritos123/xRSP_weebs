<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Casopis_add.aspx.cs" Inherits="Casopis_add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .btn-primary {
            position: relative;
            top: 167px;
            left: -16px;
            height: 25px;
        }
        .table {
            position: relative;
            top: 104px;
            left: 286px;
            width: 784px;
        }
    </style>
</head>
<body  style="background-color:#4F7D82">
    <form id="form1" runat="server">
        <div style="height: 685px; margin-bottom: 106px;">
            <asp:FileUpload ID="FileUpload1" runat="server" style="position: relative; top: 46px; left: 158px; height: 25px" />  
        <asp:Button ID="btnUpload" runat="server" Text="Nahrát" OnClick="Upload" CssClass="btn-primary" />  
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            &nbsp;&nbsp;<br />
            &nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
        &nbsp;&nbsp;<br />
            &nbsp;&nbsp;<asp:Button ID="back" runat="server" Text="Zpět" OnClick="back_Click" style="position: relative; top: -59px; left: -3px; width: 57px;" />
            <asp:TextBox ID="cilslo_txt" runat="server" style="position: relative; top: 42px; left: 124px"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" style="position: relative" Text="Zadejte číslo vydání"></asp:Label>
        </div>
    </form>
</body>
</html>
