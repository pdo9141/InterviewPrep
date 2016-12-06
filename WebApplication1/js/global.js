define(['jquery', 'toastr', 'utility'], function ($, toastr, Utils) {
    $('h2#tester').html('Hello from the other side!');
    toastr["success"]("Hello there!");

    Utils.submitForm();
    Utils.loadMorePosts(9);
});