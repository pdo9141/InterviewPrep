define(['jquery', 'toastr', 'utility', 'moment', 'text!../templates/template.html', 'log4javascript', 'stacktrace', 'amplify', 'director'], function ($, toastr, Utils, moment, html, log4js, stacktracer) {

    /********* director handles routing *****************/
    var author = function () { console.log("author"); };
    var books = function () { console.log("books"); };
    var viewBook = function (bookId) {
        console.log("viewBook: bookId is populated: " + bookId);
    };

    var routes = {
        '/author': author,
        '/books': [books, function () {
            console.log("An inline route handler.");
        }],
        '/books/view/:bookId': viewBook
    };

    var router = Router(routes);
    router.init();

    /********* moment handles dates *****************/
    console.log(moment().format('MMMM Do YYYY, h:mm:ss a'));
    console.log(moment().format('MMMM Do YYYY, h:mm:ss a'));
    console.log(moment().format('dddd'));
    console.log(moment().format("MMM Do YY"));
    console.log(moment().format('YYYY [escaped] YYYY'));
    console.log(moment().format());

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

    /********* text.js handles pulling in text files (html, css, etc) *****************/
    $("div#tester6").html(html);

    /********* log4javascript *****************/
    var a = "Hello";
    var b = 3;
    var log = log4js.getDefaultLogger();
    log.info("Hello world");
    log.debug(a, b);

    /********* stacktrace *****************/
    try {
        failcode.fakeMethod();
    } catch (ex) {
        var stackTrace = stacktracer({ e: ex });
        console.log(stackTrace);
    }

});