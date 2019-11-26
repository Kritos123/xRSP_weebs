<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Autor.aspx.cs" Inherits="Autor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .btn-primary {
            position: relative;
            top: 107px;
            left: 225px;
            height: 25px;
        }
        .table {
            position: relative;
            top: 104px;
            left: 204px;
            width: 784px;
        }
    </style>
</head>
<body  style="background-color:#4F7D82">
    <form id="form1" runat="server">
        <div style="height: 422px; margin-bottom: 106px;">
            <asp:FileUpload ID="FileUpload1" runat="server" style="position: relative; top: 108px; left: 208px; height: 25px" />  
        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" CssClass="btn-primary" />  
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Logout" BackColor="#00CCFF" BorderColor="White" Font-Size="X-Large" ForeColor="White" style="position: relative; top: 58px; left: -629px; height: 37px; width: 119px" />
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Autor.png" style="position: relative; top: 13px; left: -748px; height: 38px; width: 122px" />
            <hr style="position: relative; top: 108px; left: 0px; background-color: #FFFFFF; color: #FFFFFF;" />
            <hr style="position: relative; top: 42px; left: 0px; margin-top: 7px; background-color: #FFFFFF; color: #FFFFFF;" />
        <asp:GridView ID="GridView1" runat="server"   
              
            AutoGenerateColumns="False" CssClass="table" BorderColor="White" ForeColor="White">  
            <Columns>  
                <asp:BoundField DataField="Nazev" HeaderText="Název" /> 
                <asp:BoundField DataField="Jmeno" HeaderText="Jméno" />
                <asp:BoundField DataField="Verze" HeaderText="Verze" />
                <asp:TemplateField ItemStyle-HorizontalAlign="Center">  
                    <ItemTemplate>  
                        <asp:LinkButton ID="lnkDownload" runat="server" Text="Download" OnClick="DownloadFile"  
                            CommandArgument='<%# Eval("Id") %>'></asp:LinkButton>  
                    </ItemTemplate>  
                </asp:TemplateField>  
            </Columns>  
        </asp:GridView>  
        </div>
    </form>
</body>
</html>
