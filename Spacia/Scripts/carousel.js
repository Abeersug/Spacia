class Carousel {
    constructor(element) {
        this.carousel = element;
        this.items = Array.from(this.carousel.querySelectorAll('.carousel-item'));
        this.totalItems = this.items.length;
        this.currentIndex = 0;
        
        // Get navigation buttons
        this.prevButton = this.carousel.querySelector('[data-bs-slide="prev"]');
        this.nextButton = this.carousel.querySelector('[data-bs-slide="next"]');
        
        // Bind event listeners
        this.prevButton.addEventListener('click', () => this.prev());
        this.nextButton.addEventListener('click', () => this.next());
        
        // Start auto-sliding
        this.startAutoSlide();
    }
    
    showItem(index) {
        // Hide all items
        this.items.forEach(item => {
            item.classList.add('hidden');
            item.classList.remove('active');
        });
        
        // Show the selected item
        this.items[index].classList.remove('hidden');
        this.items[index].classList.add('active');
        
        // Update current index
        this.currentIndex = index;
    }
    
    next() {
        const nextIndex = (this.currentIndex + 1) % this.totalItems;
        this.showItem(nextIndex);
    }
    
    prev() {
        const prevIndex = (this.currentIndex - 1 + this.totalItems) % this.totalItems;
        this.showItem(prevIndex);
    }
    
    startAutoSlide() {
        setInterval(() => this.next(), 5000); // Change slide every 5 seconds
    }
}

// Initialize carousel when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    const carouselElement = document.getElementById('spaceGallery');
    if (carouselElement) {
        new Carousel(carouselElement);
    }
}); 