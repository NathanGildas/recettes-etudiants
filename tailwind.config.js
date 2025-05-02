/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './resources/views/**/*.blade.php',
    './resources/js/**/*.js',
    './app/Http/Controllers/**/*.php',
    './lang/**/*.php'
  ],
  theme: {
    extend: {
      colors: {
        primary: {
          DEFAULT: '#FFD700',
          dark: '#FFC000'
        },
        secondary: {
          DEFAULT: '#000000',
          light: '#333333'
        },
        accent: {
          DEFAULT: '#FF6B6B',
          dark: '#FF5252'
        },
        dark: {
          DEFAULT: '#1E1E1E',
          light: '#2D2D2D'
        }
      },
      fontFamily: {
        sans: ['Poppins', 'sans-serif'],
        heading: ['Montserrat', 'sans-serif']
      },
      container: {
        center: true,
        padding: {
          DEFAULT: '1rem',
          sm: '2rem'
        }
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/aspect-ratio')
  ],
  darkMode: 'class'
};