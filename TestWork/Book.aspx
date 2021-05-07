<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Book.aspx.cs" Inherits="TestWork.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #TextArea1 {
            height: 139px;
            width: 466px;
        }
        .auto-style1 {
            height: 104px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td>
                        <asp:Label ID="LabelAction" runat="server" Text="Редактирование"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
        <asp:Label ID="LabelID" runat="server" Text="ID"></asp:Label>
                        <br />
            <asp:TextBox ID="TextBoxID" runat="server" TextMode="Number" Width="220px"></asp:TextBox>
                        <br />
                        <br />
            <asp:Label ID="Label2" runat="server" Text="Название"></asp:Label>
                        <br />
            <asp:TextBox ID="TextBoxName" runat="server" Width="220px"></asp:TextBox>
                        <br />
                        <br />
        <asp:Label ID="Label3" runat="server" Text="Автор"></asp:Label>
                        <br />
            <asp:TextBox ID="TextBoxAuthor" runat="server" Width="220px" ></asp:TextBox>
                        <br />
                        <br />
        <asp:Label ID="Label4" runat="server" Text="Год издания"></asp:Label>
                        <br />
            <asp:TextBox ID="TextBoxYear" runat="server" TextMode="Date" Width="220px" ></asp:TextBox>
                        <br />
                        <br />
                        Оглавление<br />
                        <asp:TextBox ID="TextBoxContents" runat="server" Height="120px" TextMode="MultiLine" ValidateRequestMode="Disabled" Width="400px"></asp:TextBox>
                        <br />
                    </td>
                </tr>
            </table>
        </div>
        <p>
            <asp:Button ID="SaveButton" runat="server" Text="Сохранить" OnClick="SaveButton_Click" />
&nbsp;
            <asp:Button ID="CancelButton" runat="server" Text="Отмена" OnClick="CancelButton_Click" />
        &nbsp;
            <asp:Button ID="ButtonDelete" runat="server" OnClick="ButtonDelete_Click" Text="Удалить" />
        </p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:XMLTestConnectionString %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT [id], [name], [author], [year], [contents] FROM [Books] WHERE ([id] = @id)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="1" Name="id" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    <p>
        <asp:Label ID="LabelException" runat="server" Font-Italic="True"></asp:Label>
        </p>
    </form>
    </body>
</html>
