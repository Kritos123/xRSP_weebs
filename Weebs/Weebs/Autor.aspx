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
  &nbsp;&nbsp;&nbsp;&nbsp; <div>&nbsp;&nbsp;&nbsp;&nbsp;<asp:FileUpload ID="FileUpload1" runat="server"  ValidationGroup="upload"  href="#" class="button"/> 
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
            ControlToValidate="FileUpload1" ValidationGroup="upload" ErrorMessage="Nebyl vybrán soubor">
        </asp:RequiredFieldValidator>
      &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnUpload" runat="server" Text="Nahrát" OnClick="Upload"  href="#" class="button" causesvalidation="true" /> 
      &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Logout" href="#" class="button" causesvalidation="false"/> <br/><br/><br/>

        <asp:GridView ID="GridView1" runat="server"               
            AutoGenerateColumns="False" CssClass="table" BorderColor="White" ForeColor="White">  
            <Columns>  
                <asp:BoundField DataField="Nazev" HeaderText="Název" /> 
                <asp:BoundField DataField="Jmeno" HeaderText="Jméno" />
                <asp:BoundField DataField="Verze" HeaderText="Verze" />
                <asp:TemplateField ItemStyle-HorizontalAlign="Center">  
                    <ItemTemplate>  
                        <asp:LinkButton ID="lnkDownload" runat="server"  Text="Download" OnClick="DownloadFile"  
                            CommandArgument='<%# Eval("Id") %>'  class="button" causesvalidation="false"></asp:LinkButton>  
                    </ItemTemplate>  
                </asp:TemplateField>   
            </Columns>  
        </asp:GridView>  
            </div> 
     
  &nbsp;&nbsp;&nbsp;&nbsp;  <div> 
      &nbsp;&nbsp;&nbsp;&nbsp;  <asp:Label ID="Label3" runat="server" Text="Nazev"   ></asp:Label>
      &nbsp;&nbsp;&nbsp;&nbsp;   <asp:TextBox ID="TextBox1" runat="server" Height="20px" Width="154px"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="stiznost" runat="server"
            ControlToValidate="TextBox1" ErrorMessage="Nebyl vybrán soubor pro stížnost">
        </asp:RequiredFieldValidator>
      &nbsp;&nbsp;&nbsp;&nbsp;   <asp:Label ID="Label1" runat="server" Text="Nazev stiznosti" ></asp:Label>
       &nbsp;&nbsp;&nbsp;&nbsp;  <asp:TextBox ID="TextBox2" runat="server"  Height="20px" Width="154px"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="stiznost" runat="server"
            ControlToValidate="TextBox2" ErrorMessage="Nebyl vybrán nazev pro stížnost">
        </asp:RequiredFieldValidator>
       &nbsp;&nbsp;&nbsp;&nbsp;  <asp:Label ID="Label2" runat="server" Text="Stiznost"></asp:Label>
       &nbsp;&nbsp;&nbsp;&nbsp;  <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine"  Height="20px" Width="154px"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="stiznost" runat="server"
            ControlToValidate="TextBox3" ErrorMessage="Nebyla naspána stížnost">
        </asp:RequiredFieldValidator>
       &nbsp;&nbsp;&nbsp;&nbsp;  <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Odeslat"  href="#" class="button" causesvalidation="true" ValidationGroup="stiznost"/>

    </div>
                </form>
  
    
</body>
</html>
