<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_del_edit_user.aspx.cs" Inherits="Autor_del_edit_user" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="background-color:#4F7D82">
    <form id="form1" runat="server">
          <div>
                <asp:Label ID="Label1" runat="server" Text="Zde můžete upravit, či odstranit článk"></asp:Label>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" OnPageIndexChanging="GridView1_PageIndexChanging" 
                              OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" 
                              OnRowUpdating="GridView1_RowUpdating" ForeColor="White" >  
                    <Columns>  
                        <asp:BoundField DataField="id" HeaderText="Id." /> 
                        <asp:BoundField DataField="Nazev" HeaderText="Název" />  
                
                        <asp:BoundField DataField="Zkontroloval" HeaderText="Zkontroloval" />  
                        <asp:BoundField DataField="Zkontroloval_2" HeaderText="Zkontroloval" />
                         
                        <asp:CommandField ShowEditButton="true" />  
                        <asp:CommandField ShowDeleteButton="true" />
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">  
                            <ItemTemplate>  
                                <asp:Button ID="lnkDownload" runat="server" Text="Download" OnClick="DownloadFile"  
                                                CommandArgument='<%# Eval("Id") %>'></asp:Button>  
                            </ItemTemplate>  

                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField> 
                    </Columns>  
                    <RowStyle BorderColor="White" />
                </asp:GridView>  
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Zpět" Height="52px" Width="133px" />
                <%-- style="position: relative; top: 245px; left: 305px; width: 876px; margin-top: 1px;" --%>
                <hr style="color: #FFFFFF; background-color: #FFFFFF" />
            </div>
    </form>
</body>
</html>
