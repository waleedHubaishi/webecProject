<!DOCTYPE html>
<html lang="en">

<head>

    <!-- EXTERNAL: Those two CSS Files (style.css) and (particles.css) are my workshop 3 course material -->
    <link rel="stylesheet" type="text/css" href="${resource(file: "particles.css")}" media="screen,projection"/>
    <link rel="stylesheet" type="text/css" href="${resource(file: "style.css")}" media="screen,projection"/>

    <!-- This one is created from scratch -->
    <link rel="stylesheet" type="text/css" href="${resource(file: "stylesheet.css")}"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Answer Test</title>
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

                <h1>Answer Those Questions</h1>

                <g:if test="${testArrayList.isEmpty()}">
                    <h3>There are no Questions to show</h3>
                </g:if>

                <g:else>

                    <form controller="socrative" action="takeTheTest" enctype="text/plain" id="fixedNumberOfChoices">

                        <g:each var="question" in="${testArrayList}" status="counter">
                            <h3>

                                <label for="Q${counter + 1}" id="Q${counter + 1}"
                                       value="${testArrayList.get(counter).question}">Q${counter + 1}. ${testArrayList.get(counter).question}</label><BR>
                                <g:if test="${testArrayList.get(counter).answersForQuestion.keySet().toArray().size() == 4}">
                                    <input class="myCheckBox" type="checkbox" id="answerQ${counter + 1}CB1"
                                           name="${testArrayList.get(counter).question}"
                                           value="${testArrayList.get(counter).answersForQuestion.keySet().toArray()[0]}">&nbsp;${testArrayList.get(counter).answersForQuestion.keySet().toArray()[0]}<BR>
                                    <input class="myCheckBox" type="checkbox" id="answerQ${counter + 1}CB2"
                                           name="${testArrayList.get(counter).question}"
                                           value="${testArrayList.get(counter).answersForQuestion.keySet().toArray()[1]}">&nbsp;${testArrayList.get(counter).answersForQuestion.keySet().toArray()[1]}<BR>
                                    <input class="myCheckBox" type="checkbox" id="answerQ${counter + 1}CB3"
                                           name="${testArrayList.get(counter).question}"
                                           value="${testArrayList.get(counter).answersForQuestion.keySet().toArray()[2]}">&nbsp;${testArrayList.get(counter).answersForQuestion.keySet().toArray()[2]}<BR>
                                    <input class="myCheckBox" type="checkbox" id="answerQ${counter + 1}CB4"
                                           name="${testArrayList.get(counter).question}"
                                           value="${testArrayList.get(counter).answersForQuestion.keySet().toArray()[3]}">&nbsp;${testArrayList.get(counter).answersForQuestion.keySet().toArray()[3]}<BR>
                                </g:if>

                                <g:else>
                                    <input class="myCheckBox" type="checkbox" id="cb1Q${counter + 1}"
                                           name="${testArrayList.get(counter).question}"
                                           value="${testArrayList.get(counter).answersForQuestion.keySet().toArray()[0]}">&nbsp;${testArrayList.get(counter).answersForQuestion.keySet().toArray()[0]}<BR>
                                    <input class="myCheckBox" type="checkbox" id="cb2Q${counter + 1}"
                                           name="${testArrayList.get(counter).question}"
                                           value="${testArrayList.get(counter).answersForQuestion.keySet().toArray()[1]}">&nbsp;${testArrayList.get(counter).answersForQuestion.keySet().toArray()[1]}<BR>
                                </g:else>
                            </h3>
                        </g:each>
                        <button type="submit" action="printout" key="correctExam" name="correctExam"
                                onclick="prepareToSubmit()">Correct The Exam</button>

                        <!-- I passed this variable "map" from the controller so that the questions and the student selections
                            are pushed into so that i can access them in the controller, instead of using JSON, AJAX or JQuery to send
                            from the Javascript to the controller. I wouldn't need this if i showed the questions one by one, because then i can
                            take the answers from params directly using the names of the inputs, but because the inputs in this class are generated
                           dynamically and i don't know for sure how much inputs are generated, and to not waste the time with complex regex,
                          i have used this technique.
                        -->
                        <input type="hidden" name="map" id="map"/>
                        <button type="reset" value="Clear Form">Empty All Answers</button>

                    </form>
                </g:else>
            </div>
        </div>
    </div>
</div>
</main>

<script type="text/javascript">

    //because i showed all the questions in one page, rather than showing each question
    // individually - which is much easier as i dont have to care about the variable names and IDs because each time there is only four -
    //i needed this function to gather all answers and questions to send it to the controller
    function prepareToSubmit() {
        var questions = [];
        var answers = [];
        var hash = new Object();

        //get all the questions
        var labels = document.getElementsByTagName('label');
        for (var i = 0; i < labels.length; i++) {
            questions[i] = labels[i].innerHTML.substring(labels[i].innerHTML.indexOf(" ") + 1);
        }

        //get all the answers
        var inputs = document.getElementsByTagName('input');
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].checked == true) {
                //push to avoid having empty indicies
                answers.push(inputs[i].value);
            }
        }

        for (var z = 0; z < questions.length; z++) {

            hash[questions[z]] = answers[z];

        }

        document.getElementById("map").value = hash;
        return true;
    }


    //at the beggening i was trying to not allow the student to select more than one answer, but i thought that in real
    //life, the student has the ability to .. so why restricting him now (evil emoji 3:) )
    function checkSelected() {
        var checkBoxes = document.getElementsByClassName('myCheckBox');
        var isChecked = false;
        var checkCounter = 0;
        var checkedAnswers = [];
        var noRepeatedAnswers = false;

        for (var i = 0; i < checkBoxes.length; i++) {
            if (checkBoxes[i].checked) {
                checkedAnswers.append(checkBoxes[i]);
                //isChecked = true;
                //checkCounter++;
            }
            ;
        }
        ;

        checkedAnswers.sort();

        for (var k = 0; k < checkedAnswers.length; k++) {
            if (k < checkedAnswers.length) {
                var str = checkedAnswers[k].id.toString();
                var match = str.match(/\d+/);

                var secondStr = checkedAnswers[k + 1].id.toString();
                var secondMatch = str.match(/\d+/);

                if (match != secondMatch) {
                    alert('Oops, more than one checkbox were selected');
                    return true;
                }
                else {
                    return true;
                }
            }
        }


        if (checkCounter > 1) {
            alert('Oops, more than one checkbox were selected');
            return false;
        }
        else {
            if (isChecked) {
                return true;
            } else {
                alert('Please, check one checkbox!');
                return false;
            }
        }
    }
</script>

</body>
</html>