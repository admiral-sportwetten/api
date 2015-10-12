module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    concat:
      dist:
        src: ['shared/header.apib', 'modules/*.apib']
        dest: 'dist/aswApi.apib'
    clean:
      build: ['dist/']

  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-clean'

  grunt.registerTask 'default', ['clean:build', 'concat']
