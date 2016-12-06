define([], function() {

    var utility = {};

    utility.submitForm = function () {
        alert("submitForm");
    };

    utility.loadMorePosts = function (numOfPosts) {
        alert("load " + numOfPosts + " posts");
    }

    return utility;

});



