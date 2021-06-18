<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
        integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/markdown-it/12.0.6/markdown-it.min.js"
        integrity="sha512-7U8vY7c6UQpBNQOnBg3xKX502NAckvk70H1nWvh6W7izA489jEz+RCN3ntT1VMdXewaSKkOrEBegp/h6SPXrjw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.0.1/highlight.min.js"
        integrity="sha512-W7EehcwtSbRF63FIQlXEOOd5mnq0Et0V0nUOvwcUvjnCKgOLLYbqriQxEQSp63sfrkryxIg/A/O8v8O18QwQCQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.0.1/styles/a11y-dark.min.css"
        integrity="sha512-Vj6gPCk8EZlqnoveEyuGyYaWZ1+jyjMPg8g4shwyyNlRQl6d3L9At02ZHQr5K6s5duZl/+YKMnM3/8pDhoUphg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script>hljs.highlightAll();</script>

    <title>Let's Discuss</title>
</head>
<style>
    body {
        font-family: monospace;
    }
</style>
<script>
    $(document).ready(function () {
        $('#navbar').load('navbar.html');
        const textarea = document.getElementById('edit');
        textarea.addEventListener('keyup', rendermd);

        if (textarea.addEventListener) {
            textarea.addEventListener('keydown', keyHandler, false);
        } else if (textarea.attachEvent) {
            textarea.attachEvent('onkeydown', keyHandler); /* damn IE hack */
        }
    })

    /* ------------------ Markdown reader ---------------------------- */
    var md = window.markdownit();

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

</script>

<body>
    <div id="navbar">
    </div>
    <div id="siderbar">
        <div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white" style="width: 380px;">
            <a href="/"
                class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom">
                <svg class="bi me-2" width="30" height="24">
                    <use xlink:href="#bootstrap"></use>
                </svg>
                <span class="fs-5 fw-semibold">List group</span>
            </a>
            <div class="list-group list-group-flush border-bottom scrollarea">
                <a href="#" class="list-group-item list-group-item-action py-3 lh-tight">
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <strong class="mb-1">List group item heading</strong>
                        <small>Wed</small>
                    </div>
                    <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.
                    </div>
                </a>
                <a href="#" class="list-group-item list-group-item-action py-3 lh-tight">
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <strong class="mb-1">List group item heading</strong>
                        <small class="text-muted">Tues</small>
                    </div>
                    <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.
                    </div>
                </a>
            </div>
        </div>
    </div>
    <div id="content">
        <!-- TODO:  -->
        <div id="edit" class="container-md border border-dark" contenteditable="true"></div>
        <div id="show" class="container-md border border-dark"></div>
    </div>
    <!-- TODO: footer -->
</body>

</html>