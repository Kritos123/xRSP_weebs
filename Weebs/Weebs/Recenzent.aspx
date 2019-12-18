<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Recenzent.aspx.cs" Inherits="Recenzent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="background-image: url('Design_Recenzent.png'); height: 649px; width: 1348px;margin-left:auto;margin-right:auto;margin-bottom:auto;margin-top:auto">
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" BackColor="#0099CC" BorderStyle="Outset" Font-Bold="True" Font-Italic="True" Height="32px" OnClick="Button2_Click" Text="Příspěvky" Width="110px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" BackColor="#0099CC" BorderStyle="Outset" Font-Bold="True" Font-Italic="True" Height="32px" OnClick="Button1_Click" Text="Recenzní formulář" Width="209px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Komunikace" runat="server" BackColor="#0099CC" BorderStyle="Outset" Font-Bold="True" Font-Italic="True" Height="32px" Text="Komunikace" Width="138px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_logout" runat="server" BackColor="#0099CC" BorderStyle="Outset" Font-Bold="True" Font-Italic="True" Height="32px" OnClick="btn_logout_Click" Text="Logout" Width="74px" />
            <br><br><br><br><hr> 

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"> 
                <Columns>
                    <asp:BoundField DataField="IdClanku" HeaderText="IdClanku" SortExpression="IdClanku" />
                    <asp:BoundField DataField="Termin" HeaderText="Termin" SortExpression="Termin" />
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">  
                            <ItemTemplate>  
                                <asp:LinkButton ID="lnkDownload" runat="server" Text="Download" OnClick="DownloadFile"  
                                                CommandArgument='<%# Eval("IdClanku") %>'></asp:LinkButton>  
                            </ItemTemplate>  

                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <br />

            <asp:DropDownList ID="DropDownList1" runat="server" DataTextField="IdClanku" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1" style="position: relative" DataSourceID="SqlDataSource2" DataValueField="IdClanku"></asp:DropDownList>  
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB_A503C7_weebsConnectionString %>" SelectCommand="SELECT [IdClanku] FROM [Clanky_recenzenti]"></asp:SqlDataSource>
            <br />
            <br />
            <div class="form-group row">
                    <label for="ddl_udaj1" id="Label1">Aktuálnost</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="ddl_udaj1" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

            <div class="form-group row">
                    <label for="ddl_udaj2" id="Label2">Originalita</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="ddl_udaj2" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

            <div class="form-group row">
                    <label for="ddl_udaj3" id="Label3">Odborná úroveň</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="ddl_udaj3" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

            <div class="form-group row">
                    <label for="ddl_udaj4" id="Label4">Jazyková a stylistická úroveň</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="ddl_udaj4" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <br />
                    </div>
                </div>
            <asp:Panel ID="Panel_komentar" runat="server" Visible="True">
                    <hr class="border-white" />
                    <div class="form-group row">
                        <label for="tb_komentar" id="Label5">Komentář k článku</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tb_komentar" runat="server" TextMode="MultiLine" Rows="15" Enabled="True"></asp:TextBox>
                            <br />
                        </div>
                    </div>
                </asp:Panel>
            <asp:Button ID="btn_odeslat" runat="server" Text="Odeslat hodnocení článku" OnClick="btn_odeslat_Click" />
        </div>
    </form> 
</body>
</html>
