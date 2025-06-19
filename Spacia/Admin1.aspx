<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin1.aspx.cs" Inherits="Spacia.Admin1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <h1 class="text-3xl font-bold text-center mb-8 text-gray-800">Admin Dashboard</h1>

      

       
        <div class="flex flex-wrap gap-6 justify-center mt-10">
            
            
            <div class="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow duration-300 w-80">
                <div class="p-6 text-center">
                    <h3 class="text-xl font-semibold mb-2 text-gray-800">Services Management</h3>
                    <p class="text-gray-600 mb-4">Add, edit, or delete services offered by Spacia.</p>
                    <a href="AddService.aspx" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-white bg-[#09384c] hover:bg-[#072a3a]">
                        Manage Service
                    </a>
                </div>
            </div>

           
            <div class="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow duration-300 w-80">
                <div class="p-6 text-center">
                    <h3 class="text-xl font-semibold mb-2 text-gray-800">User Management</h3>
                    <p class="text-gray-600 mb-4">Manage user accounts and permissions.</p>
                    <a href="ManageUsers.aspx" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-white bg-[#09384c] hover:bg-[#072a3a]">
                        Manage Users
                    </a>
                </div>
            </div>

           
            <div class="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow duration-300 w-80">
                <div class="p-6 text-center">
                    <h3 class="text-xl font-semibold mb-2 text-gray-800">Bookings</h3>
                    <p class="text-gray-600 mb-4">View and manage customer bookings.</p>
                    <a href="managebooking.aspx" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-white bg-[#09384c] hover:bg-[#072a3a]">
                        Manage Bookings
                    </a>
                </div>
            </div>

        </div>
    </div>

</asp:Content>