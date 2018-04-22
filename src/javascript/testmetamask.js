if (typeof web3 == "undefined") {
    $(document).ready(function () {



        //$('body').append('<link rel="stylesheet" href="./src/css/nometamask.css" type="text/css" />');
        console.log("Sadly it looks like you do not have MetaMask installed");

        $.get("./src/html/nometamask.html", function (result) {
            $("body").append(result);
            add_no_metamask_css();
        });

        function add_no_metamask_css() {
            //change the background
            $('#no-metamask-modal').css("position", "fixed");
            $('#no-metamask-modal').css("height", "100%");
            $('#no-metamask-modal').css("padding-top", "100px");
            $('#no-metamask-modal').css("left", "0");
            $('#no-metamask-modal').css("top", "0");
            $('#no-metamask-modal').css("width", "100%");
            $('#no-metamask-modal').css("background-color", "rgb(0, 0, 0)");
            $('#no-metamask-modal').css("background-color", "rgba(0, 0, 0, 0.4)");
            $('#no-metamask-modal').css("z-index", "1");
            //highlight the new content
            $('#modal-content').css("background-color", "white");
            $('#modal-content').css("margin", "auto");
            $('#modal-content').css("padding", "20px");
            $('#modal-content').css("width", "80%");
            $('#modal-content').css("border", "solid #888");
            //Do something special with the close button
            $('#close-modal').css("font-size", "28px");
            $('#close-modal').css("float", "right");
            $('#close-modal').css("font-weight", "bold");
            $('#close-modal').css("color", "#aaaaaa");
            //Change close-model when hovering over it
            $('#close-modal').hover(function () {
                $(this).css("color", "#000", );
            }, function () {
                $(this).css("color", "#aaaaaa");
            });
            //remove modal when x is clicked
            $('#close-modal').click( function() {
                $('#no-metamask-modal').css('display', 'none');
            })
        }
    })
}
else {
    function TestConnected() {
        console.log("Is connected = " + web3.isConnected() + "\n");
    }
    TestConnected()
}