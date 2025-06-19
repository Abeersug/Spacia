<%@ Page Title="User Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="Spacia.UserProfile" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mx-auto py-8 px-4 max-w-3xl">
        <div class="bg-white rounded-lg shadow-lg overflow-hidden">
            <!-- Header with user initials -->
            <div class="bg-[#09384c] py-6 px-6 text-white">
                <div class="flex items-center space-x-4">
                    <div class="w-16 h-16 rounded-full bg-white flex items-center justify-center text-[#09384c] text-2xl font-bold">
                        <asp:Literal ID="litUserInitials" runat="server"></asp:Literal>
                    </div>
                    <div>
                        <h1 class="text-2xl font-semibold">
                            <asp:Literal ID="litUserName" runat="server"></asp:Literal>
                        </h1>
                        <p class="text-sm opacity-80">
                            <asp:Literal ID="litUserEmail" runat="server"></asp:Literal>
                        </p>
                    </div>
                </div>
            </div>
            
            <!-- User Details -->
            <div class="p-6">
                <h2 class="text-xl font-semibold mb-4 border-b pb-2">Account Information</h2>
                
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                    <div>
                        <p class="text-gray-600 text-sm">Full Name</p>
                        <p class="font-medium">
                            <asp:Literal ID="litFullName" runat="server"></asp:Literal>
                        </p>
                    </div>
                    <div>
                        <p class="text-gray-600 text-sm">Email</p>
                        <p class="font-medium">
                            <asp:Literal ID="litEmailAddress" runat="server"></asp:Literal>
                        </p>
                    </div>
                    <div>
                        <p class="text-gray-600 text-sm">Phone Number</p>
                        <p class="font-medium">
                            <asp:Literal ID="litPhoneNumber" runat="server"></asp:Literal>
                        </p>
                    </div>
                    <div>
                        <p class="text-gray-600 text-sm">Account Type</p>
                        <p class="font-medium">
                            <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800">
                                <asp:Literal ID="litUserRole" runat="server"></asp:Literal>
                            </span>
                        </p>
                    </div>
                </div>
                
                <h2 class="text-xl font-semibold mb-4 border-b pb-2">Account Activity</h2>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <p class="text-gray-600 text-sm">Member Since</p>
                        <p class="font-medium">
                            <asp:Literal ID="litCreatedAt" runat="server"></asp:Literal>
                        </p>
                    </div>
                    <div>
                        <p class="text-gray-600 text-sm">Last Login</p>
                        <p class="font-medium">
                            <asp:Literal ID="litLastLogin" runat="server"></asp:Literal>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
