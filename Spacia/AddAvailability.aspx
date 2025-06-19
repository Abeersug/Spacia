<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddAvailability.aspx.cs" Inherits="Spacia.AddAvailability" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .form-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            background-color: #f5f9fa;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(9, 56, 76, 0.2);
            text-align: center;
        }
        .form-container h2 {
            color: #09384c;
            text-align: center;
            margin-bottom: 25px;
            font-size: 36px; 
            font-weight: bold;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            font-size: 16px;
            color: #09384c;
            display: block;
            margin-bottom: 8px;
        }
        .form-group input[type="text"],
        .form-group input[type="date"],
        .form-group input[type="time"],
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #09384c;
            border-radius: 6px;
        }
        .btn-primary {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            background-color: #09384c;
            color: white;
            padding: 12px 25px;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            text-align: left;
        }
        .btn-primary:hover {
            background-color: #072a3a;
        }
        .message {
            color: lime;
            text-align: center;
            margin-top: 15px;
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

    <div class="form-container">
        <h2>Add Availability</h2>

<div class="form-group">
    <label>Service</label>
    <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        <asp:ListItem>Select Service</asp:ListItem>
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ServiceID], [ServiceName] FROM [Services]"></asp:SqlDataSource>
</div>

<div class="form-group">
    <label>Availability Date</label>
    <asp:TextBox ID="TextBox2" runat="server" TextMode="Date" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
        ControlToValidate="TextBox2"
        ErrorMessage="*"
        ForeColor="Red" Display="Dynamic" />
</div>

<div class="form-group">
    <label>Availability Time</label>
    <asp:TextBox ID="TextBox3" runat="server" TextMode="Time" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
        ControlToValidate="TextBox3"
        ErrorMessage="*"
        ForeColor="Red" Display="Dynamic" />
</div>


        <asp:Button ID="Button1" runat="server" CssClass="btn-primary" Text="Save" OnClick="Button1_Click" />

        <asp:Label ID="Label1" runat="server" CssClass="message"></asp:Label>

        <br />
        <br />
        <a href="Admin1.aspx" class="manage-link">Go To Dashboard</a>
        <a href="AddService.aspx" class="manage-link">Add Service</a>
        <a href="ViewService.aspx" class="manage-link">View Service</a>
    </div>
         

</asp:Content>

