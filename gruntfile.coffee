module.exports = (grunt) ->
    grunt.initConfig
        pkg: grunt.file.readJSON 'package.json'
        concat:
            dist:
                src: ['shared/header.apib', 'README.md', 'modules/*.apib']
                dest: 'dist/aswApi.apib'
        clean:
            build: ['dist/']
        watch:
            apib:
                files: ['**/*/*.apib', '!dist/aswApi.apib', 'README.md']
                tasks: ['concat']
        run:
            options:
                wait: false
            aglio:
                exec: 'aglio -i dist/aswApi.apib -s'
        copy:
            apiary:
                files:
                    'apiary.apib': ['dist/aswApi.apib']
            backup:
                files:
                    'apiary.apib.back': ['apiary.apib']

    grunt.loadNpmTasks 'grunt-contrib-concat'
    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-run'
    grunt.loadNpmTasks 'grunt-contrib-copy'

    grunt.registerTask 'default', ['clean:build', 'concat', 'run:aglio', 'watch']
    grunt.registerTask 'release', ['clean:build', 'concat', 'copy:backup', 'copy:apiary']
