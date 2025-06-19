<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User Profile.aspx.cs" Inherits="Spacia.User_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <h1 class="text-center" style="margin-top: 30px; font-size: 36px; font-weight: bold;">Profile</h1>

    <div style="overflow-x: auto; margin-top: 40px;">
        <asp:GridView 
            ID="GridView1" 
            runat="server" 
            AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource2" 
            OnRowDataBound="GridView1_RowDataBound"
            CssClass="table table-bordered"
            HeaderStyle-BackColor="#003345" 
            HeaderStyle-ForeColor="White"
            RowStyle-BackColor="#FAF9F6"
            AlternatingRowStyle-BackColor="White"
            GridLines="Both"
            BorderColor="#ddd"
            BorderStyle="Solid"
            BorderWidth="1px"
            CellPadding="10"
            Style="margin: auto; width: 90%; text-align: center; font-size: 18px; border-collapse: collapse;">
        
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            </Columns>

        </asp:GridView>
    </div>

    <div style="text-align: center; margin-top: 40px;">
        <asp:Button 
            ID="btnDashboard" 
            runat="server" 
            Text="Go To Dashboard" 
            PostBackUrl="~/UserDashboard.aspx" 
            Style="background-color: #003345; color: white; padding: 8px 18px; font-size: 16px; border-radius: 8px; border: none; cursor: pointer;" />
    </div>

    <asp:SqlDataSource 
        ID="SqlDataSource2" 
        runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT Name, Email, Password, Phone FROM Users Where UserID=@y">
        <SelectParameters>
            <asp:SessionParameter Name="y" SessionField="UserID" />
        </SelectParameters>
    </asp:SqlDataSource>

    <p>&nbsp;</p>
    <p></p>

</asp:Content>
