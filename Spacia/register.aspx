<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Spacia.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-container">
        <div class="page-header">
            <h2>Create your account</h2>
        </div>

        <div class="form-group" style="margin-bottom: 15px;">
            <label for="TextBox1">Name:</label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" 
                ErrorMessage="Name is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group" style="margin-bottom: 15px;">
            <label for="TextBox2">Email:</label>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="Email" TextMode="Email" OnTextChanged="TextBox2_TextChanged1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" 
                ErrorMessage="Email is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" 
                ErrorMessage="Invalid email format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.']\w+)*\.\w+([-.']\w+)*" 
                CssClass="validation-error" Display="Dynamic"></asp:RegularExpressionValidator>
        </div>

        <div class="form-group" style="margin-bottom: 15px;">
            <label for="TextBox3">Password:</label>
            <asp:TextBox ID="TextBox3" runat="server" TextMode="Password" CssClass="form-control" 
                placeholder="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" 
                ErrorMessage="Password is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group" style="margin-bottom: 15px;">
            <label for="TextBox4">Confirm Password:</label>
            <asp:TextBox ID="TextBox4" runat="server" TextMode="Password" CssClass="form-control" 
                placeholder="Confirm Password"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox3" ControlToValidate="TextBox4" 
                ErrorMessage="Password not matched" CssClass="validation-error" Display="Dynamic"></asp:CompareValidator>
        </div>

        <div class="form-group" style="margin-bottom: 15px;">
            <label for="TextBox5">Phone:</label>
            <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" placeholder="Phone" TextMode="Phone"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox5" 
                ErrorMessage="Phone is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        </div>

        <div class="form-group">
            <asp:Button ID="Button1" runat="server" Text="Sign Up" OnClick="Button1_Click" 
                CssClass="spacia-btn" />
            <asp:Label ID="Label1" runat="server" CssClass="validation-error" 
                style="display: block; margin-top: 10px; text-align: center;" Visible="false"></asp:Label>
            <br />
            <div style="text-align: center;">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SignIn.aspx">Already have an Account? Sign In</asp:HyperLink>
            </div>
        </div>
    </div>
</asp:Content>
