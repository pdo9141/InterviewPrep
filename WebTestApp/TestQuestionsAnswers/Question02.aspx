<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Question02.aspx.cs" Inherits="WebTestApp.TestQuestionsAnswers.Question02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DropDownList ID="DropDownList1" AutoPostBack="true" runat="server"     
            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>

        <asp:GridView ID="GridView1" runat="server" CellPadding="4"
                ForeColor="#333333" GridLines="None"
                AutoGenerateColumns="False"
                EnableViewState="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Column_Name" HeaderText="Column Name" />
                <asp:BoundField DataField="Data_Type" HeaderText="Data Type" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
    </div>
    </form>
</body>
</html>
