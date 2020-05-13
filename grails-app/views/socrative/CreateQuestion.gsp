<!DOCTYPE html>
<html lang="en">

<head>

    <!-- EXTERNAL: Those two CSS Files (style.css) and (particles.css) are my workshop 3 course material -->
    <link rel="stylesheet" type="text/css" href="${resource(file: "particles.css")}" media="screen,projection"/>
    <link rel="stylesheet" type="text/css" href="${resource(file: "style.css")}" media="screen,projection"/>

    <!-- This one is created from scratch -->
    <link rel="stylesheet" type="text/css" href="${resource(file: "stylesheet.css")}"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Add Question</title>
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

                <h1>Create Questions</h1>

                <h3>
                    <label>True or false Question ?</label><input type="checkbox" id="myCheck"
                                                                  onclick="showTrueOrFalse()">

                    <form id="fixedNumberOfChoices" controller="socrative" action="saveQuestion">
                        <label>Question</label><br>
                        <input type="text" key="question" name="question" class="textField" required="required"
                               style="width: 80%"><br> <br>
                        <label>First Alternative</label><br>
                        <input type="text" key="answer1TF" name="answer1TF" class="textField" required="required"
                               style="width: 40%"> <input type="hidden" name="answer1CB" value="0"/> <input
                            type="checkbox" name="answer1CB" value="1" class='myCheckBox'/> Correct answer<br><br>
                        <label>Second Alternative</label><br>

                        <input type="text" key="answer2TF" name="answer2TF" class="textField" required="required"
                               style="width: 40%"> <input type="hidden" name="answer2CB" value="0"/> <input
                            type="checkbox" name="answer2CB" value="1" class='myCheckBox'/> Correct answer <br><br>
                        <label>Third Alternative</label><br>

                        <input type="text" key="answer3TF" name="answer3TF" class="textField" required="required"
                               style="width: 40%"> <input type="hidden" name="answer3CB" value="0"/> <input
                            type="checkbox" name="answer3CB" value="1" class='myCheckBox'/> Correct answer <br><br>
                        <label>Fourth Alternative</label><br>

                        <input type="text" key="answer4TF" name="answer4TF" class="textField" required="required"
                               style="width: 40%"> <input type="hidden" name="answer4CB" value="0"/> <input
                            type="checkbox" name="answer4CB" value="1" class='myCheckBox'/> Correct answer <br> <br>


                        <button style="width: 30%" type="submit" key="save" name="save"
                                onClick=" return !!(checkEmptyTextFieldsAlternatives() & checkSelected() & checkDuplicatedAlternatives())">Save</button>
                        <button style="width: 30%" type="submit" name="addNewQuestion"
                                onClick=" return !!(checkEmptyTextFieldsAlternatives() & checkSelected() & checkDuplicatedAlternatives())">Add Question</button>

                    </form>

                    <form id="trueOrFalse" controller="socrative" action="saveQuestion" style="display: none;">
                        New Question:<br>
                        <input type="text" key="question" class="trueOrFalseQuestion" name="question"
                               id="trueOrFalseQuestion" required="required" style="width: 80%"><br> <br>
                        <label>&nbsp;&nbsp;True&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <input type="hidden" name="answer1CB" value="0"/> <input type="checkbox" name="answer1CB"
                                                                                 value="1"
                                                                                 class='myCheckBox'/> Correct answer<br>
                        <label>&nbsp;&nbsp;False &nbsp;&nbsp;</label>
                        <input type="hidden" name="answer2CB" value="0"/> <input type="checkbox" name="answer2CB"
                                                                                 value="1"
                                                                                 class='myCheckBox'/> Correct answer <br><br>


                        <button style="width: 30%" type="submit" key="save" name="save"
                                onClick=" return !!(checkEmptyQuestionTrueOrFalse() & checkSelected())">Save</button>
                        <button style="width: 30%" type="submit" name="addNewQuestion"
                                onClick=" return !!(checkEmptyQuestionTrueOrFalse() & checkSelected())">Add Question</button>

                    </form>
                </h3>
            </div>
        </div>
    </div>
</div>
</main>





<script type="text/javascript">

    // EXTERNAL: https://www.w3schools.com/howto/howto_js_display_checkbox_text.asp View and hide the true or false form
    function showTrueOrFalse() {
        var trueOrFalseCheckBox = document.getElementById("myCheck");
        var fixedNumberOfChoices = document.getElementById("fixedNumberOfChoices");
        var trueOrFalse = document.getElementById("trueOrFalse");
        if (trueOrFalseCheckBox.checked == true) {
            fixedNumberOfChoices.style.display = "none";
            trueOrFalse.style.display = "block";
        } else {
            fixedNumberOfChoices.style.display = "block";
            trueOrFalse.style.display = "none";
        }
    }


    //checks the empty text fields of both questions and alternative
    function checkEmptyTextFieldsAlternatives() {
        var textFields = document.getElementsByClassName("textField");
        for (var i = 0; i < textFields.length; i++) {
            var regexWhiteSpaces = textFields[i].value.replace(/^\s+/, '').replace(/\s+$/, '');
            if (regexWhiteSpaces === '') {
                alert('Oops, one or more of the text fields are empty');
                return false;
            }
            ;
        }
        ;

        return true;
    }


    //duplicated alternatives are not allowed
    function checkDuplicatedAlternatives() {
        var textFields = document.getElementsByClassName("textField");
        for (var i = 0; i < textFields.length; i++) {
            for (var z = 0; z < textFields.length; z++) {
                if ((textFields[i].value == textFields[z].value) && (i != z)) {
                    alert('Duplication is not allowed ')
                    return false;
                }
            }
        }
        ;

        return true;
    }


    //i had to create a different function to check if the question in the true or false case is empty because it has a different ID
    function checkEmptyQuestionTrueOrFalse() {
        var regexWhiteSpaces = document.getElementById("trueOrFalseQuestion").value.replace(/^\s+/, '').replace(/\s+$/, '');
        if (regexWhiteSpaces === '') {
            alert('Oops, you forgot to enter the question');
            return false;
        }

        return true;
    }


    //not more than one selection is allowed, and also in each question the teacher should select one correct answer,
    // this applies for both true or false and alternatives
    function checkSelected() {
        var checkBoxes = document.getElementsByClassName('myCheckBox');
        var isChecked = false;
        var checkCounter = 0;
        for (var i = 0; i < checkBoxes.length; i++) {
            if (checkBoxes[i].checked) {
                isChecked = true;
                checkCounter++;
            }
            ;
        }
        ;
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