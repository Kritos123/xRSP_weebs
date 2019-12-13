<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Admin page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body style="background-color:#4F7D82">
    <form id="form1" runat="server">
    
<table ID="header" width="100%">
    <tr>
        <td style="color: #FFFFFF">
           
            Administrátor:</td>
        <td style="align-content: right">
            <p style="color: #FFFFFF"> Jste přihlášen jako: 
                <asp:Label ID="Label2" runat="server"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" Height="33px" OnClick="Button3_Click" Text="Odhlásit" Width="94px" />
            </p>
        </td>
    </tr>
</table>
    
        <p>
        <asp:Button ID="Button1" runat="server" Text="Uživatelé" Width="96px" OnClick="Button1_Click" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Články" Width="100px" OnClick="Button2_Click" />
        </p>
       
        <div></div>

    <div>

        <asp:Label ID="Label1" runat="server" ForeColor="White"></asp:Label>

    </div>
    
    <div>
        <asp:Table class="table table-striped" ID="tabel1" runat="server" ForeColor="White">

        </asp:Table>
    </div>
    

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
    </form>

    
    </body>
</html>
