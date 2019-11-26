<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Redaktor.aspx.cs" Inherits="Redaktor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
            height: 471px;
        }
    </style>
</head>
<body  style="background-color:#4F7D82" ); >
    <form id="form1" runat="server">
        <div>
             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="id" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" ForeColor="White" style="position: relative; top: 245px; left: 305px; width: 876px; margin-top: 1px;">  
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
             <asp:Image ID="Image1" runat="server" ImageUrl="~/Redaktor.png" style="position: relative; top: -105px; left: 15px; width: 252px; height: 77px" />
             <hr style="color: #FFFFFF; background-color: #FFFFFF" />
        </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Logout" BackColor="#0099CC" BorderColor="White" Font-Size="X-Large" ForeColor="White" style="position: relative; top: -95px; left: 33px; height: 54px; width: 217px" />
    </form>
</body>
</html>
