<!DOCTYPE html>
<html lang="en">

<head>

    <!-- EXTERNAL: Those two CSS Files (style.css) and (particles.css) are my workshop 3 course material -->
    <link rel="stylesheet" type="text/css" href="${resource(file: "particles.css")}" media="screen,projection"/>
    <link rel="stylesheet" type="text/css" href="${resource(file: "style.css")}" media="screen,projection"/>

    <!-- This one is created from scratch -->
    <link rel="stylesheet" type="text/css" href="${resource(file: "stylesheet.css")}"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Final Grade</title>
</head>

<body>

<div id="mySidenav" class="sidenav">
    <g:link class="navTap" controller="socrative" action="index">Home</g:link>
    <g:link class="navTap" controller="socrative" action="addQuestion">Add Question</g:link>
    <g:link class="navTap" controller="socrative" action="takeTheTest">Take The Test</g:link>
    <g:link class="navTap" controller="socrative" action="showStats">Statistics</g:link>
</div>


<header class="serenity">
    <div class="container center">
        <h1>Socrative Simulator</h1>
    </div>
</header>

<main id="content">

    <div class="container white center">
        <div class="prtcl-row">
            <div class="col s12 offset-l2 l8" align="left">

                <h1>Student Grade</h1>

                <form id="fixedNumberOfChoices" controller="socrative" action="saveQuestion">
                    <g:each var="question" in="${results.values()}" status="counter">

                        <h3>
                        <label>Q${counter + 1}. The Question was: ${results.keySet().getAt(counter).toString()}</label><br>
                        <label>and your answer was : ${results.values().getAt(counter).toString()}</label><br><br>
                    </g:each>

                    <br>
                    <label>and your final grade is : ${studentGrade} out of ${maxGrade}</label><br><br>

                </h3>

                </form>
            </div>
        </div>
    </div>
</div>
</main>

<script>

    // EXTERNAL: https://stackoverflow.com/questions/12381563/how-to-stop-browser-back-button-using-javascript?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
    history.pushState(null, document.title, location.href);
    window.addEventListener('popstate', function (event) {
        history.pushState(null, document.title, location.href);
        alert('Sorry, You can not go back from this window, please select a tab to navigate to, or close this window')
    });

</script>

</body>
</html>