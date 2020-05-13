package exercise

class Results {

    static constraints = {
    }

    ArrayList<Student> studentArrayList = new ArrayList<Student>();

    public boolean addStudent(Student student){
        studentArrayList.add(student);
        if(studentArrayList.contains(student)){
            return true
        }
        return false
    }
}
