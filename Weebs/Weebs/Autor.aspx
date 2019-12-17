<%@ Page Language="C#"  Theme="Casopis_read" AutoEventWireup="true" CodeFile="Autor.aspx.cs" Inherits="Autor" %>

<!DOCTYPE html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link  rel="stylesheet" type="text/css" href="autor.css"/>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Autor</title>
   
</head>
<body>
 <h1>  &nbsp;&nbsp;&nbsp;&nbsp;Autor</h1>
<form id="form1" runat="server">  
  &nbsp;&nbsp;&nbsp;&nbsp; <div>&nbsp;&nbsp;&nbsp;&nbsp;<asp:FileUpload ID="FileUpload1" runat="server"  href="#" class="button"/> 
      &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnUpload" runat="server" Text="Nahrát" OnClick="Upload"  href="#" class="button" /> 
      &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Logout" href="#" class="button"/> <br/><br/><br/>

        <asp:GridView ID="GridView1" runat="server"               
            AutoGenerateColumns="False" CssClass="table" BorderColor="White" ForeColor="White">  
            <Columns>  
                <asp:BoundField DataField="Nazev" HeaderText="Název" /> 
                <asp:BoundField DataField="Jmeno" HeaderText="Jméno" />
                <asp:BoundField DataField="Verze" HeaderText="Verze" />
                <asp:TemplateField ItemStyle-HorizontalAlign="Center">  
                    <ItemTemplate>  
                        <asp:LinkButton ID="lnkDownload" runat="server" Text="Download" OnClick="DownloadFile"  
                            CommandArgument='<%# Eval("Id") %>' href="#" class="button"></asp:LinkButton>  
                    </ItemTemplate>  
                </asp:TemplateField>   
            </Columns>  
        </asp:GridView>  
            </div> 
     
  &nbsp;&nbsp;&nbsp;&nbsp;  <div> 
      &nbsp;&nbsp;&nbsp;&nbsp;  <asp:Label ID="Label3" runat="server" Text="Nazev"   ></asp:Label>
      &nbsp;&nbsp;&nbsp;&nbsp;   <asp:TextBox ID="TextBox1" runat="server" Height="20px" Width="154px"></asp:TextBox>
      &nbsp;&nbsp;&nbsp;&nbsp;   <asp:Label ID="Label1" runat="server" Text="Nazev stiznosti" ></asp:Label>
       &nbsp;&nbsp;&nbsp;&nbsp;  <asp:TextBox ID="TextBox2" runat="server"  Height="20px" Width="154px"></asp:TextBox>
       &nbsp;&nbsp;&nbsp;&nbsp;  <asp:Label ID="Label2" runat="server" Text="Stiznost"></asp:Label>
       &nbsp;&nbsp;&nbsp;&nbsp;  <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine"  Height="20px" Width="154px"></asp:TextBox>
       &nbsp;&nbsp;&nbsp;&nbsp;  <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Odeslat"  href="#" class="button" />

    </div>
                </form>
  
    
</body>
</html>
