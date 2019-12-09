<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Redaktor.aspx.cs" Inherits="Redaktor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Stránka redaktora</title>

</head>
<body  style="background-color:#4F7D82" ); >
    <form id="form1" runat="server">
        
        <div style= "width:100%; min-height: 300px " >
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Redaktor.png"  /> 
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Logout" BackColor="#0099CC" BorderColor="White" Font-Size="X-Large" ForeColor="White" style="position: relative; top: -30px; left: 33px; height: 54px; width: 217px" />


            <div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="id" OnPageIndexChanging="GridView1_PageIndexChanging" 
                              OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" 
                              OnRowUpdating="GridView1_RowUpdating" ForeColor="White" >  
                    <%-- style="position: relative; top: 245px; left: 305px; width: 876px; margin-top: 1px;" --%>
                    <Columns>  
                        <asp:BoundField DataField="id" HeaderText="Id." /> 
                        <asp:BoundField DataField="Nazev" HeaderText="Název" />  
                
                        <asp:BoundField DataField="Zkontroloval" HeaderText="Zkontroloval" />  
                        <asp:BoundField DataField="Status" HeaderText="Status" />  
                        <asp:BoundField DataField="Vyjadreni" HeaderText="Vyjádřil" />  
                        <asp:CommandField ShowEditButton="true" />  
                        <asp:CommandField ShowDeleteButton="true" />
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">  
                            <ItemTemplate>  
                                <asp:LinkButton ID="lnkDownload" runat="server" Text="Download" OnClick="DownloadFile"  
                                                CommandArgument='<%# Eval("Id") %>'></asp:LinkButton>  
                            </ItemTemplate>  

                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField> 
                    </Columns>  
                    <RowStyle BorderColor="White" />
                </asp:GridView>  
                <%-- style="position: relative; top: 245px; left: 305px; width: 876px; margin-top: 1px;" --%>
                <hr style="color: #FFFFFF; background-color: #FFFFFF" />
            </div>
             

            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="IdClanku" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="IdClanku" HeaderText="IdClanku" ReadOnly="True" SortExpression="IdClanku" />
                    <asp:BoundField DataField="Recenzent1Id" HeaderText="Recenzent1Id" SortExpression="Recenzent1Id" />
                    <asp:BoundField DataField="Recenzent2Id" HeaderText="Recenzent2Id" SortExpression="Recenzent2Id" />
                </Columns>
            </asp:GridView> 
            <div>
                <hr>
                Clanky:&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="vyberClanku" DataTextField="Nazev" DataValueField="id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="vyberClanku" runat="server" ConnectionString="<%$ ConnectionStrings:DB_A503C7_weebsConnectionString %>" SelectCommand="SELECT [id], [Nazev] 
FROM [Clanky] t1 
WHERE NOT EXISTS (SELECT IdClanku FROM   Clanky_recenzenti t2 WHERE t1.id = t2.IdClanku)
"></asp:SqlDataSource>
&nbsp;Recenzent1:
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="vyberRecenzenta" DataTextField="UserName" DataValueField="Id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="vyberRecenzenta" runat="server" ConnectionString="<%$ ConnectionStrings:DB_A503C7_weebsConnectionString %>" SelectCommand="SELECT Id, UserName FROM AspNetUsers WHERE Role = 'Recenzent'"></asp:SqlDataSource>

            &nbsp;Recenzent2:
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="vyberRecenzenta" DataTextField="UserName" DataValueField="Id">
                </asp:DropDownList>
                <br />
                Termín do:&nbsp;&nbsp;&nbsp;
                <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                <br />
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Přiřadit recenzentovi" />
                <asp:Label ID="Label_clanek_check" style="color:black;" runat="server"></asp:Label>

            </div>
            
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Vložení celého čísla časopisu na stránku" Width="297px" />
           

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_A503C7_weebsConnectionString %>" SelectCommand="SELECT * FROM [Clanky_recenzenti]"></asp:SqlDataSource>
            
             <hr/>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="Clanky_stiznosti">
                <Columns>
   
                    <asp:BoundField DataField="Nazev_stiznosti" HeaderText="Nazev_stiznosti" SortExpression="Nazev_stiznosti"></asp:BoundField>
                    <asp:BoundField DataField="Stiznost" HeaderText="Stiznost" SortExpression="Stiznost"></asp:BoundField>
                    <asp:BoundField DataField="Nazev" HeaderText="Nazev" SortExpression="Nazev"></asp:BoundField>
                    <asp:BoundField DataField="mail" HeaderText="e-mail" SortExpression="mail"></asp:BoundField>
                   
                  <asp:TemplateField ItemStyle-HorizontalAlign="Center"> 
                
                    <ItemTemplate>  
                        <asp:LinkButton ID="lnkDelete" runat="server" Text="DELETE" OnClick="GridView3_RowDeleting"  
                            CommandArgument='<%# Eval("Stiznost") %>'></asp:LinkButton>  
                    </ItemTemplate> 
                   
                </asp:TemplateField>
                    
                </Columns>
                
            </asp:GridView>

            <asp:SqlDataSource runat="server" ID="Clanky_stiznosti" ConnectionString='<%$ ConnectionStrings:DB_A503C7_weebsConnectionString %>' SelectCommand="SELECT * FROM [Clanky_Stiznosti]"></asp:SqlDataSource>
        </div>
         </form>
</body>
</html>
