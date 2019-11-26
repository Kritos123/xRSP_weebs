<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="master_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
    
    <title></title>
</head>
<body style="background-image:url('modra.png');">
    <form id="form1" runat="server">
        <div>

            <div style="background-image: url('master_1,0.png'); height: 649px; width: 1348px;margin-left:auto;margin-right:auto;margin-bottom:auto;margin-top:auto">
                <asp:ImageButton ID="ImageButton1" runat="server" style="position: relative; top: 158px; left: 795px; height: 94px; width: 437px" ImageUrl="~/master_tl_cl.png" OnClick="ImageButton1_Click" />
                <asp:ImageButton ID="ImageButton2" runat="server" style="position: relative; top: 291px; left: 357px; height: 95px; width: 434px" ImageUrl="~/master_1,0_tl_reg.png" OnClick="ImageButton2_Click" />
                <asp:ImageButton ID="ImageButton3" runat="server" style="position: relative; top: 428px; left: -82px; height: 88px; width: 431px" ImageUrl="~/master_1,0_tl_pr.png" OnClick="ImageButton3_Click" />
        </div>
    </form>
</body>
</html>
