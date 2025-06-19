<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewService.aspx.cs" Inherits="Spacia.ViewService" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
    .custom-btn {
        background-color: #d3d3d3;
        color: white;
        border: none;
        padding: 6px 14px;
        border-radius: 6px;
        cursor: pointer;
        font-size: 14px;
        text-decoration: none;
        margin: 0 4px;
        transition: 0.3s;
    }

    .custom-btn:hover {
        background-color: #757a79;
    }

    .grid-title {
        font-size: 36px;
        font-weight: bold;
        color: #09384c;
        margin-bottom: 30px;
    }
        .manage-link {
            display: inline-block;
            margin-top: 25px;
            background-color: #09384c;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            text-decoration: none;
        }
        </style>

<h1 class="text-center grid-title">View Service</h1>

<div align="center">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        CellPadding="4" DataKeyNames="ServiceID" DataSourceID="SqlDataSource1"
        ForeColor="#333333" GridLines="None" Width="1380px" Height="550px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>

            <asp:TemplateField HeaderText="Actions">
                <ItemTemplate>
                    <asp:LinkButton ID="EditButton" runat="server"
                        CommandName="Edit" Text="Edit" CssClass="custom-btn" />
                    <asp:LinkButton ID="DeleteButton" runat="server"
                        CommandName="Delete" Text="Delete" CssClass="custom-btn"
                        OnClientClick="return confirm('Are you sure you want to delete this service?');" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="UpdateButton" runat="server"
                        CommandName="Update" Text="Save" CssClass="custom-btn" />
                    <asp:LinkButton ID="CancelButton" runat="server"
                        CommandName="Cancel" Text="Cancel" CssClass="custom-btn" />
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="ServiceID" HeaderText="ServiceID" ReadOnly="True" SortExpression="ServiceID" />
            <asp:BoundField DataField="ServiceName" HeaderText="ServiceName" SortExpression="ServiceName" />
            <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />

            <asp:ImageField DataImageUrlField="ServicePhoto">
                <ControlStyle Width="100px" Height="100px" />
            </asp:ImageField>

        </Columns>

        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#09384c" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        DeleteCommand="DELETE FROM [Services] WHERE [ServiceID] = @ServiceID"
        InsertCommand="INSERT INTO [Services] ([ServiceID], [ServiceName], [Duration], [Price], [Description], [ServicePhoto]) VALUES (@ServiceID, @ServiceName, @Duration, @Price, @Description, @ServicePhoto)"
        SelectCommand="SELECT [ServiceID], [ServiceName], [Duration], [Price], [Description], [ServicePhoto] FROM [Services]"
        UpdateCommand="UPDATE [Services] SET [ServiceName] = @ServiceName, [Duration] = @Duration, [Price] = @Price, [Description] = @Description, [ServicePhoto] = @ServicePhoto WHERE [ServiceID] = @ServiceID">
        
        <DeleteParameters>
            <asp:Parameter Name="ServiceID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ServiceID" Type="String" />
            <asp:Parameter Name="ServiceName" Type="String" />
            <asp:Parameter Name="Duration" Type="String" />
            <asp:Parameter Name="Price" Type="Double" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="ServicePhoto" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ServiceName" Type="String" />
            <asp:Parameter Name="Duration" Type="String" />
            <asp:Parameter Name="Price" Type="Double" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="ServicePhoto" Type="String" />
            <asp:Parameter Name="ServiceID" Type="String" />
        </UpdateParameters>
        </asp:SqlDataSource>
    <br />
        <a href="Admin1.aspx" class="manage-link">Go To Dashboard</a>
            <a href="AddService.aspx" class="manage-link">Add Service</a>
            <a href="AddAvailability.aspx" class="manage-link">Availability</a></div>

    <br /> 
</asp:Content>

