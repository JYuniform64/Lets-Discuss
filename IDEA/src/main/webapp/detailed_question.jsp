<%-- This jsp file is used for loadding a specified question and its corresponding answers of 'Q&A' page. --%>
<div id="question" class="row">
    <div class="d-flex">
        <div id="question_title" class="p-2 flex-grow-1">
            <h2>What is 'Let's Discuss'?</h2>
        </div>
        <div id="write_answer" class="p-2">
            <input class="btn btn-primary" type="button" value="Write Answer">
        </div>
    </div>
    <div id="question_info" class="small">
        <span id="question_create_date">Question Created: 6/19/21</span>
        <span id="question_edit_date">Modified: 6/21/21</span>
        <span id="question_view">View: 666</span>
    </div>
    <br><br>
    <hr />
    <div class="col-md-1">
        <div class="upvotejs" id="u0">
            <a class="upvote" title="This is good stuff. Vote it up! (Click again to undo)"></a>
            <span class="count" title="Total number of votes">1</span>
            <a class="downvote downvote-on"
                title="This is not useful. Vote it down. (Click again to undo)"></a>
            <a class="star" title="Mark as favorite. (Click again to undo)"></a>
        </div>
        <script>Upvote.create('u0', { count: 5, upvoted: true });</script>
        <!-- Shit... It cannot work properly. Wait for further debugging. Reference: https://github.com/janosgyerik/upvotejs -->
    </div>
    <div class="col-md-11">
        <div id="question_content">
            <pre><code class="language-c hljs"><span class="hljs-meta">#<span class="hljs-keyword">include</span> <span class="hljs-string">&lt;stdio.h&gt;</span></span>
            </code></pre>
            <p>This is something else.</p>
        </div>
    </div>
</div>
<div id="answer_header">
    <hr>
    <h2>Answers</h2>
    <br>
</div>
<div id="answers_id" class="row">
    <div class="col-md-1">
        <div class="upvotejs" id="u0">
            <a class="upvote" title="This is good stuff. Vote it up! (Click again to undo)"></a>
            <span class="count" title="Total number of votes">1</span>
            <a class="downvote downvote-on"
                title="This is not useful. Vote it down. (Click again to undo)"></a>
        </div>
        <script>Upvote.create('u0', { count: 5, upvoted: true });</script>
    </div>
    <div class="col-md-11">
        <div id="question_content">
            <h2>This is a paragraph</h2>
            <ul>
                <li>This is a code block</li>
            </ul>
            <pre><code class="language-c hljs"><span class="hljs-meta">#<span class="hljs-keyword">include</span> <span class="hljs-string">&lt;stdio.h&gt;</span></span>
            </code></pre>
            <p>This is something else.</p>
        </div>
        <br>
        <div id="answer_info" class="d-flex">
            <div class="p-2 flex-grow-1">
                <a href="#">comment</a>
            </div>
            <div class="p-2">
                Answered by: <a id="username" href="#">anonymous</a>
            </div>
        </div>
        <hr>
    </div>
</div>
<div id="answers_id" class="row">
    <div class="col-md-1">
        <div class="upvotejs" id="u0">
            <a class="upvote" title="This is good stuff. Vote it up! (Click again to undo)"></a>
            <span class="count" title="Total number of votes">1</span>
            <a class="downvote downvote-on"
                title="This is not useful. Vote it down. (Click again to undo)"></a>
        </div>
        <script>Upvote.create('u0', { count: 5, upvoted: true });</script>
    </div>
    <div class="col-md-11">
        <div id="question_content">
            <h2>This is a paragraph</h2>
            <ul>
                <li>This is a code block</li>
            </ul>
            <pre><code class="language-c hljs"><span class="hljs-meta">#<span class="hljs-keyword">include</span> <span class="hljs-string">&lt;stdio.h&gt;</span></span>
            </code></pre>
            <p>This is something else.</p>
        </div>
        <br>
        <div id="answer_info" class="d-flex">
            <div class="p-2 flex-grow-1">
                <a href="#">comment</a>
            </div>
            <div class="p-2">
                Answered by: <a id="username" href="#">anonymous</a>
            </div>
        </div>
        <hr>
    </div>
</div>
<div id="answers_id" class="row">
    <div class="col-md-1">
        <div class="upvotejs" id="u0">
            <a class="upvote" title="This is good stuff. Vote it up! (Click again to undo)"></a>
            <span class="count" title="Total number of votes">1</span>
            <a class="downvote downvote-on"
                title="This is not useful. Vote it down. (Click again to undo)"></a>
        </div>
        <script>Upvote.create('u0', { count: 5, upvoted: true });</script>
    </div>
    <div class="col-md-11">
        <div id="question_content">
            <h2>This is a paragraph</h2>
            <ul>
                <li>This is a code block</li>
            </ul>
            <pre><code class="language-c hljs"><span class="hljs-meta">#<span class="hljs-keyword">include</span> <span class="hljs-string">&lt;stdio.h&gt;</span></span>
            </code></pre>
            <p>This is something else.</p>
        </div>
        <br>
        <div id="answer_info" class="d-flex">
            <div class="p-2 flex-grow-1">
                <a href="#">comment</a>
            </div>
            <div class="p-2">
                Answered by: <a id="username" href="#">anonymous</a>
            </div>
        </div>
        <hr>
    </div>
</div>