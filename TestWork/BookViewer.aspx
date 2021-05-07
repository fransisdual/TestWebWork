<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookViewer.aspx.cs" Inherits="TestWork.BookViewer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="author" HeaderText="author" SortExpression="author" />
                <asp:BoundField DataField="year" HeaderText="year" SortExpression="year" />
                <asp:BoundField DataField="contents" HeaderText="contents" SortExpression="contents" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:Button ID="ButtonAdd" runat="server" OnClick="ButtonAdd_Click" Text="Добавить книгу" />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:XMLTestConnectionString %>" SelectCommand="SELECT * FROM [Books]"></asp:SqlDataSource>
    </form>
</body>
</html>
