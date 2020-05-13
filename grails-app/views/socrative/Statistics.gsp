<!DOCTYPE html>
<html lang="en">

<head>

    <!-- EXTERNAL: Those two CSS Files (style.css) and (particles.css) are my workshop 3 course material -->
    <link rel="stylesheet" type="text/css" href="${resource(file: "particles.css")}" media="screen,projection"/>
    <link rel="stylesheet" type="text/css" href="${resource(file: "style.css")}" media="screen,projection"/>

    <!-- This one is created from scratch -->
    <link rel="stylesheet" type="text/css" href="${resource(file: "stylesheet.css")}"/>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Statistics</title>
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

                <h1>Statistics</h1>

                <g:if test="${areThereNoResults == true}">

                    <h3>There are no statistics to show</h3>

                </g:if>

                <g:else>
                    <form controller="socrative" action="showStats" enctype="text/plain" id="fixedNumberOfChoices">

                        <g:each var="question" in="${testArrayList}" status="counter">
                            <h3>
                                <label for="Q${counter + 1}" id="Q${counter + 1}"
                                       value="${testArrayList.get(counter).question}">Q${counter + 1}. ${testArrayList.get(counter).question} ?</label><BR>
                                <g:each var="alternatives" in="${testArrayList.get(counter).stats.keySet()}"
                                        status="counter2">
                                    <g:if test="${testArrayList.get(counter).answersForQuestion.get(testArrayList.get(counter).stats.keySet().getAt(counter2)) == true}">

                                        <label>The alternative (${testArrayList.get(counter).stats.keySet().getAt(counter2)}) was chosen by: ${testArrayList.get(counter).stats.get(testArrayList.get(counter).stats.keySet().getAt(counter2))} Students. (correct Answer)</label><BR>

                                    </g:if>
                                    <g:else>
                                        <label>The alternative (${testArrayList.get(counter).stats.keySet().getAt(counter2)}) was chosen by: ${testArrayList.get(counter).stats.get(testArrayList.get(counter).stats.keySet().getAt(counter2))} Students.</label><BR>
                                    </g:else>
                                </g:each>
                                <BR>
                                <BR>
                            </h3>
                        </g:each>
                    </form>
                </g:else>
            </div>
        </div>
    </div>
</div>
</main>
</body>
</html>