﻿define(['jquery', 'toastr', 'utility', 'amplify'], function ($, toastr, Utils) {

    /********* Basic JQuery and toastr test *****************
    $('div#tester1').html('Hello from the other side!');
    toastr["success"]("Hello there!");
    *********************************************************/

    /********* Use your own custom file as resource *********
    Utils.submitForm();
    Utils.loadMorePosts(9);
    *********************************************************/

    
    var product = { name: "My Cookie Dough" };
    amplify.store("product", product);
    var item = amplify.store("product");
    $('div#tester2').html('Object Product Name: ' + item.name);
    
    amplify.store("product1", "Bolt Cutter");
    var value = amplify.store("product1");
    $('div#tester3').html('KeyValue Product Name: ' + value);
    
    amplify.request.define("easyData", "ajax", {
        url: "Data/easydata.txt",
        dataType: "json",
        type: "GET"
    });

});