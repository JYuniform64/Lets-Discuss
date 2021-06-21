<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
        integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
        crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.0.1/highlight.min.js"
        integrity="sha512-W7EehcwtSbRF63FIQlXEOOd5mnq0Et0V0nUOvwcUvjnCKgOLLYbqriQxEQSp63sfrkryxIg/A/O8v8O18QwQCQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.0.1/styles/a11y-dark.min.css"
        integrity="sha512-Vj6gPCk8EZlqnoveEyuGyYaWZ1+jyjMPg8g4shwyyNlRQl6d3L9At02ZHQr5K6s5duZl/+YKMnM3/8pDhoUphg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdn.jsdelivr.net/npm/markdown-it-latex2img@latest/dist/markdown-it-latex2img.min.js"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/markdown-it@11.0.0/dist/markdown-it.min.js"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script>hljs.highlightAll();</script>

    <script src="js/upvotejs.vanilla.js"></script>
    <link rel="stylesheet" href="css/upvotejs.css">

    <title>Let's Discuss</title>
</head>
<style>
    .sidebar-wrapper {
        z-index: -1;
        position: fixed;
        left: 175px;
        top: 52px;
        bottom: 0px;
        margin-left: -175px;
        overflow-y: auto;
        background: #222222;
        -webkit-transition: all 0.5s ease;
        -moz-transition: all 0.5s ease;
        -o-transition: all 0.5s ease;
        transition: all 0.5s ease;
    }
</style>
<script>
    $(document).ready(function () {
        $('#navbar').load('navbar.jsp');
        $('#siderbar').load('question_list.jsp');

        if (textarea.addEventListener) {
            textarea.addEventListener('keydown', keyHandler, false);
        } else if (textarea.attachEvent) {
            textarea.attachEvent('onkeydown', keyHandler); /* damn IE hack */
        }
    })

    /* ------------------ Markdown reader ---------------------------- */
    var md = window.markdownit();
    md.use(window.markdownitLatex2img);

    function rendermd() {
        var text = document.getElementById('edit').innerText;
        var result = md.render(text);
        document.getElementById('show').innerHTML = result;
        hljs.highlightAll();
    }

    /* ------------------- Tab support ----------------------------- */
    function keyHandler(e) {
        var TABKEY = 9;
        if (e.keyCode == TABKEY) {
            document.getElementById('edit').innerText += "\t";
            if (e.preventDefault) {
                e.preventDefault();
            }
            return false;
        }
    }
    
    /* ------------------- Vote handler --------------------------- */
    function vote_handler(obj) {

    }
</script>

<body>
    <div id="navbar" class="fixed-top">
    </div>
    <div class="container">
        <div class="row">
            <!-- siderbar: AJAX loaded(question_list.jsp). -->
            <div id="siderbar" class="col-md-3 sidebar-wrapper">
            </div>
            <!-- TODO: detailed question and answers -->
            <div id="main" class="row col-md-9" style="position: absolute; left:25%; width:76%; margin-top: 1em; top: 52px;">
            </div>
        </div>
    </div>
    <!-- TODO: footer -->
</body>

</html>