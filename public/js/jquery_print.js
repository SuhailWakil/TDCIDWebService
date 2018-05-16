$(function () {
    $("a#print").click(function () {
    //$("span.print").click(function () {
        var contents = $("#printable").html();
        var frame1 = $('<iframe />');
        frame1[0].name = "frame1";
        frame1.css({ "position": "absolute", "top": "-1000000px" });
        $("body").append(frame1);
        var frameDoc = frame1[0].contentWindow ? frame1[0].contentWindow : frame1[0].contentDocument.document ? frame1[0].contentDocument.document : frame1[0].contentDocument;

        frameDoc.document.open();
        //Create a new HTML document.
        frameDoc.document.write('<html><head><title>Details of CheckIn</title>');
        //Append the external CSS file.

        frameDoc.document.write('<link href="public/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />');
        frameDoc.document.write('<link href="public/css/font-awesome.min.css" rel="stylesheet" type="text/css" />');
        frameDoc.document.write('<link href="public/css/owl.carousel.css" rel="stylesheet" type="text/css" />');
        frameDoc.document.write('<link href="public/css/style.css" rel="stylesheet" type="text/css" />');
        frameDoc.document.write('<link href="public/css/googleapis.css" rel="stylesheet" type="text/css" />');

        frameDoc.document.write('<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>');
        frameDoc.document.write('<script type="text/javascript" src="//cdn.rawgit.com/MrRio/jsPDF/master/dist/jspdf.min.js"></script>');

        frameDoc.document.write('</head><body><div id="create_pdf">Create PDF</div><form class="ui form">');
        //Append the DIV contents.
        frameDoc.document.write(contents);
        frameDoc.document.write('</form></body></html>');
               
        frameDoc.document.write('<script type="text/javascript" src="//cdn.rawgit.com/niklasvh/html2canvas/0.5.0-alpha2/dist/html2canvas.min.js"></script>');
        frameDoc.document.write('<script type="text/javascript" src="public/js/pdfconv.js"></script>');
        frameDoc.document.close();

       
        
        setTimeout(function () {
            var win = window.open("", "Title", "toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=780, height=200, top=" + (screen.height - 400) + ", left=" + (screen.width - 840));
            win.document.write(frameDoc.document.documentElement.innerHTML);

        //    window.frames["frame1"].focus();
        //    window.frames["frame1"].print();
        //    frame1.remove();
        }, 1500);
    });
});