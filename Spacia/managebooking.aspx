<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="managebooking.aspx.cs" Inherits="Spacia.managebooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .btn-gray {
            background-color: #d3d3d3;
            border: none;
            padding: 6px 12px;
            font-size: 16px;
            color: black;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn-gray:hover {
            background-color: #bcbcbc;
        }
    </style>

    <h1 class="text-center" style="margin-top: 30px; font-size: 36px; font-weight: bold;">Manage Bookings</h1>

    <div style="overflow-x: auto; margin-top: 40px;">
        <asp:GridView 
            ID="GridView1" 
            runat="server" 
            DataSourceID="SqlDataSource1" 
            AutoGenerateColumns="False" 
            DataKeyNames="AppointmnentID"
            CssClass="table table-bordered"
            HeaderStyle-BackColor="#003345" 
            HeaderStyle-ForeColor="White"
            RowStyle-BackColor="#FAF9F6"
            AlternatingRowStyle-BackColor="White"
            Style="margin: auto; width: 90%; text-align: center; font-size: 18px;">

            <Columns>
                <asp:CommandField 
                    ShowEditButton="True" 
                    ShowDeleteButton="True" 
                    EditText="Edit" 
                    DeleteText="Delete" 
                    HeaderText="Actions"
                    ItemStyle-HorizontalAlign="Center"
                    ButtonType="Button"
                    ControlStyle-CssClass="btn-gray" />
                    
                <asp:BoundField DataField="AppointmnentID" HeaderText="AppointmnentID" InsertVisible="False" ReadOnly="True" SortExpression="AppointmnentID" />
                <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                <asp:BoundField DataField="ServiceID" HeaderText="ServiceID" SortExpression="ServiceID" />
                <asp:BoundField DataField="AppointmentDate" HeaderText="AppointmentDate" SortExpression="AppointmentDate" />
                <asp:BoundField DataField="AppointmentTime" HeaderText="AppointmentTime" SortExpression="AppointmentTime" />
            </Columns>

        </asp:GridView>
    </div>

    <div style="text-align: center; margin-top: 40px;">
        <asp:Button 
            ID="btnDashboard" 
            runat="server" 
            Text="Go To Dashboard" 
            PostBackUrl="~/Admin1.aspx" 
            Style="background-color: #003345; color: white; padding: 10px 20px; font-size: 18px; border-radius: 8px; border: none; cursor: pointer;" />
    </div>

    <asp:SqlDataSource 
        ID="SqlDataSource1" 
        runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Appointments] WHERE [AppointmnentID] = @AppointmnentID" 
        InsertCommand="INSERT INTO [Appointments] ([UserID], [ServiceID], [AppointmentDate], [AppointmentTime]) VALUES (@UserID, @ServiceID, @AppointmentDate, @AppointmentTime)" 
        SelectCommand="SELECT * FROM [Appointments]" 
        UpdateCommand="UPDATE [Appointments] SET [UserID] = @UserID, [ServiceID] = @ServiceID, [AppointmentDate] = @AppointmentDate, [AppointmentTime] = @AppointmentTime WHERE [AppointmnentID] = @AppointmnentID">
        
        <DeleteParameters>
            <asp:Parameter Name="AppointmnentID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UserID" Type="Int32" />
            <asp:Parameter Name="ServiceID" Type="Int32" />
            <asp:Parameter Name="AppointmentDate" Type="String" />
            <asp:Parameter Name="AppointmentTime" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserID" Type="Int32" />
            <asp:Parameter Name="ServiceID" Type="Int32" />
            <asp:Parameter Name="AppointmentDate" Type="String" />
            <asp:Parameter Name="AppointmentTime" Type="String" />
            <asp:Parameter Name="AppointmnentID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
