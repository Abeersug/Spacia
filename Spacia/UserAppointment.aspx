<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserAppointment.aspx.cs" Inherits="Spacia.UserAppointment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align: center; margin-top: 30px;">
        <h1 style="font-size: 36px; font-weight: bold;">View Upcoming and Past Appointments</h1>
    </div>

    <div style="margin-top: 50px; overflow-x: auto; text-align: center;">
        <asp:GridView 
            ID="GridView1" 
            runat="server" 
            AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1"
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
                <asp:BoundField DataField="ServiceName" HeaderText="Service Name" SortExpression="ServiceName" />
                <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
                <asp:BoundField DataField="AppointmentDate" HeaderText="Appointment Date" SortExpression="AppointmentDate" 
                    DataFormatString="{0:MM/dd/yyyy}" />
                <asp:BoundField DataField="AppointmentTime" HeaderText="Appointment Time" SortExpression="AppointmentTime" 
                    DataFormatString="{0:hh:mm tt}" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            </Columns>
        </asp:GridView>
    </div>

    <div style="text-align: center; margin-top: 40px;">
        <asp:Button 
            ID="btnBack" 
            runat="server" 
            Text="Back to Dashboard" 
            PostBackUrl="~/UserDashboard.aspx" 
            Style="background-color: #003345; color: white; padding: 10px 20px; font-size: 16px; border-radius: 8px; border: none; cursor: pointer; transition: background-color 0.3s ease;" />
    </div>
    <br />

    <asp:SqlDataSource 
        ID="SqlDataSource1" 
        runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT Services.ServiceName, Services.Duration, Appointments.AppointmentDate, Appointments.AppointmentTime, Services.Price 
                       FROM Appointments 
                       INNER JOIN Services ON Appointments.ServiceID = Services.ServiceID 
                       WHERE UserID=@x 
                       ORDER BY Appointments.AppointmentDate ASC">
        <SelectParameters>
            <asp:SessionParameter Name="x" SessionField="UserID" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

