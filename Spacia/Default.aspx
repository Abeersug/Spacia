 <%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Spacia._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <section class="relative h-[80vh]">
        
        <div class="absolute inset-0">
            <img src="Assets/office.jpg" alt="Office Background" class="w-full h-full object-cover">
            <div class="absolute inset-0 bg-gray-900 bg-opacity-50"></div>
        </div>
        
       
        <div class="absolute bottom-0 right-0 p-12 text-center drop-shadow-[0_2px_2px_rgba(0,0,0,0.8)]">
            <h1 class="text-4xl tracking-tight font-extrabold text-white sm:text-5xl md:text-6xl">
                Welcome to SPACIA
            </h1>
            <h2 class="mt-3 text-xl text-gray-200 sm:mt-4">
                Seamless Meeting Spaces, Anytime, Anywhere
            </h2>
            <p class="mt-3 max-w-2xl ml-auto text-gray-300 sm:text-lg md:mt-5 md:text-xl">
                <meta charset="utf-8" />
                <span style="white-space:pre-wrap;">Need a professional space for your next meeting? Spacia offers modern, fully equipped meeting rooms available anytime at two prime locations. Whether you&#39;re hosting a brainstorming session, client meeting, or team workshop, we provide the perfect space with all the essentials you need.</span></p>
            &nbsp;</div>
    </section>

   
    <section class="py-16 bg-white">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <h2 class="text-4xl font-extrabold text-gray-900 text-center mb-8">Our Spaces</h2>
            <div class="relative" id="spaceGallery">
                <div class="overflow-hidden rounded-lg">
                    <div class="relative">
                        <div class="carousel-item active transition-opacity duration-500 ease-in-out">
                            <img src="Assets/office1.jpg" class="w-full h-96 object-cover" alt="Office Space 1">
                        </div>
                        <div class="carousel-item hidden transition-opacity duration-500 ease-in-out">
                            <img src="Assets/office2.jpg" class="w-full h-96 object-cover" alt="Office Space 2">
                        </div>
                        <div class="carousel-item hidden transition-opacity duration-500 ease-in-out">
                            <img src="Assets/office3.jpg" class="w-full h-96 object-cover" alt="Office Space 3">
                        </div>
                    </div>
                    <button class="absolute left-0 top-1/2 transform -translate-y-1/2 bg-white/80 p-2 rounded-r-lg hover:bg-white transition-colors duration-200" type="button" data-bs-target="#spaceGallery" data-bs-slide="prev">
                        <span class="sr-only">Previous</span>
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
                        </svg>
                    </button>
                    <button class="absolute right-0 top-1/2 transform -translate-y-1/2 bg-white/80 p-2 rounded-l-lg hover:bg-white transition-colors duration-200" type="button" data-bs-target="#spaceGallery" data-bs-slide="next">
                        <span class="sr-only">Next</span>
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
                        </svg>
                    </button>
                </div>
            </div>
        </div>
    </section>

    <section class="py-16">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <h2 class="text-4xl font-extrabold text-gray-900 text-center mb-12">Spacia in Numbers</h2>
            <section class="py-16 bg-white">
                <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                    <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
                       
                        <div class="relative bg-gray-50 p-6 rounded-xl shadow-sm">
                            <div class="bg-[#93e7fe] w-12 h-12 flex items-center justify-center rounded-lg mb-4">
                                <svg class="w-6 h-6 text-[#0f0049]" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6"></path>
                                </svg>
                            </div>
                            <h3 class="text-4xl text-[#0f0049] mb-2">500+</h3>
                            <p class="text-gray-600">Meetings Hosted Monthly</p>
                        </div>
    
                        
                        <div class="relative bg-gray-50 p-6 rounded-xl shadow-sm">
                            <div class="bg-[#ffd978] w-12 h-12 flex items-center justify-center rounded-lg mb-4">
                                <svg class="w-6 h-6 text-[#0f0049]" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                                </svg>
                            </div>
                            <h3 class="text-4xl text-[#0f0049] mb-2">24/7</h3>
                            <p class="text-gray-600">Services available 24 hours</p>
                        </div>
    
                        
                        <div class="relative bg-gray-50 p-6 rounded-xl shadow-sm">
                            <div class="bg-[#faa9e4] w-12 h-12 flex items-center justify-center rounded-lg mb-4">
                                <svg class="w-6 h-6 text-[#0f0049]" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14.828 14.828a4 4 0 01-5.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                </svg>
                            </div>
                            <h3 class="text-4xl text-[#0f0049] mb-2">98%</h3>
                            <p class="text-gray-600">Customer satisfaction</p>
                        </div>
    
                        
                        <div class="relative bg-gray-50 p-6 rounded-xl shadow-sm">
                            <div class="bg-[#ffa666] w-12 h-12 flex items-center justify-center rounded-lg mb-4">
                                <svg class="w-6 h-6 text-[#0f0049]" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                </svg>
                            </div>
                            <h3 class="text-4xl text-[#0f0049] mb-2">1</h3>
                            <p class="text-gray-600">prime location</p>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </section>

    <section class="pb-16 bg-white">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8 items-center">
                <div class="flex justify-center">
                    <img src="Assets/croi.png" alt="Client 1" class="h-20 object-contain">
                </div>
                <div class="flex justify-center">
                    <img src="Assets/Nespresso-Logo.png" alt="Client 2" class="h-20 object-contain">
                </div>
                <div class="flex justify-center">
                    <img src="Assets/meed.png" alt="Client 3" class="h-20 object-contain">
                </div>
            </div>
        </div>
    </section>

    <section class="bg-gray-50">
        <div class="max-w-7xl mx-auto">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-0">
                <div class="h-[500px]">
                    <img src="Assets/office.jpg" alt="Meeting Room View" class="w-full h-full object-cover">
                </div>
                <div class="p-12 flex flex-col justify-center">
                    <h2 class="text-4xl font-bold text-[#0f0049] mb-6">
                        A View Of Our Meeting Rooms
                    </h2>
                    <p class="text-gray-600 text-lg">
                        <meta charset="utf-8" />
                        <span style="white-space:pre-wrap;">At SPACIA, we’ve worked hard to ensure our meeting rooms and add-ons are designed for everyone’s comfort, making every booking effortless and enjoyable.</span></p>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
