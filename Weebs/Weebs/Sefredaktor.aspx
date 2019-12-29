<%@ Page Language="C#" Theme="Sefredaktor" AutoEventWireup="true" CodeFile="Sefredaktor.aspx.cs" Inherits="Sefredaktor" %>

<!DOCTYPE html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link  rel="stylesheet" type="text/css" href="style.css"/>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server"  >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   

    <title>Šefredaktor</title>
</head>
&nbsp;&nbsp;&nbsp;&nbsp;<body style="background-color:#4F7D82" ><form id="form1" runat="server" >
       
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <h1> Šefredaktor 
           <asp:Button ID="Button9" runat="server" OnClick="Button9_Click" Text="Odhlásit" class="button"  />
       </h1>
       
       &nbsp;&nbsp;&nbsp;&nbsp; <div> <asp:GridView ID="GridView1" Visible="false" runat="server"  
                 
            AutoGenerateColumns="False" CssClass="table"  BorderColor="White" ForeColor="White"  href="#" class="text" >  
            <Columns >  
                <asp:BoundField DataField="Nazev" HeaderText="Název" /> 
                <asp:BoundField DataField="Jmeno" HeaderText="Jméno" />
                <asp:BoundField DataField="Verze" HeaderText="Verze" />
                <asp:BoundField DataField="Zkontroloval" HeaderText="Zkontroloval" />  
                <asp:BoundField DataField="Status" HeaderText="Status" />  
                 <asp:BoundField DataField="Vyjadreni" HeaderText="Vyjádřil" />  
                <asp:TemplateField ItemStyle-HorizontalAlign="Center">  
                    <ItemTemplate>  
                        <asp:LinkButton ID="lnkDownload" runat="server"  ForeColor="White" Text="Download" OnClick="DownloadFile"  
                            CommandArgument='<%# Eval("Id") %>'></asp:LinkButton>  
                    </ItemTemplate>  
                </asp:TemplateField>
                 
            </Columns>  

        </asp:GridView>   
             </div> </br>
     &nbsp;&nbsp;&nbsp;&nbsp;   <div> <asp:Label ID="Label1" runat="server" Text="Redaktor"  href="#" class="text" ></asp:Label>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click"  Text="Zobrazit" href="#" class="button"  /></br>
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Visible="false" href="#" class="button" Text="Skrýt"/></br>
        <asp:GridView ID="GridView2" runat="server" Visible="false"   
              
            AutoGenerateColumns="False" CssClass="table"   BorderColor="White" ForeColor="White">  
            <Columns>  
                <asp:BoundField DataField="IdClanku" HeaderText="IdClanku" /> 
                <asp:BoundField DataField="Recenzent1Id" HeaderText="Recenzent1Id"/>
                <asp:BoundField DataField="Recenzent2Id" HeaderText="Recenzent2Id" />
                <asp:BoundField DataField="Termin" HeaderText="Termin" />   
                          </Columns>  

        </asp:GridView></div></br>
    &nbsp;&nbsp;&nbsp;&nbsp;   <div> <asp:Label ID="Label2" runat="server"  href="#" class="text" Text="Recenzent"></asp:Label>
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click"  href="#" class="button" Text="Zobrazit" /></br>
        <asp:Button ID="Button4" runat="server" Visible="false" OnClick="Button4_Click" href="#" class="button" Text="Skrýt"/></br>
        <asp:GridView ID="GridView3" runat="server" Visible="false" href="#" class="button" 
              
            AutoGenerateColumns="False" CssClass="table"  BorderColor="White" ForeColor="White" >  
            <Columns>  
                <asp:BoundField DataField="id" HeaderText="id"    /> 
                <asp:BoundField DataField="Nazev_stiznosti" HeaderText="Nazev_stiznosti"  />
                <asp:BoundField DataField="Stiznost" HeaderText="Stiznost" />
                <asp:BoundField DataField="Nazev" HeaderText="Nazev" />   
            </Columns>  
        </asp:GridView> </div></br>

        <asp:Label ID="Label3" runat="server"  CssClass="text" Text="Autor" ></asp:Label>           
        <asp:Button ID="Button5" runat="server" OnClick="Button5_Click"  href="#" class="button" Text="Zobrazit" /></br>
        <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" href="#" class="button" Text="Skrýt" Visible="false" /></br>
       
    &nbsp;&nbsp;&nbsp;&nbsp;    <div>
            <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" href="#" class="button" Text="Zobrazit vše"  /></br>
            <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" href="#" class="button"  Text="Skrýt vše" Visible="false" />
        </div>
     
    </form>
    

</body>
</html>
