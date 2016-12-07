// config.js

requirejs.config({
    baseUrl: 'js',
    paths: {
        text: 'jsFrameworks/text',
        jquery: [
            'https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min',
            'jsFrameworks/jquery-1.10.2.min'
        ],
        knockout: 'jsFrameworks/knockout-3.4.0',
        toastr: 'jsFrameworks/toastr.min',
        ladda: 'jsFrameworks/ladda.min',
        utility: 'utility',
        amplify: 'jsFrameworks/amplify.min',
        director: 'jsFrameworks/director.min',
        moment: 'jsFrameworks/moment.min',
        log4javascript: 'jsFrameworks/log4javascript',
        stacktrace: 'jsFrameworks/stacktrace-0.6.4.min'
    },
    shim: {
        'amplify': {
            deps: ['jquery']                
        }
    }
});