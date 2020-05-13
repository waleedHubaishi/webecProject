<!DOCTYPE html>
<html>
<head>

    <!-- EXTERNAL: Those two CSS Files (style.css) and (particles.css) are my workshop 3 course material -->
    <link rel="stylesheet" type="text/css" href="${resource(file: "particles.css")}" media="screen,projection"/>
    <link rel="stylesheet" type="text/css" href="${resource(file: "style.css")}" media="screen,projection"/>

    <!-- This one is created from scratch -->
    <link rel="stylesheet" type="text/css" href="${resource(file: "stylesheet.css")}"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Home</title>
</head>

<body>

<div id="mySidenav" class="sidenav">
    <g:link controller="socrative" action="index">Home</g:link>
    <g:link controller="socrative" action="addQuestion">Add Question</g:link>
    <g:link controller="socrative" action="takeTheTest">Take The Test</g:link>
    <g:link controller="socrative" action="showStats">Statistics</g:link>
</div>


<header class="serenity">
    <div class="container center">
        <h1>Socrative Simulator</h1>
    </div>
</header>

<main id="content">

    <div class="container white center">
        <div class="prtcl-row">
            <div class="col s12 offset-l2 l8">

                <h1>Description</h1>

                <p>
                    This website is a simulator to the famous Socrative Website.
                    At the beginning you as a teacher must enter a question using the add question tap on the left. You may enter
                    the amount of question that you prefer. If you want to enter a true or false question you have to check the
                    checbox at the top of the page.

                    Then you would have to enter the alternative answers that you want to provide.

                    Afterwards you will have to choose the correct alternative, be aware that only one alternative is the correct one,
                    not more than one will be accepted, and if you didn't choose one the website will notify you to.

                    As soon as you are finished wizh filling the required fields, you may click on save to close the page and return
                    to the home page "this page", or click on add Question button to add a new one.

                    Then As a student you would click on take the test tap, in this page you will be able to take the test, only one
                    selection would be acceptable, more than one would count as a wrong answer as well as question with empty choices,
                    after selecting your answers you may click on correct the exam button, to see which questions you answered correctly
                    and your final grade, or click on empty all answers to revoke your selections.

                    You may also afterwards click on statistics tap on the left navigation panel to see which questions were selected by
                    how many students and which were not.
                </p>
            </div>
        </div>
    </div>
</div>
</main>

</body>
</html>