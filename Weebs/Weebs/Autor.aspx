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
            top: 145px;
            left: 567px;
            width: 784px;
        }
    </style>
</head>
<body  style="background-color:#4F7D82">
    <form id="form1" runat="server">
        <div style="height: 619px; margin-bottom: 106px;">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Obrazky/Autor.png" style="position: relative; top: 2px; left: 12px; margin-right: 0px; margin-top: 50px" Width="144px" />
            <asp:FileUpload ID="FileUpload1" runat="server" style="position: relative; top: 108px; left: 208px; height: 25px" />  
        <asp:Button ID="btnUpload" runat="server" Text="Nahrát" OnClick="Upload" CssClass="btn-primary" />  
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Logout" BackColor="#00CCFF" BorderColor="White" Font-Size="X-Large" ForeColor="White" style="position: relative; top: 53px; left: -778px; height: 37px; width: 119px" />
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
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="Nazev" style="position: relative"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox1" runat="server" style="position: relative; top: 0px; left: 23px"></asp:TextBox>
            &nbsp;&nbsp;<br />
            &nbsp;
            &nbsp;<asp:Label ID="Label1" runat="server" Text="Nazev stiznosti" style="position: relative"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" style="position: relative; top: 8px; left: 20px; width: 129px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
        &nbsp;&nbsp;<br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Text="Stiznost"></asp:Label>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Odeslat" style="position: relative; top: 124px; left: 33px; width: 166px; height: 32px" />
          
            <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine" style="position: relative; top: 8px; left: -128px"></asp:TextBox>
          
            <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" style="position: relative; top: 64px; left: -307px"></asp:TextBox>
          
        </div>
    </form>
</body>
</html>
