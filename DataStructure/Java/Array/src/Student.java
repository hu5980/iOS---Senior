public class Student {

    private String name ;
    private  int score ;

    public Student(String studentName, int studentScore){
        name = studentName;
        score = studentScore;
    }

    public  String toString(){
        return String.format("Student name = %s ,score = %d",name,score);
    }

    public static  void main(String[] args){
        Array<Student> arr =  new Array<>();
        arr.addLast(new Student("Jack",90));
        arr.addLast(new Student("Lin",87));
        arr.addLast(new Student("wang",44));
        System.out.println(arr);
    }

}
