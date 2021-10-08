module.exports = {
  mode: 'jit',
  purge: [
    './js/**/*.js',
    '../lib/*_web/**/*.*ex'
  ],
  theme: {
    extend: {
      animation: {
       'new-card1': 'spin 1s 1',
       'new-card2': 'spin 0.5s 1'
      }
    }
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
