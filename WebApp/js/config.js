// config.js

requirejs.config({
    baseUrl: 'js',
    paths: {
        jquery: [
            'https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min',
            'jsFrameworks/jquery-1.10.2.min'
        ],
        knockout: 'jsFrameworks/knockout-3.4.0',
        toastr: 'jsFrameworks/toastr.min',
        ladda: 'jsFrameworks/ladda.min',
        utility: 'utility',
        amplify: 'jsFrameworks/amplify.min'
    },
    shim: {
        'amplify': {
            deps: ['jquery']                
        }
    }
});