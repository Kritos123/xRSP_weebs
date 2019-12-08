﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="clanek_delete.aspx.cs" Inherits="clanek_delete" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
              
                  <asp:GridView ID="tabulka" runat="server"   
              
            AutoGenerateColumns="False" CssClass="table" BorderColor="Black" ForeColor="Black" Width="506px">  
            <Columns>  
                <asp:BoundField DataField="cl_nazev" HeaderText="Název" /> 
                <asp:BoundField DataField="cl_cislo" HeaderText="Číslo" />
                <asp:BoundField DataField="cl_datum" HeaderText="Datum vydání" />
                 <asp:CommandField ShowDeleteButton="true" /> 
                <asp:TemplateField ItemStyle-HorizontalAlign="Center"> 
                
                    <ItemTemplate>  
                        <asp:LinkButton ID="lnkDownload" runat="server" Text="Download" OnClick="DownloadFile"  
                            CommandArgument='<%# Eval("cl_cislo") %>'></asp:LinkButton>  
                    </ItemTemplate>  
                </asp:TemplateField>
                 
                 
            </Columns>  
        </asp:GridView> 


        


        </div>
    </form>
</body>
</html>
