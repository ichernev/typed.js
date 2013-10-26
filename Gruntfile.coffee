module.exports = (grunt) ->
  grunt.initConfig
    mochaTest:
      options:
        compilers: 'coffee:coffee-script'
        reporter: 'spec'

      all:
        src: ['test/**/*.coffee']

  grunt.task.loadNpmTasks 'grunt-mocha-test'
  grunt.task.registerTask 'default', ['mochaTest']
