<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="master_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
    
    <title></title>
</head>
<body style="background-color:#4F7D82">
    <form id="form1" runat="server">
        

            <div style="background-image: url('Obrazky/master_1,0.png'); height: 649px; width: 1348px;margin-left:auto;margin-right:auto;margin-bottom:auto;margin-top:auto">
                <asp:ImageButton ID="ImageButton1" runat="server" style="position: relative; top: 554px; left: 159px; height: 63px; width: 298px" ImageUrl="~/Obrazky/master_tl_cl.png" OnClick="ImageButton1_Click" />
                <asp:ImageButton ID="ImageButton2" runat="server" style="position: relative; top: 555px; left: 590px; height: 64px; width: 296px" ImageUrl="~/Obrazky/master_1,0_tl_reg.png" OnClick="ImageButton2_Click" />
                <asp:ImageButton ID="ImageButton3" runat="server" style="position: relative; top: 554px; left: -90px; height: 62px; width: 301px" ImageUrl="~/Obrazky/master_1,0_tl_pr.png" OnClick="ImageButton3_Click" />
        </div>
    </form>
    <p style="color: #FFFFFF; position: relative; text-align:center;"  >
        V případě problému pište na e-mailovou adresu: helpdesk.logospolytechnikos@help.cz</p>
    <p style="color: #FFFFFF; position: relative; text-align:center;"  >
        Návod k obsluze stránek je zde: <a href="Navod.aspx">Návod</a> </p>
</body>
</html>
