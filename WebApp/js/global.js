define(['jquery', 'toastr', 'utility', 'amplify'], function ($, toastr, Utils) {

    /********* Basic JQuery and toastr test *****************
    $('div#tester1').html('Hello from the other side!');
    toastr["success"]("Hello there!");
    *********************************************************/

    /********* Use your own custom file as resource *********
    Utils.submitForm();
    Utils.loadMorePosts(9);
    *********************************************************/

    /********* Use amplifyjs to help work with friendly API for storage (cross-browser)
    ********** and friendly API for retrieving and caching server requests   
    var product = { name: "My Cookie Dough" };
    amplify.store("product", product);
    var item = amplify.store("product");
    $('div#tester2').html('Object Product Name: ' + item.name);
    
    amplify.store("product1", "Bolt Cutter");
    var value = amplify.store("product1");
    $('div#tester3').html('KeyValue Product Name: ' + value);
    
    amplify.request.define("valuesData", "ajax", {
        url: "http://localhost:60920/api/Values",
        dataType: "json",
        type: "GET",
        cache: "persist"
    });

    amplify.request({
        resourceId: "valuesData",
        success: function (data, status) {
            $("div#tester4").html(data);
        },
        error: function (data, status) {
            if (status === "abort") {
                console.log("loading aborted");
            }
            else {
                console.log("error loading products " + status);
            }
        }
    });

    amplify.request.define("valueData", "ajax", {
        url: "http://localhost:60920/api/Values/{id}",
        type: "GET"
    })

    amplify.request("valueData",
        {
            id: "1"
        },
        function (data) {
            $("div#tester5").html(data);
        }
    );
    *********************************************************/
    
});