<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddService.aspx.cs" Inherits="Spacia.ManageService" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .form-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            background-color: #f5f9fa;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(9, 56, 76, 0.2);
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
        .form-group textarea {
            padding: 10px;
            border: 1px solid #09384c;
            border-radius: 6px;
        }
        .form-group input[type="file"] {
            border: none;
        }
        .btn-primary {
            background-color: #09384c;
            color: white;
            padding: 10px 25px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }
        .btn-primary:hover {
            background-color: #072a3a;
        }
        .message {
            color: #cc3300;
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
        .manage-link:hover {
            background-color: #072a3a;
        }
        </style>

   <div class="form-container">
       <h2>Add Service</h2>

<div class="form-group">
    &nbsp;</div>

<div class="form-group">
    <label>Service Name</label>
    <asp:TextBox ID="TextBox5" runat="server" Width="100%" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox5" ErrorMessage="*" ForeColor="Red" Display="Dynamic" style="font-size: x-large"></asp:RequiredFieldValidator>
</div>

<div class="form-group">
    <label>Duration</label>
    <asp:TextBox ID="TextBox6" runat="server" Width="100%" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox6" ErrorMessage="*" ForeColor="Red" Display="Dynamic" style="font-size: x-large"></asp:RequiredFieldValidator>
</div>

<div class="form-group">
    <label>Price (SR)</label>
    <asp:TextBox ID="TextBox7" runat="server" Width="100%" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox7" ErrorMessage="*" ForeColor="Red" Display="Dynamic" style="font-size: x-large"></asp:RequiredFieldValidator>
</div>

<div class="form-group">
    <label>Service Photo</label>
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="FileUpload1" ErrorMessage="*" ForeColor="Red" Display="Dynamic" style="font-size: x-large"></asp:RequiredFieldValidator>
</div>

<div class="form-group">
    <label>Description</label>
    <asp:TextBox ID="TextBox8" runat="server" TextMode="MultiLine" Rows="5" Width="100%" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox8" ErrorMessage="*" ForeColor="Red" Display="Dynamic" style="font-size: x-large"></asp:RequiredFieldValidator>
</div>


        <div class="text-center">

        <asp:Button ID="Button1" runat="server" CssClass="btn-primary" Text="Save" OnClick="Button1_Click" />

<asp:Label ID="Label1" runat="server" style="color: lime;"></asp:Label>

        <br />

<a href="Admin1.aspx" class="manage-link">Go To Dashboard</a>
    
<a href="ViewService.aspx" class="manage-link">View Service</a>
        <a href="AddAvailability.aspx" class="manage-link">Availability</a></div>
    </div>
</asp:Content>

