<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Spacia.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-container">
        <div class="page-header">
            <h2>Contact Us</h2>
            <p>Get in touch with our team</p>
        </div>

        <div class="grid-container">
            <div class="card">
                <h3 class="text-primary mb-4">Send us a Message</h3>
                <div class="form-group">
                    <label for="txtName">Your Name</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter your name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" 
                        ErrorMessage="Name is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label for="txtEmail">Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="Enter your email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" 
                        ErrorMessage="Email is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" 
                        ErrorMessage="Invalid email format" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" 
                        CssClass="validation-error" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <label for="txtSubject">Subject</label>
                    <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Enter message subject"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ControlToValidate="txtSubject" 
                        ErrorMessage="Subject is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label for="txtMessage">Message</label>
                    <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" 
                        placeholder="Enter your message"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ControlToValidate="txtMessage" 
                        ErrorMessage="Message is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="text-center mt-4">
                    <asp:Button ID="btnSend" runat="server" Text="Send Message" CssClass="spacia-btn" OnClick="SendMessage_Click" />
                    <asp:Label ID="lblStatus" runat="server" CssClass="validation-error" Visible="false"></asp:Label>
                </div>
            </div>

            <div class="card">
                <h3 class="text-primary mb-4">Contact Information</h3>
                <ul class="list-unstyled">
                    <li class="mb-4">
                        <i class="fas fa-map-marker-alt text-primary"></i>
                        <strong>Address:</strong><br />
                        123 Coworking Street<br />
                        Riyadh, Saudi Arabia
                    </li>
                    <li class="mb-4">
                        <i class="fas fa-phone text-primary"></i>
                        <strong>Phone:</strong><br />
                        +966 12 345 6789
                    </li>
                    <li class="mb-4">
                        <i class="fas fa-envelope text-primary"></i>
                        <strong>Email:</strong><br />
                        <a href="mailto:info@spacia.com" class="link-primary">info@spacia.com</a>
                    </li>
                    <li class="mb-4">
                        <i class="fas fa-clock text-primary"></i>
                        <strong>Hours:</strong><br />
                        Monday - Friday: 8:00 AM - 8:00 PM<br />
                        Saturday - Sunday: 9:00 AM - 5:00 PM
                    </li>
                </ul>
            </div>

            <div class="card">
                <h3 class="text-primary mb-4">Follow Us</h3>
                <div class="text-center">
                    <a href="#" class="link-primary mx-2"><i class="fab fa-facebook fa-2x"></i></a>
                    <a href="#" class="link-primary mx-2"><i class="fab fa-twitter fa-2x"></i></a>
                    <a href="#" class="link-primary mx-2"><i class="fab fa-instagram fa-2x"></i></a>
                    <a href="#" class="link-primary mx-2"><i class="fab fa-linkedin fa-2x"></i></a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
