<%@ Page Language="C#" AutoEventWireup="true" CodeFile="edituser.aspx.cs" Inherits="edituser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </div>
        <br />
        Name:&nbsp;&nbsp;&nbsp;
        <br />
        <asp:Label ID="Label3" runat="server"></asp:Label>
        <br />
        <br />
        Defined
        Role:&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        Select new role:<br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_A503C7_weebsConnectionString %>" SelectCommand="SELECT * FROM [AspNetRoles] ORDER BY [Id]"></asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Name" Height="30px" Width="184px">
        </asp:DropDownList>
        <br />
        <br />
        <asp:CheckBox ID="CheckBox1" runat="server" Text="Override new role" />
        <br />
        <br />
        Email:<br />
        <asp:TextBox ID="TextBox2" name="email" runat="server" Width="238px" ></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Cancel" Width="117px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" type="submit" OnClick="Button1_Click" Text="Save" Width="103px" />
        <br />
    </form>
</body>
</html>
