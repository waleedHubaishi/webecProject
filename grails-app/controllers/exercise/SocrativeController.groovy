package exercise

class SocrativeController {

    //it is a global variable to keep adding to the same instance of results which will contain one list, static is also an option
    Results results = new Results();

    //one version of test that contains all the questions and keep adding to it if the teacher wants to add a new Question
    Test test = new Test();

    //the id should replace the students name
    int id = 0;

    def index() {

        render view: "HomePage", model: test
    }

    def addQuestion() {
        render view: "CreateQuestion"
    }


    def saveQuestion() {
        Question question = new Question();

        // add the question sentence to the question String inside the question object
        question.question = params.get("question").toString().trim();

        //4 choices fixed
        if (params.containsKey('answer1TF')) {
            for (int i = 1; i < 5; i++) {
                boolean check = false;
                if (params.get("answer" + i + "CB") != "0") {
                    check = true;
                }
                question.answersForQuestion.put(params.get("answer" + i + "TF").toString().trim(), check);
                question.stats.put(params.get("answer" + i + "TF"), 0);
            }
        }
        //true or false
        else {
            question.stats.put("true", 0);
            question.stats.put("false", 0);

            //true is the correct answer
            if (params.get("answer1CB") != "0") {
                question.answersForQuestion.put("true", true);
                question.answersForQuestion.put("false", false);
            }
            //false is the correct answer
            else {
                question.answersForQuestion.put("true", false);
                question.answersForQuestion.put("false", true);
            }
        }

        test.questionsList.add(question)

        if (params.containsKey('save')) {
            redirect(uri: "/socrative/index")
        } else if (params.containsKey('addNewQuestion')) {
            render view: "createQuestion", model: test
        }
    }

    def takeTheTest() {

        def testList = test.questionsList
        render view: "AnswerQuestions", model: [testArrayList: testList]

        //correct exam button is clicked
        if (params.containsKey('correctExam')) {
            Correction correction = new Correction();

            correction.createCorrectAnswersMap(testList);

            for (Object o in params.keySet()) {
                if ((o != "map") && (o != "controller") && (o != "controller") && (o != "format") && (o != "action") && (o != "correctExam")) {

                    //creating the hashmap which contains the student answer to each question
                    correction.studentAnswersMap.put(o, params.get(o));
                }
            }

            Student student = new Student()
            student.id = id
            student.createCorrectlyAnsweredQuestions(correction);

            //this nested for and if conditions get the statistics
            for (int p = 0; p < correction.studentAnswersMap.keySet().size(); p++) {
                for (int k = 0; k < testList.size(); k++) {
                    if (correction.studentAnswersMap.keySet().getAt(p) == testList.get(k).question) {
                        for (int z = 0; z < testList.get(k).stats.keySet().size(); z++) {
                            if (correction.studentAnswersMap.values().getAt(p) == testList.get(k).stats.keySet().getAt(z)) {
                                testList.get(k).stats.put(testList.get(k).stats.keySet().getAt(z), testList.get(k).stats.get(testList.get(k).stats.keySet().getAt(z)) + 1)
                            }
                        }
                    }
                }
            }

            results.addStudent(student)
            id++;
            showStudentsResult(student)
        }
    }

    def showStats() {
        render view: "Statistics", model: [testArrayList: test.questionsList, areThereNoResults: results.studentArrayList.isEmpty()]
    }

    def showStudentsResult(Student student) {

        HashMap<String, String> studentAnsweredQuestions = student.createStudentAnsweredQuestions(test.questionsList);

        render view: "StudentFinalResult", model: [student: student, results: studentAnsweredQuestions, maxGrade: test.questionsList.size(), studentGrade: student.correctlyAnsweredQuestions.size()]
    }
}
