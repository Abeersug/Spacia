<%@ Page Title="User Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserDashboard.aspx.cs" Inherits="Spacia.UserDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align: center; margin-top: 40px;">
        <h1 style="font-size: 36px; font-weight: bold;">User Dashboard</h1>
    </div>

    <div style="display: flex; justify-content: center; gap: 40px; margin-top: 50px; flex-wrap: wrap;">
      
        <div style="background: #f9f9f9; padding: 30px; border-radius: 15px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); width: 300px; text-align: center;">
            <h2 style="font-size: 24px; font-weight: bold;">User Profile</h2>
            <p style="margin: 15px 0;">View and edit your personal information.</p>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/User Profile.aspx" 
                style="background-color: #003049; color: white; padding: 10px 20px; border-radius: 8px; text-decoration: none; display: inline-block; margin-top: 10px;">
                View Profile
            </asp:HyperLink>
        </div>

        
        <div style="background: #f9f9f9; padding: 30px; border-radius: 15px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); width: 300px; text-align: center;">
            <h2 style="font-size: 24px; font-weight: bold;">User Appointment</h2>
            <p style="margin: 15px 0;">View and manage your appointments.</p>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/UserAppointment.aspx" 
                style="background-color: #003049; color: white; padding: 10px 20px; border-radius: 8px; text-decoration: none; display: inline-block; margin-top: 10px;">
                View Appointments
            </asp:HyperLink>
        </div>
    </div>
</asp:Content>
