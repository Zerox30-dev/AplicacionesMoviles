document.addEventListener('DOMContentLoaded', (event) => {
    // Añadir animación de aparición a las secciones
    const sections = document.querySelectorAll('section');
    sections.forEach((section, index) => {
      section.style.opacity = '0';
      section.style.transform = 'translateY(20px)';
      section.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
      
      setTimeout(() => {
        section.style.opacity = '1';
        section.style.transform = 'translateY(0)';
      }, 100 * index);
    });
  
    // Cambiar el color del encabezado al hacer scroll
    window.addEventListener('scroll', () => {
      const header = document.querySelector('header');
      if (window.scrollY > 50) {
        header.style.backgroundColor = '#0056b3';
      } else {
        header.style.backgroundColor = '#007bff';
      }
    });
  });