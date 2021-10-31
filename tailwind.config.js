module.exports = {
  mode: 'jit',
  plugins: [
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/forms')({ strategy: 'class' }),
    require('@tailwindcss/typography')
  ],

  purge: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.erb'
  ],

  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {}
  },
  variants: {
    extend: {}
  }
}
