<%@ Page Language="C#" Theme="Casopis_read" AutoEventWireup="true" CodeFile="Casopis_read.aspx.cs" Inherits="Casopis_read"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 <link  rel="stylesheet" type="text/css" href="Casopis_read.css"/>
<head runat="server" >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Članky</title>
   
    
    
</head>
<body style="background-color:#4F7D82"  >

     <h1 style="color: #FFFFFF"> Časopis </h1>
      <div>
        </div>

    <form id="form1" runat="server" >
     
 <p></p>  <asp:Button ID="Button1" runat="server" OnClick="Button1_Click"  Text="Hlavní stránka" href="#" class="button" /> </p>
          

        <asp:GridView ID="tabulka" runat="server"   
              
            AutoGenerateColumns="False" CssClass="table" BorderColor="White" ForeColor="White" Width="506px">  
            <Columns>  
                <asp:BoundField DataField="cl_nazev" HeaderText="Název" /> 
                <asp:BoundField DataField="cl_cislo" HeaderText="Číslo" />
                <asp:BoundField DataField="cl_datum" HeaderText="Datum vydání" />
              <asp:TemplateField ItemStyle-HorizontalAlign="Center">  
                    <ItemTemplate>  
                        <asp:Button ID="lnkDownload" runat="server" Text="Download" OnClick="DownloadFile" class="button"
                            CommandArgument='<%# Eval("cl_cislo") %>'></asp:Button>  
                    </ItemTemplate>  
                </asp:TemplateField>
                             </Columns>  
        </asp:GridView> 
                
              
      
    </form>
</body>
</html>
